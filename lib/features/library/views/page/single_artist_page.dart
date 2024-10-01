import 'dart:math';

import 'package:bmp_music/features/library/model/library_song_model.dart';
import 'package:bmp_music/features/library/provider/multi_album_song_provider.dart';
import 'package:bmp_music/features/library/provider/single_library_artist_provider.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
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
    // final queitem = ref.watch(queprovider);

    final artists = ref.watch(singlelibraryartistProvider(id: id));
    return artists.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              children: [
                //const SizedBox(height: 70),
                // queitem.when(
                //     data: (qdata) {
                //       return Text(qdata.toString());
                //     },
                //     error: (err, _) => Text(err.toString()),
                //     loading: () => Text("Load")),
                const SizedBox(height: 40),

                ArtWorkView2(
                    width: 70,
                    height: 70,
                    url: data.data!.first.attributes!.artwork!.url.toString()),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.data!.first.attributes!.artistName.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                // data.data!.first.relationships!.tracks!.data!.isEmpty
                //     ? const SizedBox()
                //     :

                Row(
                  children: [
                    const SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          List<String> items = [];

                          for (int i = 0; i < data.data!.length; i++) {
                            items.add(data.data![i].id.toString());
                          }

                          String commaSeparatedString = items.join(',');
                          final modell = await ref
                              .read(libraryRepoProvider)
                              .getmultiplealbumSong(ids: commaSeparatedString);

                          ref.read(selectedMusicProvider.notifier).addmusiclist(
                              songs:
                                  modell.data!.map((s) => s.toJson()).toList(),
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
                        onTap: () async {
                          List<String> items = [];

                          for (int i = 0; i < data.data!.length; i++) {
                            items.add(data.data![i].id.toString());
                          }

                          String commaSeparatedString = items.join(',');
                          final modell = await ref
                              .read(libraryRepoProvider)
                              .getmultiplealbumSong(ids: commaSeparatedString);

                          int randome =
                              Random().nextInt(modell.data!.length - 1);
                          ref.read(selectedMusicProvider.notifier).addmusiclist(
                              songs:
                                  modell.data!.map((s) => s.toJson()).toList(),
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
                          child: const Row(
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
                                url: data.data![index].attributes!.artwork!.url
                                    .toString(),
                                height: 160,
                                width: 160),
                            Text(
                              Utils.stringwithdot(
                                  data.data![index].attributes!.name.toString(),
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
            ));
  }
}
