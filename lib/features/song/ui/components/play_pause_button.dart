import 'package:bmp_music/features/song/providers/selected_music_provider.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../notifiers/song_notifier.dart';

// PlayPauseButton class responsible for displaying a play/pause button
class PlayPauseButton extends ConsumerWidget {
  // Size of the button
  final double? size;

  // Constructor to initialize the PlayPauseButton
  const PlayPauseButton({
    super.key,
    this.size,
  });

  // Build method to create the widget
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SongNotifier songNotifier = ref.watch(songnNotifierprovider);
    final curentmusic = ref.watch(selectedMusicProvider);
    //   final songHandler = songNotifier.songHandler;
    // StreamBuilder listens to changes in the playback state
    // return

    //  StreamBuilder<PlaybackState>(
    //   stream: songHandler.playbackState.stream,
    //   builder: (context, snapshot) {
    // Check if there's data in the snapshot
    //  if (songHandler.playbackState) {
    // Retrieve the playing status from the playback state

    bool playing = curentmusic.isplay;

    // Return an IconButton that toggles play/pause on press
    return IconButton.filledTonal(
      onPressed: () {
        ref.read(selectedMusicProvider.notifier).changemusicstate();
        // Toggle play/pause based on the current playing status
        // if (!playing) {
        //   // songHandler.pause();
        // } else {
        //   // songHandler.play();
        // }
      },
      // Display a play or pause icon based on the playing status
      icon: playing
          ? Icon(
              Icons.pause_rounded,
              size: size,
            )
          : Icon(
              Icons.play_arrow_rounded,
              size: size,
            ),
    );
    // } else {
    //   // If there's no data in the snapshot, return an empty SizedBox
    //   return const SizedBox.shrink();
    // }
    // },
    // );
  }
}
