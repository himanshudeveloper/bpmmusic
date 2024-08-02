import 'package:bmp_music/components/player_progress.dart';
import 'package:bmp_music/features/bpm/notifiers/bpm_notifier.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/play_pause_button.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../utils/color_utils.dart';
import '../../../bpm/ui/screens/bpm_settings_screen.dart';
import '../../notifiers/song_notifier.dart';

class PlayerScreen extends ConsumerStatefulWidget {
  const PlayerScreen({super.key});

  @override
  ConsumerState<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends ConsumerState<PlayerScreen> {
  String? extractFat(String url) {
    final regex = RegExp(r'fat=([^&]+)');
    final match = regex.firstMatch(url);
    if (match != null && match.groupCount > 0) {
      return Uri.decodeComponent(match.group(1)!);
    }

    final regex2 = RegExp(r'aat=([^&]+)');
    final match2 = regex2.firstMatch(url);
    if (match2 != null && match2.groupCount > 0) {
      return Uri.decodeComponent(match2.group(1)!);
    }

    return null;
  }

  String? extractImageUrl(String input) {
    final regex = RegExp(r'fat=([^&]+)');
    final match = regex.firstMatch(input);
    if (match != null && match.groupCount > 0) {
      return Uri.decodeComponent(match.group(1)!);
    }

    final regex2 = RegExp(r'aat=([^&]+)');
    final match2 = regex2.firstMatch(input);
    if (match2 != null && match2.groupCount > 0) {
      return Uri.decodeComponent(match2.group(1)!);
    }
    print("fkfkfkkfkfk$input");
    RegExp regExp = RegExp(r'library/(.*?)/\{w\}x\{h\}');
    Match? match3 = regExp.firstMatch(input);

    if (match != null) {
      String extractedString = match3!.group(1)!;
      print(
          "dkdkkdkd$extractedString"); // Outputs: 124A222D-1F75-48BB-82DB-134390EA80B0
      return extractedString;
    } else {
      print('No match found');
      return "";
    }

    // final RegExp regex = RegExp(r'https://is1-ssl\.mzstatic\.com[^&]*');
    // final match = regex.firstMatch(input);
    // return match?.group(0);
  }

  @override
  Widget build(BuildContext context) {
    final songNotifier = ref.watch(songnNotifierprovider);
    final curentmusic = ref.watch(selectedMusicProvider);
    final bmp = ref.watch(bmpNotifierprovider);

    LoopMode loopMode = songNotifier.loopMode;

    // StreamBuilder<MediaItem?>(
    //   stream: songNotifier.songHandler.mediaItem.stream,
    //   builder: (context, snapshot) {
    //     MediaItem? playingSong = snapshot.data;

    //     String artworkUrl = playingSong?.displayTitle ?? "";

    //     String artist = playingSong?.artist ?? "";

    //     String name = playingSong?.title ?? "";

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    // TextButton(
                    //     onPressed: () async {
                    //       // var appleProvider = AppleAuthProvider();
                    //       // final userCredential = await FirebaseAuth
                    //       //     .instance.currentUser
                    //       //     ?.linkWithProvider(appleProvider);

                    //       // if (user != null) {
                    //       HttpsCallable callable = FirebaseFunctions.instance
                    //           .httpsCallable(
                    //               'exchangeAuthorizationCodeForMusicToken');

                    //       final response = await callable.call({
                    //         'authorizationCode': '',
                    //       });
                    //       print("${response.data}" + "response");
                    //       // }
                    //     },
                    //     child: Text("Music token")),

                    //  Text(songNotifier.currentmusic.artwork!.url),
                    extractImageUrl(songNotifier.currentmusic.artwork!.url) ==
                            null
                        ? Container(
                            height: MediaQuery.of(context).size.width * 0.8,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)
                                // color: Color(int.parse(
                                //     songNotifier.currentmusic.artwork!.bgColor!)
                                //     ),
                                ))
                        : ArtWorkView(
                            url: extractImageUrl(
                                songNotifier.currentmusic.artwork!.url),
                            height: MediaQuery.of(context).size.width * 0.8,
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                    ListTile(
                      subtitle: Text(
                        songNotifier.currentmusic.subtitle.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(songNotifier.currentmusic.title.toString()),
                      // trailing: IconButton.filledTonal(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.more_horiz_rounded),
                      // ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(
                        () => const BPMSettingsScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 700),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: ColorUtils.lightRed,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "BPM",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: ColorUtils.lightGrey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            bmp.value.toString(),
                            //  "bmp",
                            // context.watch<BPMNotifier>().value.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "消費 ：",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorUtils.lightBlack,
                        ),
                      ),
                      Text(
                        "${bmp.value * 5}kcal/時間",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 36.0,
              ),
              child: Column(
                children: [
                  const PlayerProgress(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(selectedMusicProvider.notifier)
                              .startShuffleQueue();
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.yellow, // Border color
                              width: 2.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              songNotifier.shuffle == true
                                  ? Icons.shuffle_on_sharp
                                  : Icons.shuffle_rounded,
                              // color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(selectedMusicProvider.notifier)
                              .skipToPrevious();
                        },
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          size: 40,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const PlayPauseButton(size: 45),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          ref.read(selectedMusicProvider.notifier).skipToNext();
                        },
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (songNotifier.loopMode == LoopMode.off) {
                            ref
                                .read(selectedMusicProvider.notifier)
                                .startrepet();
                          } else if (songNotifier.loopMode == LoopMode.one) {
                            ref
                                .read(selectedMusicProvider.notifier)
                                .startallrepet();
                          } else if (songNotifier.loopMode == LoopMode.all) {
                            ref.read(selectedMusicProvider.notifier).endrepet();
                          }
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.yellow, // Border color
                              width: 2.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              songNotifier.loopMode == LoopMode.one
                                  ? Icons.repeat_one_sharp
                                  : songNotifier.loopMode == LoopMode.all
                                      ? Icons.repeat_on_sharp
                                      : Icons.repeat,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     IconButton(
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.favorite_border_rounded,
            //       ),
            //     ),
            //     const SizedBox(width: 30),
            //     IconButton(
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.list_rounded,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
    // },
    //   );
  }
}
