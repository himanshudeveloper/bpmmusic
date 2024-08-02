import 'package:bmp_music/features/song/models/album_model.dart';
import 'package:bmp_music/features/song/ui/components/album_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumListView extends ConsumerWidget {
  const AlbumListView({required this.albums, super.key});

  final List<Data> albums;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return AlbumItem(
            songname: albums[index].attributes!.name.toString(),
            artistname: albums[index].attributes!.artistName.toString(),
            image: albums[index].attributes!.artwork!.url.toString(),
            id: albums[index].id.toString(),
          );
        });
  }
}
