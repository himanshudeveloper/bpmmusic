// import 'package:bmp_music/components/fixed_text_widget.dart';
// import 'package:bmp_music/features/song/notifiers/song_notifier.dart';
// import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
// import 'package:bmp_music/features/song/ui/components/play_pause_button.dart';
// import 'package:bmp_music/features/song/ui/screens/player_screen.dart';
// import 'package:bmp_music/shared/ui/components/artwork_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:music_kit/music_kit.dart';

// class PlayerDeck2 extends ConsumerWidget {
//   const PlayerDeck2({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     SongNotifier songNotifier = ref.watch(songnNotifierprovider);

//     return songNotifier.musicstate == null || songNotifier.currentmusic == null
//         ? const SizedBox.shrink()
//         : songNotifier.musicstate.playbackStatus ==
//                 MusicPlayerPlaybackStatus.playing
//             ?

//             //const SizedBox.shrink()
//             _buildCard(context, songNotifier.currentmusic, ref)
//             :
//             //const SizedBox.shrink();

//             _buildCard(context, songNotifier.currentmusic, ref);
//   }

//   String? extractImageUrl(String input) {
//     final RegExp regex = RegExp(r'https://is1-ssl\.mzstatic\.com[^&]*');
//     final match = regex.firstMatch(input);
//     return match != null ? match.group(0) : null;
//   }

//   // Build the main card widget
//   Widget _buildCard(
//       BuildContext context, MusicPlayerQueueEntry playingSong, WidgetRef ref) {
//     String artist = playingSong.subtitle ?? "";
//     String name = playingSong.title ?? "";
//     String? url = extractImageUrl(playingSong.artwork!.url);

//     //print("urrl: " + url);

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         margin: EdgeInsets.zero,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: ListTile(
//           onTap: () {
//             Get.to(
//               () => PlayerScreen(
//                   //  item: songItems[index]
//                   ),
//               transition: Transition.downToUp,
//               duration: const Duration(milliseconds: 700),
//             );
//             // TODO : Navigate to Player Screen
//           },
//           leading: url == null
//               ? SizedBox()
//               : ArtWorkView(
//                   url: url,
//                   height: 50,
//                   width: 50,
//                 ),
//           title: FixedTextWidget(text: name, maxCharacters: 10),
//           subtitle: FixedTextWidget(text: artist, maxCharacters: 10),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const PlayPauseButton(),
//               IconButton.filledTonal(
//                 onPressed: () =>
//                     ref.read(selectedMusicProvider.notifier).skipToNext(),
//                 icon: const Icon(Icons.skip_next_rounded),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
