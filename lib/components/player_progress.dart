import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:bmp_music/features/song/notifiers/song_notifier.dart';
import 'package:bmp_music/features/song/providers/current_duration_provider.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayerProgress extends ConsumerStatefulWidget {
  const PlayerProgress({super.key});

  @override
  ConsumerState<PlayerProgress> createState() => _PlayerProgressState();
}

class _PlayerProgressState extends ConsumerState<PlayerProgress> {
  final Duration _progress = const Duration(minutes: 1);

  String formatDuration(double seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = (seconds % 60).floor();
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$minutes:$formattedSeconds';
  }

  Duration convertToDuration(double seconds) {
    int integerPart = seconds.truncate();

    return Duration(seconds: integerPart);
  }

  @override
  Widget build(BuildContext context) {
    final songNotifier = ref.watch(songnNotifierprovider);
    final asyncValue = ref.watch(playbackTimeStreamProvider);

    return asyncValue.when(
        data: (data) {
          //  print("index:index " + data.toString());
          return ProgressBar(
            // Set the progress to the current position or zero if null
            progress: convertToDuration(data),
            // Set the total duration of the song
            total: Duration(
                milliseconds: songNotifier.currentmusic.item!["attributes"]
                    ["durationInMillis"]),
            // Callback for seeking when the user interacts with the progress bar
            onSeek: (position) {
//print("Seekiinfn " + position.inSeconds.toString());

              ref
                  .read(selectedMusicProvider.notifier)
                  .setplactime(position.inSeconds.toDouble());
              // setState(() {
              //   _progress = position;
              // });
            },
            thumbColor: ColorUtils.darkRed,
            progressBarColor: ColorUtils.lightRed,
          );
        },
        error: (err, _) => Text(err.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
