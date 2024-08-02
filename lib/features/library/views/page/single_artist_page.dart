import 'dart:math';

import 'package:bmp_music/features/library/provider/single_library_artist_provider.dart';
import 'package:bmp_music/features/library/views/page/single_album_page.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/ui/components/artwork_view.dart';

class SingleArtistPage extends ConsumerWidget {
  const SingleArtistPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(singlelibraryartistProvider(id: id));
    return Scaffold(
        body: artists.when(
            data: (data) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      data.data!.first.attributes!.artistName.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(selectedMusicProvider.notifier)
                                  .addmusiclist(
                                      songs: data.data!.first.relationships!
                                          .tracks!.data!
                                          .map((s) => s.toJson())
                                          .toList(),
                                      index: 0);
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.pink,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Play",
                                    style: TextStyle(
                                      color: Colors.pink,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              int randome = Random().nextInt(data.data!.length);
                              ref
                                  .read(selectedMusicProvider.notifier)
                                  .addmusiclist(
                                      songs: data.data!.first.relationships!
                                          .tracks!.data!
                                          .map((s) => s.toJson())
                                          .toList(),
                                      index: randome);
                              ref
                                  .read(selectedMusicProvider.notifier)
                                  .startShuffleQueue();
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shuffle,
                                    color: Colors.pink,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Shuffle",
                                    style: TextStyle(
                                      color: Colors.pink,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GridView.builder(
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.9,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SingleAlbumPage(
                                    id: data.data![index].id.toString());
                              }));
                            },
                            child: Column(
                              children: [
                                ArtWorkView(
                                    url: data
                                        .data![index].attributes!.artwork!.url
                                        .toString(),
                                    height: 160,
                                    width: 160),
                                Text(
                                  Utils.stringwithdot(
                                      data.data![index].attributes!.name
                                          .toString(),
                                      20),
                                ),
                                Text(
                                  Utils.stringwithdot(
                                      data.data![index].attributes!.artistName
                                          .toString(),
                                      20),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              );
            },
            error: (err, _) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
