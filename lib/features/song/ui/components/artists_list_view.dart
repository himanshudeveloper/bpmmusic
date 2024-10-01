// import 'package:bmp_music/features/song/models/artists_model.dart';
// import 'package:bmp_music/features/song/ui/components/artist_item.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class ArtistsListView extends ConsumerWidget {
//   const ArtistsListView({required this.artists, super.key});
//   final List<Data> artists;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ListView.builder(
//         itemCount: artists.length,
//         itemBuilder: (context, index) {
//           return ArtistItem(
//               name: artists[index].attributes!.name.toString(),
//               image: artists[index].attributes!.artwork == null
//                   ? ""
//                   : artists[index].attributes!.artwork!.url.toString(),
//               id: artists[index].id.toString());
//         });
//   }
// }
