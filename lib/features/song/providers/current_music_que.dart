// import 'dart:async';

// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:music_kit/music_kit.dart';

// final queprovider = StreamProvider.autoDispose<MusicPlayerQueue?>(
//   (ref) {
//     final controller = StreamController<MusicPlayerQueue>();
//     var musicKit = MusicKit();

//     musicKit.onPlayerQueueChanged.listen((snap) {
//       print("kdkdkdkdkdkkdkdkdkdk");
//       controller.sink.add(snap);
//     });

//     ref.onDispose(() {
//       // sub.cancel();
//       controller.close();
//     });

//     return controller.stream;
//   },
// );
