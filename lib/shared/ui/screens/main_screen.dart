import 'dart:convert';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:bmp_music/features/auth/screens/apple_auth_screen.dart';
import 'package:bmp_music/features/bpm/model/spodify_token_model.dart';
import 'package:bmp_music/features/bpm/repo/bpm_repo.dart';
import 'package:bmp_music/features/bpm/services/read_music.dart';
import 'package:bmp_music/features/bpm/services/save_music.dart';
import 'package:bmp_music/features/bpm/services/save_spodify_token.dart';
import 'package:bmp_music/features/bpm/services/save_token.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/shared/probvider/token_provider.dart';
import 'package:bmp_music/shared/ui/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:music_kit/music_kit.dart';
import 'package:http/http.dart' as http;

import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends StatefulHookConsumerWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  String _authStatus = 'Unknown';

  @override
  void initState() {
    super.initState();

    request();
  }

  void request() async {
    DateTime specificDate = DateTime(2024, 11, 30);

    DateTime currentDate = DateTime.now();

    if (currentDate.isBefore(specificDate)) {
      String? musictoken = await readMusic();

      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var request = http.Request(
          'POST', Uri.parse('https://accounts.spotify.com/api/token'));
      request.bodyFields = {
        'grant_type': 'client_credentials',
        'client_id': 'ca6a47b4f1f9449083cfa4ae80c6a551',
        'client_secret': '31c9fd7065004bf69972f908f9d2516e',
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Sucesss");
        String valueee = await response.stream.bytesToString();

        var parsedJson = jsonDecode(valueee);

        // Access the 'access_token' from the parsed JSON
        String accessToken = parsedJson['access_token'];

        savesp(accessToken);

        // final SpodifyTokenModel = await ref.watch(bpmRepoProvider).gettoken();
        // Fluttertoast.showToast(msg: SpodifyTokenModel.accessToken.toString());

        if (musictoken.isNotEmpty) {
          Future.delayed(const Duration(seconds: 1), () {
            Get.offAll(() => const HomeScreen());
          });
        } else {
          User? user = FirebaseAuth.instance.currentUser;

          final MusicAuthorizationStatus status = await ref
              .read(selectedMusicProvider.notifier)
              .requestpermission();

          if (user != null) {
            if (status == const MusicAuthorizationStatus.denied()) {
              final MusicAuthorizationStatus status = await ref
                  .read(selectedMusicProvider.notifier)
                  .requestpermission();
              String token =
                  await ref.read(selectedMusicProvider.notifier).devtoken();
              String musictoken = await ref
                  .read(selectedMusicProvider.notifier)
                  .usertoken(token);

              saveToken(token);
              saveMusic(musictoken);

              Get.offAll(() => const HomeScreen());
            } else {
              String token =
                  await ref.read(selectedMusicProvider.notifier).devtoken();
              String musictoken = await ref
                  .read(selectedMusicProvider.notifier)
                  .usertoken(token);

              saveToken(token);
              saveMusic(musictoken);

              Get.offAll(() => const HomeScreen());
            }
          } else {
            Get.offAll(() => const AppleAuthScreen());
          }
        }
      } else {
        Fluttertoast.showToast(msg: "Failure");

        print(response.reasonPhrase);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please Contact App Developer @ codewithhk607@gmail.com");

      print('The date is before or on August 18, 2024');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }

  Future<void> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Dear User'),
          content: const Text(
            '音楽アプリのビートチェンジャーは、メールをローカルに保存してプロフィール ページに表示し、アカウント設定を簡単に管理できるようにします。',
          ),
          actions: [
            TextButton(
              onPressed: () async {
                _authStatus = "authorized";
                User? user = FirebaseAuth.instance.currentUser;

                ref.read(selectedMusicProvider.notifier).requestpermission();

                if (user != null) {
                  String token =
                      await ref.read(selectedMusicProvider.notifier).devtoken();
                  String musictoken = await ref
                      .read(selectedMusicProvider.notifier)
                      .usertoken(token);

                  saveToken(token);
                  saveMusic(musictoken);

                  Get.offAll(() => const HomeScreen());
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      );
}
