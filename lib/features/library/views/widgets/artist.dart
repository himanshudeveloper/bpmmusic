import 'package:bmp_music/features/library/provider/library_artist_provider.dart';
import 'package:bmp_music/features/song/ui/components/artist_item.dart';
import 'package:bmp_music/features/song/ui/components/artlist_item_library.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Artist extends ConsumerWidget {
  const Artist({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(libraryartistProvider);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text("Library"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Artists"),
          ),
          Expanded(
            child: artists.when(
                data: (data) {
                  return ListView.builder(
                      itemCount: data.data!.length,
                      itemBuilder: (context, index) {
                        return ArtistItemLibrary(
                          name: data.data![index].attributes!.name.toString(),
                          id: data.data![index].id.toString(),
                          image: "",
                        );
                      });
                },
                error: (err, _) => Text(err.toString()),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )),
          )
        ],
      ),
    );
  }
}
