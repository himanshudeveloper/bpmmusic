import 'dart:async';

import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// final playbackTimeStreamProvider = StreamProvider<double>((ref) async* {
//   Future<double> value;
//   yield* Stream.periodic(const Duration(seconds: 1), (_) {
//     value = ref.read(selectedMusicProvider.notifier).getplaybacktime();
//   }).asyncMap((future) => value);
// });
final playbackTimeStreamProvider = StreamProvider<double>((ref) async* {
  yield* Stream.periodic(const Duration(seconds: 1), (_) {
    return ref.read(selectedMusicProvider.notifier).getplaybacktime();
  }).asyncMap((future) => future);
});
