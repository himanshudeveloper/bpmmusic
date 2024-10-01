import 'package:bmp_music/features/library/provider/single_library_artist_provider.dart';
import 'package:bmp_music/features/library/views/page/single_artist_page.dart';
import 'package:bmp_music/shared/ui/components/artist_artwork_view.dart';
import 'package:bmp_music/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArtistItemLibrary extends ConsumerWidget {
  const ArtistItemLibrary(
      {required this.name, required this.image, required this.id, super.key});

  final String image, name, id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(singlelibraryartistProvider(id: id));
    return ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SingleArtistPage(id: id);
          }));
        },
        title: Text(Utils.stringwithdot(name, 20)),

        // subtitle: const Text("Artist"),
        leading: artists.when(
          data: (data) {
            print("djdddjj${data.data!.first}");
            return SizedBox(
              height: 50,
              width: 50,
              child: ArtistArtworkView(
                url: data.data == null
                    ? ""
                    : data.data!.first.attributes!.artwork!.url.toString(),
                height: 50,
                width: 50,
              ),
            );
          },
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: Colors.pink,
            ),
          ),
        ));
  }
}
