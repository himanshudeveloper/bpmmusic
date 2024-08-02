// final playbackTimeStreamProvider = StreamProvider<double>((ref) async* {
//   yield* Stream.periodic(const Duration(seconds: 1), (_) {
//     return ref.read(selectedMusicProvider.notifier).getplaybacktime();
//   }).asyncMap((future) => future);
// });
