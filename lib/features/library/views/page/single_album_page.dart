import 'package:bmp_music/features/library/provider/single_library_album_provider.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/song_item.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SingleAlbumPage extends ConsumerWidget {
  const SingleAlbumPage({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(singlelibraryalbumProvider(id: id));
    return SingleChildScrollView(
      child: albums.when(
          data: (data) {
            return Column(
              children: [
                const SizedBox(height: 15),
                ArtWorkView(
                    url: data.data!.first.attributes!.artwork == null
                        ? ""
                        : data.data!.first.attributes!.artwork!.url.toString(),
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
                          if (data.data!.length == 1) {
                            ref
                                .read(selectedMusicProvider.notifier)
                                .addmusic(song: data.data!.first.toJson());
                          } else {
                            ref
                                .read(selectedMusicProvider.notifier)
                                .addmusiclist(
                                    songs: data.data!
                                        .map((s) => s.toJson())
                                        .toList(),
                                    index: 0);
                          }
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
                          if (data.data!.length == 1) {
                            ref
                                .read(selectedMusicProvider.notifier)
                                .addmusic(song: data.data!.first.toJson());
                          } else {
                            ref
                                .read(selectedMusicProvider.notifier)
                                .addmusiclist(
                                    songs: data.data!
                                        .map((s) => s.toJson())
                                        .toList(),
                                    index: 0);

                            ref
                                .read(selectedMusicProvider.notifier)
                                .startShuffleQueue();
                          }
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
                    itemCount: data.data!.length,
                    itemBuilder: (context, index) {
                      String title =
                          data.data![index].attributes!.name.toString();
                      String artist =
                          data.data![index].attributes!.artistName.toString();
                      String url = data.data![index].attributes!.artwork == null
                          ? ""
                          : data.data![index].attributes!.artwork!.url
                              .toString();

                      return SongItem(
                          isPlaying: false,
                          title: title,
                          artist: artist,
                          onSongTap: () {
                            ref
                                .read(selectedMusicProvider.notifier)
                                .addmusic(song: data.data!.first.toJson());
                          },
                          url: url);
                    })
              ],
            );
          },
          error: (err, _) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
