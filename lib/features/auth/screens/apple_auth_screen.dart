import 'package:bmp_music/features/auth/services/apple_auth_services.dart';
import 'package:bmp_music/features/bpm/services/save_music.dart';
import 'package:bmp_music/features/bpm/services/save_token.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/shared/probvider/token_provider.dart';
import 'package:bmp_music/shared/ui/screens/home_screen.dart';
import 'package:bmp_music/shared/ui/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class AppleAuthScreen extends ConsumerStatefulWidget {
  const AppleAuthScreen({super.key});

  @override
  ConsumerState<AppleAuthScreen> createState() => _AppleAuthScreenState();
}

class _AppleAuthScreenState extends ConsumerState<AppleAuthScreen> {
  String _authStatus = 'Unknown';
  Future<void> initPlugin() async {
    // final status = await AppTrackingTransparency.requestTrackingAuthorization();
    // _authStatus = status.name;

    await ref.read(selectedMusicProvider.notifier).requestpermission();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initPlugin();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const Spacer(),
          Text(
            "音楽ペースメーカー",
            style: GoogleFonts.gothicA1(
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SignInWithAppleButton(onPressed: () async {
              final status =
                  await AppTrackingTransparency.requestTrackingAuthorization();

              _authStatus == status.name;

              print("stststt: " + _authStatus.toString());

              if (_authStatus == "authorized") {
                await AppleAuthServices.signIn().then(
                  (_) async {
                    User? user = FirebaseAuth.instance.currentUser;
                    Fluttertoast.showToast(msg: "please wait...");

                    if (user != null) {
                      String token = await ref
                          .read(selectedMusicProvider.notifier)
                          .devtoken();
                      String musictoken = await ref
                          .read(selectedMusicProvider.notifier)
                          .usertoken(token);

                      saveToken(token);
                      saveMusic(musictoken);

                      Get.offAll(const MainScreen());
                    }
                  },
                );
              } else {
                await showCustomTrackingDialog(context);
                // await Future.delayed(const Duration(milliseconds: 200));
              }
            }),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Future<void> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Dear User'),
          content: const Text(
              "音楽アプリのビートチェンジャーは、メールをローカルに保存してプロフィール ページに表示し、アカウント設定を簡単に管理できるようにします。"
              //'beat changer with music app stores your email locally to \n display it on your profile page, \nhelping you easily manage your account settings.',
              ),
          actions: [
            TextButton(
              onPressed: () async {
                // _authStatus = "authorized";
                // String token =
                //     await ref.read(selectedMusicProvider.notifier).devtoken();
                // String musictoken = await ref
                //     .read(selectedMusicProvider.notifier)
                //     .usertoken(token);

                // saveToken(token);
                // saveMusic(musictoken);

                Navigator.pop(context);

                await AppleAuthServices.signIn().then(
                  (_) async {
                    Fluttertoast.showToast(msg: "please wait...");
                    User? user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      String token = await ref
                          .read(selectedMusicProvider.notifier)
                          .devtoken();
                      String musictoken = await ref
                          .read(selectedMusicProvider.notifier)
                          .usertoken(token);

                      saveToken(token);
                      saveMusic(musictoken);

                      Get.offAll(const MainScreen());
                    }
                  },
                );
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      );
}
