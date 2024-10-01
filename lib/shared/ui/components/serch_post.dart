import 'dart:async';

import 'package:bmp_music/features/song/providers/search_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/songs_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPost extends SearchDelegate<String> {
  Timer? _debounceTimer;
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: Icon(
        Icons.clear,
        color: Colors.black,
      ),
      onPressed: () {
        if (query.isEmpty) {
          if (_debounceTimer != null && _debounceTimer!.isActive) {
            _debounceTimer!.cancel();
          }
          close(context, null!);
        } else {
          if (_debounceTimer != null && _debounceTimer!.isActive) {
            _debounceTimer!.cancel();
          }

          _debounceTimer = Timer(const Duration(seconds: 1), () async {
            query = '';
            showSuggestions(context);
          });
        }
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final value = ref.watch(searchMusicProvider(query));
        return value.when(
            data: (data) {
              return query.isEmpty
                  ? const Text("Search Music")
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SongsList(
                          songs: data.results == null ||
                                  data.results!.songs == null
                              ? []
                              : data.results!.songs!.data!),
                    );
            },
            error: (err, _) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                  ),
                ));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final value = ref.watch(searchMusicProvider(query));
        return value.when(
            data: (data) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: query.isEmpty
                    ? const Text("Search Music")
                    : SongsList(
                        songs:
                            data.results == null || data.results!.songs == null
                                ? []
                                : data.results!.songs!.data!),
              );
            },
            error: (err, _) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                  ),
                ));
      },
    );
  }
}
