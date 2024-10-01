import 'package:bmp_music/components/player_progress.dart';
import 'package:bmp_music/features/bpm/notifiers/bpm_notifier.dart';
import 'package:bmp_music/features/bpm/provider/bpm_song_provider.dart';
import 'package:bmp_music/features/bpm/provider/spodify_search_provider.dart';
import 'package:bmp_music/features/song/enums.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/play_pause_button.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

      return extractedString;
    } else {
      print('No match found');
      return "";
    }
  }

  // late DynamicLibrary aubioDll;
  // late AubioBindings aubioBindings;

  // @override
  // void initState() {
  //   aubioDll = aubio_ffi.openAubioDynamicLibrary();
  //   aubioBindings = aubio_ffi.initAubioBindings(dynamicLibrary: aubioDll);
  //   super.initState();
  // }

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

    // print(
    //     "jdjdjdjdjdjjdj${extractImageUrl(songNotifier.currentmusic.artwork!.url)}");
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                extractImageUrl(songNotifier.currentmusic.artwork!.url) == null
                    ? Container(
                        height: MediaQuery.of(context).size.width * 0.6,
                        width: MediaQuery.of(context).size.width * 0.6,
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
                        height: MediaQuery.of(context).size.width * 0.6,
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                const SizedBox(height: 20),
                Text(
                  songNotifier.currentmusic.subtitle.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  songNotifier.currentmusic.title.toString(),
                  style: const TextStyle(fontSize: 16),
                ),

                // Text(
                //   'Provides new_fvec: ${aubioDll.providesSymbol("new_fvec")}',
                // )

                // trailing: IconButton.filledTonal(
                //   onPressed: () {},
                //   icon: const Icon(Icons.more_horiz_rounded),
                //),
                //),
              ],
            ),
          ),
          Column(
            children: [
              bpmValue(name: songNotifier.currentmusic.title.toString()),
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
                          ref.read(selectedMusicProvider.notifier).startrepet();
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
    );
    // },
    //   );
  }
}

class bpmValue extends HookConsumerWidget {
  bpmValue({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spodifysong = ref.watch(searchSpodifyMusicProvider(name));
    final bmp = ref.watch(bmpNotifierprovider);

    return Row(
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
              child: spodifysong.when(
                  data: (spodifydata) {
                    final songbpm = ref.watch(bpmSongProviderProvider(
                        spodifydata.tracks!.items!.first.id.toString()));
                    return songbpm.when(
                        data: (songinfodata) {
                          useEffect(() {
                            print("musiiciciiccicichaneged");
                            ref.read(bmpNotifierprovider).updateSpValue(
                                (songinfodata.tempo!.round()).toInt());
                            int spvalue = songinfodata.tempo!.round().toInt();
                            int value = bmp.value;

                            double newvalue = value / spvalue;

                            // ref
                            //     .read(selectedMusicProvider.notifier)
                            //     .setplackrate(newvalue);
                          }, [songinfodata]);

                          return bmp.checked
                              ? Text(bmp.value.toString())
                              : Text(songinfodata.tempo!.round().toString());
                        },
                        error: (err, _) {
                          return Text(err.toString() + "kkkdk");
                        },
                        loading: () => const CircularProgressIndicator());
                  },
                  error: (err, _) => Text(err.toString()),
                  loading: () => const CircularProgressIndicator()),
              // child:
              //  Text(
              //   //bmp.value.toString(),
              //   "bmp",
              //   style: const TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black,
              //   ),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
