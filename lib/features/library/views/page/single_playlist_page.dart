import 'dart:math';

import 'package:bmp_music/features/library/provider/single_librrary_playlist_provider.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/player_deck.dart';
import 'package:bmp_music/features/song/ui/components/song_item.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SinglePlaylistPage extends ConsumerWidget {
  const SinglePlaylistPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleplaylist = ref.watch(singlelibraryplaylistProvider(id: id));
    return Scaffold(
      appBar: AppBar(),
      body: singleplaylist.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5),
                ArtWorkView(
                    url: data.data!.first.relationships!.tracks!.data!.first
                                .attributes!.artwork!.url ==
                            null
                        ? ""
                        : data.data!.first.relationships!.tracks!.data!.first
                            .attributes!.artwork!.url
                            .toString(),
                    height: 220,
                    width: 220),
                const SizedBox(height: 15),
                Text(data.data!.first.attributes!.name.toString()),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          ref.read(selectedMusicProvider.notifier).addmusiclist(
                              songs: data
                                  .data!.first.relationships!.tracks!.data!
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
                          int randome = Random().nextInt(data
                              .data!.first.relationships!.tracks!.data!.length);
                          ref.read(selectedMusicProvider.notifier).addmusiclist(
                              songs: data
                                  .data!.first.relationships!.tracks!.data!
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
                const SizedBox(height: 15),
                ListView.builder(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        data.data!.first.relationships!.tracks!.data!.length,
                    itemBuilder: (context, index) {
                      String title = data.data!.first.relationships!.tracks!
                          .data![index].attributes!.name
                          .toString();
                      String artist = data.data!.first.relationships!.tracks!
                          .data![index].attributes!.artistName
                          .toString();
                      String url = data.data!.first.relationships!.tracks!
                          .data![index].attributes!.artwork!.url
                          .toString();

                      return SongItem(
                          isPlaying: false,
                          title: title,
                          artist: artist,
                          onSongTap: () {
                            ref.read(selectedMusicProvider.notifier).addmusic(
                                song: data.data!.first.relationships!.tracks!
                                    .data![index]
                                    .toJson());
                          },
                          url: url);
                    })
              ],
            ),
          );
        },
        error: (err, _) => Text(err.toString()),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
