// import 'package:bmp_music/features/album/models/album_model.dart';
// import 'package:bmp_music/features/album/models/artist_model.dart';
import 'package:bmp_music/features/song/models/searc_song_response.dart';
import 'package:bmp_music/features/song/models/song_model.dart';
import 'package:bmp_music/features/song/repo/http_song_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'song_repo.g.dart';

@riverpod
SongRepo songRepo(SongRepoRef ref) {
  return HttpSongRepo();
}

abstract class SongRepo {
  String get searchsongpath;
  String get recomendpath;
  String get albumpath;
  String get artistpath;
  Future<SearchSongResponse> searchsong(
      {required String search, required String page});
  Future<SongModel> recommendsong();
}
