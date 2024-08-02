import 'package:bmp_music/features/song/models/top_result_model.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/album_item.dart';
import 'package:bmp_music/features/song/ui/components/artist_item.dart';
import 'package:bmp_music/features/song/ui/components/song_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopResultView extends ConsumerWidget {
  const TopResultView({required this.topresults, super.key});
  final List<Data> topresults;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: topresults.length,
        itemBuilder: (context, index) {
          Data data = topresults[index];
          return data.type == "artists"
              ? ArtistItem(
                  name: data.attributes!.name.toString(),
                  image: data.attributes!.artwork == null
                      ? ""
                      : data.attributes!.artwork!.url.toString(),
                  id: data.id.toString())
              : data.type == "albums"
                  ? AlbumItem(
                      songname: data.attributes!.name.toString(),
                      image: data.attributes!.artwork!.url.toString(),
                      id: data.id.toString(),
                      artistname: data.attributes!.artistName.toString())
                  : data.type == "songs"
                      ? SongItem(
                          isPlaying: false,
                          title: data.attributes!.albumName!,
                          artist: data.attributes!.artistName!,
                          onSongTap: () async {
                            ref.read(selectedMusicProvider.notifier).addmusic(
                                  song: data.toJson(),
                                );
                          },
                          url: data.attributes!.artwork!.url,
                        )
                      : const SizedBox();
        });
  }
}
