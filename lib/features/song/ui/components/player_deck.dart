import 'package:bmp_music/components/fixed_text_widget.dart';
import 'package:bmp_music/features/bpm/notifiers/bpm_notifier.dart';
import 'package:bmp_music/features/bpm/provider/apply_bpm_provider.dart';
import 'package:bmp_music/features/bpm/provider/bpm_song_provider.dart';
import 'package:bmp_music/features/bpm/provider/spodify_search_provider.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/screens/player_screen.dart';
import 'package:bmp_music/shared/router_controller.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_kit/music_kit.dart';

import '../../notifiers/song_notifier.dart';
import 'play_pause_button.dart';

String lastsong = "";

class PlayerDeck extends HookConsumerWidget {
  const PlayerDeck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bpm = ref.watch(bmpNotifierprovider);
    SongNotifier songNotifier = ref.watch(songnNotifierprovider);

    var musicKit = MusicKit();

    // final curentmusic = ref.watch(selectedMusicProvider);
    // final musciquestream =
    //     ref.watch(selectedMusicProvider.notifier).getmusicsque();
    // final musicstate =
    //     ref.watch(selectedMusicProvider.notifier).getmusicstate();
    // Use StreamBuilder to reactively build UI based on changes to the mediaItem stream

    return StreamBuilder<MusicPlayerQueue?>(
        stream: musicKit.onPlayerQueueChanged,
        // stream: ref.watch(selectedMusicProvider.notifier).getmusicsque(),
        builder: (context, quesnapshot) {
          if (quesnapshot.data != null &&
              lastsong != quesnapshot.data!.currentEntry!.title) {
            //   useEffect(() {
            if (quesnapshot.data!.currentEntry!.title.isNotEmpty) {
              lastsong = quesnapshot.data!.currentEntry!.title;

              if (bpm.checked == false) {
                ref.read(selectedMusicProvider.notifier).setplackrate(1.0);
              } else {
                print("channsnsnsnnsnsnsndndndnnnded");
                ref
                    .watch(applybpmProvider.notifier)
                    .change(quesnapshot.data!.currentEntry!.title.toString());
              }
            }
          }
          // }, [quesnapshot]);

          return StreamBuilder<MusicPlayerState?>(
            stream: musicKit.onMusicPlayerStateChanged,
            builder: (context, snapshot) {
              //  print("musicstatechaned ${snapshot.connectionState.name}");

              if (quesnapshot.data != null) {
                Future.delayed(const Duration(milliseconds: 200), () {
                  // print("duratinnnn${quesnapshot.data!.currentEntry!.item}");

                  songNotifier.currentSong(quesnapshot.data!.currentEntry!);
                });
              }

              if (snapshot.data != null) {
                Future.delayed(const Duration(milliseconds: 200), () {
                  songNotifier.changestate(snapshot.data!);
                });
              }
              MusicPlayerState? state = snapshot.data;
              //MediaItem? playingSong = snapshot.data;
              // If there's no playing song, return an empty widget
              return state == null || quesnapshot.data == null
                  ? const SizedBox.shrink()
                  : state.playbackStatus == MusicPlayerPlaybackStatus.playing
                      ?

                      //const SizedBox.shrink()
                      _buildCard(context, quesnapshot.data!.currentEntry!, ref)
                      :
                      //const SizedBox.shrink();

                      _buildCard(context, quesnapshot.data!.currentEntry!, ref);
            },
          );
        });
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

  // Build the main card widget
  Widget _buildCard(
      BuildContext context, MusicPlayerQueueEntry playingSong, WidgetRef ref) {
    String artist = playingSong.subtitle ?? "";
    String name = playingSong.title ?? "";
    String? url = extractImageUrl(playingSong.artwork!.url);
    final currentroue = ref.watch(routerControllerProvider);
    User? user = FirebaseAuth.instance.currentUser;

    return currentroue == "/PlayerScreen" || user == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ListTile(
                onTap: () {
                  Get.to(
                    () => const PlayerScreen(),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 700),
                  );
                },
                leading: url == null
                    ? const SizedBox()
                    : ArtWorkView(
                        url: url,
                        height: 50,
                        width: 50,
                      ),
                title: FixedTextWidget(text: name, maxCharacters: 10),
                subtitle: FixedTextWidget(text: artist, maxCharacters: 10),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const PlayPauseButton(),
                    IconButton.filledTonal(
                      onPressed: () =>
                          ref.read(selectedMusicProvider.notifier).skipToNext(),
                      icon: const Icon(Icons.skip_next_rounded),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
