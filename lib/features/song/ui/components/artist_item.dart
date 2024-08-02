import 'package:bmp_music/features/album/ui/screens/artist_screen.dart';
import 'package:bmp_music/features/library/views/page/single_artist_page.dart';
import 'package:bmp_music/shared/ui/components/artist_artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArtistItem extends ConsumerWidget {
  const ArtistItem(
      {required this.name, required this.image, required this.id, super.key});

  final String image, name, id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ArtistScreen(id: id);
          }));
        },
        title: Text(name),
        // subtitle: const Text("Artist"),
        leading: ArtistArtworkView(
          url: image,
          height: 50,
          width: 50,
        ));
  }
}
