import 'package:bmp_music/features/album/ui/screens/album_screen.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumItem extends ConsumerWidget {
  const AlbumItem(
      {required this.songname,
      required this.image,
      required this.id,
      required this.artistname,
      super.key});

  final String songname, image, id, artistname;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AlbumScreen(id: id);
          }));
        },
        title: Text(songname),
        subtitle: Text("Album . $artistname"),
        leading: ArtWorkView(
          url: image,
          height: 50,
          width: 50,
        ));
  }
}
