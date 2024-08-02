import 'package:bmp_music/features/album/provider/artist_provider.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/song_item.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArtistScreen extends HookConsumerWidget {
  const ArtistScreen({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();

    final artist = ref.watch(artistProvider(id: id));
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
        ),
        body: artist.when(
            data: (data) {
              return Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.data!.first.attributes!.name.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: () {
                                    ref
                                        .read(selectedMusicProvider.notifier)
                                        .addmusiclist(
                                            songs: data.data!.first.views!
                                                .topSongs!.data!
                                                .map((s) => s.toJson())
                                                .toList(),
                                            index: 0);
                                  },
                                  icon: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 10),
                          ArtWorkView(
                              url: data.data!.first.attributes!.artwork == null
                                  ? ""
                                  : data.data!.first.attributes!.artwork!.url
                                      .toString(),
                              height: 120,
                              width: 120),
                          const SizedBox(height: 10),
                          const Text("Top Songs"),
                          const SizedBox(height: 10),
                          ListView.builder(
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data
                                  .data!.first.views!.topSongs!.data!.length,
                              itemBuilder: (context, index) {
                                return SongItem(
                                    isPlaying: false,
                                    title: data.data!.first.views!.topSongs!
                                        .data![index].attributes!.name
                                        .toString(),
                                    artist: data.data!.first.views!.topSongs!
                                        .data![index].attributes!.artistName
                                        .toString(),
                                    onSongTap: () {
                                      ref
                                          .read(selectedMusicProvider.notifier)
                                          .addmusic(
                                            song: data.data!.first.views!
                                                .topSongs!.data![index]
                                                .toJson(),
                                          );
                                    },
                                    url: data.data!.first.views!.topSongs!
                                        .data![index].attributes!.artwork!.url
                                        .toString());
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (err, _) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
