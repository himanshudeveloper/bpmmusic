import 'package:bmp_music/features/library/provider/library_artist_provider.dart';
import 'package:bmp_music/features/song/ui/components/artlist_item_library.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Artist extends ConsumerWidget {
  const Artist({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(libraryartistProvider);
    return artists.when(
        data: (data) {
          return ListView.builder(
              padding: const EdgeInsets.only(left: 2),
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.data!.length,
              itemBuilder: (context, index) {
                return ArtistItemLibrary(
                  name: data.data![index].attributes!.name.toString(),
                  id: data.data![index].id.toString(),
                  image: "",
                );
              });
        },
        error: (err, _) => SizedBox(),
        loading: () => const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ));
  }
}
