import 'package:bmp_music/features/album/models/album_model.dart';
import 'package:bmp_music/features/album/models/artist_model.dart';
import 'package:bmp_music/features/song/models/searc_song_response.dart';
import 'package:bmp_music/features/song/models/song_model.dart';
import 'package:bmp_music/features/song/repo/song_repo.dart';
import 'package:bmp_music/services/dio/dio_http_service.dart';

class HttpSongRepo extends SongRepo {
  @override
  String get recomendpath => throw UnimplementedError();

  @override
  String get searchsongpath => throw UnimplementedError();

  @override
  String get albumpath => "catalog/us/albums";

  @override
  String get artistpath => "catalog/jp/artists";

  @override
  Future<SongModel> recommendsong() {
    // TODO: implement recommendsong
    throw UnimplementedError();
  }

  @override
  Future<SearchSongResponse> searchsong(
      {required String search, required String page}) async {
    final data = await dioservice.get(
        "catalog/jp/search?term=$search&limit=25&types=songs,artists,albums&with=topResults");
    final SearchSongResponse songs = SearchSongResponse.fromJson(data);

    return songs;
  }

  @override
  Future<AlbumModel> getalbum({required String id}) async {
    final data = await dioservice.get("$albumpath?ids=$id");
    final AlbumModel songs = AlbumModel.fromJson(data);

    return songs;
  }

  @override
  Future<ArtistModel> getartist({required String id}) async {
    final data = await dioservice.get("$artistpath?ids=$id&views=top-songs");
    final ArtistModel songs = ArtistModel.fromJson(data);

    return songs;
  }
}
