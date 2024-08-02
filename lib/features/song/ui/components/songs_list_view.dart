import 'package:bmp_music/features/song/notifiers/song_notifier.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/song_model.dart';
import 'song_item.dart';

class SongsList extends ConsumerWidget {
  final List<SongModel> songs;
  const SongsList({super.key, required this.songs});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songNotifier = ref.watch(songnNotifierprovider);

    bool isLoading = songNotifier.loading;

    return

        // isLoading
        //     ? const Expanded(
        //         child: Center(
        //           child: CircularProgressIndicator(
        //             strokeCap: StrokeCap.round,
        //           ),
        //         ),
        //       )
        //     :

        songs.isEmpty
            ? const Center(
                child: Text("No songs"),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];

                  // Build the SongItem based on the playback state
                  return

                      // StreamBuilder<MediaItem?>(
                      //   stream: songNotifier.songHandler.mediaItem.stream,
                      //   builder: (context, snapshot) {
                      //     MediaItem? playingSong = snapshot.data;

                      // Check if the current item is the last one
                      SongItem(
                    isPlaying: false,
                    title: song.attributes!.name!,
                    artist: song.attributes!.artistName!,
                    onSongTap: () async {
                      ref.read(selectedMusicProvider.notifier).addmusiclist(
                          songs: songs.map((s) => s.toJson()).toList(),
                          index: index);
                    },
                    url: song.attributes!.artwork!.url,
                  );
                  //  },
                  //);
                },
              );
  }
}
