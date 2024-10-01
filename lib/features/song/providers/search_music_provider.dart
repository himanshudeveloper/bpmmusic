import 'package:bmp_music/features/song/models/searc_song_response.dart';
import 'package:bmp_music/features/song/models/song_response.dart';
import 'package:bmp_music/features/song/repo/song_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_music_provider.g.dart';

@riverpod
class SearchMusic extends _$SearchMusic {
  @override
  Future<SearchSongResponse> build(String text) async {
    final searchrepo = ref.read(songRepoProvider);
    return text.isEmpty
        ? Future.value(
            SearchSongResponse(results: Results(songs: SongResponse())))
        : await searchrepo.searchsong(search: text, page: "1");
  }

  Future<void> search(String search) async {
    final searchrepo = ref.read(songRepoProvider);
    state =
        AsyncValue.data(await searchrepo.searchsong(search: search, page: "1"));
  }
}
