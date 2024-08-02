import 'package:bmp_music/features/library/provider/single_librrary_playlist_provider.dart';
import 'package:bmp_music/features/library/views/page/single_playlist_page.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaylistView extends ConsumerWidget {
  const PlaylistView({required this.id, required this.name, super.key});

  final String id;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleplaylist = ref.watch(singlelibraryplaylistProvider(id: id));
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: singleplaylist.when(
          data: (data) {
            return InkWell(
              onTap: () {
                if (data.data!.first.relationships!.tracks!.data!.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SinglePlaylistPage(
                                id: id,
                              )));
                }
              },
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  ArtWorkView(
                      url: data.data!.first.relationships!.tracks!.data!.isEmpty
                          ? ""
                          : data.data!.first.relationships!.tracks!.data!.first
                              .attributes!.artwork!.url
                              .toString(),
                      height: 120,
                      width: 120),
                  const SizedBox(width: 15),
                  Expanded(
                      child: Text(data.data!.first.attributes!.name.toString()))
                ],
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
