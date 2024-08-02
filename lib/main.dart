import 'package:bmp_music/features/auth/screens/apple_auth_screen.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/shared/probvider/token_provider.dart';
import 'package:bmp_music/shared/ui/screens/main_screen.dart';
import 'package:bmp_music/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// SongHandler _songHandler = SongHandler();

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
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return

        // MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider(
        //       create: (context) => SongNotifier()..assignHandler(_songHandler),
        //     ),
        //     ChangeNotifierProvider(
        //       create: (_) => SearchSongNotifier()..assignHandler(_songHandler),
        //     ),
        //     ChangeNotifierProvider(create: (_) => AlbumNotifier()),
        //     ChangeNotifierProvider(create: (_) => BPMNotifier()..init()),
        //   ],
        // child:

        GetMaterialApp(
      title: "beat runner - with apple music",
      theme: ThemeData(
        colorSchemeSeed: ColorUtils.darkRed,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: const CheckAuthStatus(),
      //   ),
    );
  }
}

class CheckAuthStatus extends ConsumerWidget {
  const CheckAuthStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        User? user = snapshot.data;
        if (user == null) {
          return const AppleAuthScreen();
        } else {
          ref.read(selectedMusicProvider.notifier).requestpermission();

          User? user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            print("logijnngngn");
            ref
                .read(tokenProviderProvider.notifier)
                .checktoken(user.uid, user.email.toString());
          }

          //  String token =
          //           await ref.read(selectedMusicProvider.notifier).devtoken();

          return const MainScreen();
        }
      },
    );
  }
}
