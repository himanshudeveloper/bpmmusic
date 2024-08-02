import 'dart:math';

import 'package:bmp_music/features/library/provider/library_song_provider.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/song_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Song extends ConsumerWidget {
  const Song({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(librarysongProvider(index: "10"));

    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text("Library"),
        ),
        body: songs.when(
            data: (data) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          final songs =
                              ref.watch(librarysongProvider(index: "20"));
                        },
                        child: Text("Songs")),
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
                                      songs: data.data!
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
                                      songs: data.data!
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
                    ListView.builder(
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.data!.length,
                        itemBuilder: (context, index) {
                          return SongItem(
                              isPlaying: false,
                              title:
                                  data.data![index].attributes!.name.toString(),
                              artist: data.data![index].attributes!.artistName
                                  .toString(),
                              onSongTap: () {
                                ref
                                    .read(selectedMusicProvider.notifier)
                                    .addmusic(song: data.data![index].toJson());
                              },
                              url: data.data![index].attributes!.artwork == null
                                  ? ""
                                  : data.data![index].attributes!.artwork!.url
                                      .toString());
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
