// import 'package:bmp_music/features/album/notifiers/album_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'album_item.dart';

// class AlbumsListView extends ConsumerWidget {
//   const AlbumsListView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     AlbumNotifier albumNotifier = ref.watch(albumNotifierprovider);
//     final albums = albumNotifier.albums;

//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       physics: const BouncingScrollPhysics(),
//       itemCount: albums.length,
//       itemBuilder: (context, index) {
//         final album = albums[index];

//         return AlbumItem(album: album);
//       },
//     );
//   }
// }
