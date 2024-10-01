import 'dart:ui';
import 'package:bmp_music/features/bpm/model/audio_detail_model.dart';
import 'package:bmp_music/features/bpm/model/spodify_search_model.dart';
import 'package:bmp_music/features/bpm/notifiers/bpm_notifier.dart';
import 'package:bmp_music/features/bpm/services/bpm_check.dart';
import 'package:bmp_music/features/bpm/services/read_bpm.dart';
import 'package:bmp_music/features/bpm/services/read_spodify_token.dart';
import 'package:bmp_music/services/dio/dio_http_service.dart';
import 'package:music_kit/music_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bmp_music/features/auth/screens/apple_auth_screen.dart';
import 'package:bmp_music/features/auth/screens/my_music_kit_plugin.dart';
import 'package:bmp_music/features/auth/services/apple_auth_services.dart';
import 'package:bmp_music/features/bpm/services/save_music.dart';
import 'package:bmp_music/features/bpm/services/save_token.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/player_deck.dart';
import 'package:bmp_music/shared/Observer.dart';
import 'package:bmp_music/shared/probvider/token_provider.dart';
import 'package:bmp_music/shared/router_controller.dart';
import 'package:bmp_music/shared/ui/screens/main_screen.dart';
import 'package:bmp_music/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

// import 'package:app_tracking_transparency/app_tracking_transparency.dart';
// SongHandler _songHandler = SongHandler();
String lastsong = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform
      );
  // _songHandler = await AudioService.init(
  //   builder: () => SongHandler(),
  //   config: const AudioServiceConfig(
  //     androidNotificationChannelId: 'com.musicpacemaker.app',
  //     androidNotificationChannelName: 'Music Pacemaker',
  //     androidNotificationOngoing: true,
  //     androidShowNotificationBadge: true,
  //   ),
  // );
  await initializeService();

  runApp(const ProviderScope(child: MainApp()));
}

void startBackgroundService() {
  final service = FlutterBackgroundService();
  service.startService();
}

void stopBackgroundService() {
  final service = FlutterBackgroundService();
  service.invoke("stop");
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
      autoStart: true,
      onStart: onStart,
      isForegroundMode: false,
      autoStartOnBoot: true,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  var musicKit = MusicKit();
  await Firebase.initializeApp();

  musicKit.onPlayerQueueChanged.listen((quesnapshot) async {
    if (quesnapshot.currentEntry != null &&
        lastsong != quesnapshot.currentEntry!.title) {
      //   useEffect(() {
      if (quesnapshot.currentEntry!.title.isNotEmpty) {
        lastsong = quesnapshot.currentEntry!.title;

        bool check = await readCheck() ?? false;

        if (check == false) {
          musicKit.setPlaybackRate(1.0);
        } else {
          print("channsnsnsnnsnsnsndndndnnnded");
          String token = await readsp();

          final data = await dioservice.get(
              "search?q=${quesnapshot.currentEntry!.title}&type=track&limit=1",
              customBaseUrl: "https://api.spotify.com/v1/",
              customtoken: token);
          final SpodifySearchModel songs = SpodifySearchModel.fromJson(data);
          final songinfo = await dioservice.get(
              "audio-features/${songs.tracks!.items!.first.id.toString()}",
              customBaseUrl: "https://api.spotify.com/v1/",
              customtoken: token);
          final AudioDetail songsinfodata = AudioDetail.fromJson(songinfo);
          int bpmvalue = await readBPM() ?? 100;
          double value = bpmvalue / songsinfodata.tempo!.round();
          musicKit.setPlaybackRate(value);

          // ref
          //     .watch(applybpmProvider.notifier)
          //     .change(quesnapshot.data!.currentEntry!.title.toString());
        }
      }
    }
    Fluttertoast.showToast(msg: "Music Chaned");
    FirebaseFirestore.instance
        .collection("hekli")
        .doc(Uuid().v4())
        .set(({"changed": true}));
  });
}

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      title: "beat changer with music app",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,

      home: const CheckAuthStatus(),
      navigatorObservers: [MyRouteObserver(ref: ref)],

      builder: (context, child) {
        String currentRoute = Get.currentRoute;
        print("dkdkdkkdkdkdkcurrent $currentRoute");
        return Scaffold(
          // drawer: Column(
          //   children: [
          //     const SizedBox(height: 40),
          //     Padding(
          //       padding: const EdgeInsets.all(18.0),
          //       child: _buildProfile(),
          //     ),
          //     _otherSettings(context),
          //   ],
          // ),

          bottomSheet: const SizedBox(height: 100, child: PlayerDeck()

              // builder: (value) {
              //   print("fkfkfkfkfkfkkmmvmvm${value.page}");
              //   return value.page == "/PlayerScreen"
              //       ? SizedBox()
              //       : const PlayerDeck();
              // }
              ),

          // appBar: AppBar(
          //   title: Text("data"),
          // ), // the common thing.
          body: child,
        );
      },
      //   ),
    );
  }
}

class CheckAuthStatus extends ConsumerWidget {
  const CheckAuthStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? user = FirebaseAuth.instance.currentUser;
    return user == null ? const AppleAuthScreen() : const MainScreen();
  }
}
