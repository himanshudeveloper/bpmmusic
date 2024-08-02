import 'dart:math';

import 'package:bmp_music/features/album/provider/album_provider.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/song_item.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumScreen extends HookConsumerWidget {
  const AlbumScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(albumProvider(id: id));
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: albums.when(
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ArtWorkView(
                      url: data.data!.first.attributes!.artwork!.url.toString(),
                      height: 220,
                      width: 220),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      data.data!.first.attributes!.name.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.data!.first.attributes!.artistName.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
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
                            child: Row(
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
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data
                            .data!.first.relationships!.tracks!.data!.length,
                        itemBuilder: (context, index) {
                          return SongItem(
                              isPlaying: false,
                              title: data.data!.first.relationships!.tracks!
                                  .data![index].attributes!.name
                                  .toString(),
                              artist: data.data!.first.relationships!.tracks!
                                  .data![index].attributes!.artistName
                                  .toString(),
                              onSongTap: () {
                                ref
                                    .read(selectedMusicProvider.notifier)
                                    .addmusic(
                                      type: "library-songs",
                                      song: data.data!.first.relationships!
                                          .tracks!.data![index]
                                          .toJson(),
                                    );
                              },
                              url: data.data!.first.relationships!.tracks!
                                  .data![index].attributes!.artwork!.url
                                  .toString());
                        }),
                  ),
                ],
              ),
            );
          },
          error: (err, _) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
