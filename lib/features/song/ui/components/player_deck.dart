import 'package:bmp_music/components/fixed_text_widget.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/screens/player_screen.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_kit/music_kit.dart';

import '../../notifiers/song_notifier.dart';
import 'play_pause_button.dart';

class PlayerDeck extends ConsumerWidget {
  const PlayerDeck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SongNotifier songNotifier = ref.watch(songnNotifierprovider);
    // final curentmusic = ref.watch(selectedMusicProvider);
    final musciquestream =
        ref.watch(selectedMusicProvider.notifier).getmusicsque();
    final musicstate =
        ref.watch(selectedMusicProvider.notifier).getmusicstate();
    // Use StreamBuilder to reactively build UI based on changes to the mediaItem stream
    return StreamBuilder(
      stream: musciquestream,
      // stream: ref.watch(selectedMusicProvider.notifier).getmusicsque(),
      builder: (context, quesnapshot) => StreamBuilder<MusicPlayerState?>(
        stream: musicstate,
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
      ),
    );
  }

  String? extractImageUrl(String input) {
    final RegExp regex = RegExp(r'https://is1-ssl\.mzstatic\.com[^&]*');
    final match = regex.firstMatch(input);
    return match?.group(0);
  }

  // Build the main card widget
  Widget _buildCard(
      BuildContext context, MusicPlayerQueueEntry playingSong, WidgetRef ref) {
    String artist = playingSong.subtitle ?? "";
    String name = playingSong.title ?? "";
    String? url = extractImageUrl(playingSong.artwork!.url);

    //print("urrl: " + url);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListTile(
          onTap: () {
            Get.to(
              () => const PlayerScreen(
                  //  item: songItems[index]
                  ),
              transition: Transition.downToUp,
              duration: const Duration(milliseconds: 700),
            );
            // TODO : Navigate to Player Screen
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
