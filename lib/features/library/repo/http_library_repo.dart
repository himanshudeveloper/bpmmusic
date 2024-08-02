import 'package:bmp_music/features/library/model/library_album_model.dart';
import 'package:bmp_music/features/library/model/library_artist_model.dart';
import 'package:bmp_music/features/library/model/library_playlist_model.dart';
import 'package:bmp_music/features/library/model/library_song_model.dart';
import 'package:bmp_music/features/library/model/single_album_library_model.dart';
import 'package:bmp_music/features/library/model/single_library_artist_model.dart';
import 'package:bmp_music/features/library/model/single_playlist_library_model.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
import 'package:bmp_music/services/dio/dio_http_service.dart';

class HttpLibraryRepo extends LibraryRepo {
  @override
  String get libraryalbumpath => "me/library/albums";

  @override
  String get libraryartistpath => "me/library/artists";

  @override
  String get libraryplaylistpath => "me/library/playlists";

  @override
  String get librarysongpath => "me/library/songs";

  @override
  String get singleplaylistpath => "me/library/playlists";

  @override
  String get singlealbumpath => "me/library/albums";

  @override
  Future<LibraryAlbumModel> getlibraryAlbum() async {
    final data = await dioservice.get(libraryalbumpath);
    final LibraryAlbumModel songs = LibraryAlbumModel.fromJson(data);

    return songs;
  }

  @override
  Future<LibraryArtistModel> getlibraryArtist() async {
    final data = await dioservice.get(libraryartistpath);
    final LibraryArtistModel songs = LibraryArtistModel.fromJson(data);

    return songs;
  }

  @override
  Future<LibraryPlaylistModel> getlibraryPlaylist() async {
    final data = await dioservice.get("$libraryplaylistpath");
    final LibraryPlaylistModel songs = LibraryPlaylistModel.fromJson(data);

    return songs;
  }

  @override
  Future<LibrarySongModel> getlibrarySong({required String index}) async {
    final data = await dioservice.get("$librarysongpath?limit=100");
    final LibrarySongModel songs = LibrarySongModel.fromJson(data);

    // final inewndex =
    //     songs.data!.where((data) => data.attributes.runtimeType == "i.eoD8Vm8SZmbq8zk");

    final activeCars =
        songs.data!.where((car) => car.attributes!.trackNumber != 0).toList();

    return LibrarySongModel(data: activeCars);
  }

  @override
  Future<SinglePlaylistLibraryModel> getsingleplaylistLibrary(
      {required String id}) async {
    final data = await dioservice.get("$singleplaylistpath/$id?include=tracks");
    final SinglePlaylistLibraryModel songs =
        SinglePlaylistLibraryModel.fromJson(data);

    return songs;
  }

  @override
  Future<SingleAlbumtLibraryModel> getsinglealbumLibrary(
      {required String id}) async {
    final data = await dioservice.get("$singlealbumpath/$id/catalog");
    final SingleAlbumtLibraryModel songs =
        SingleAlbumtLibraryModel.fromJson(data);
    return songs;
  }

  @override
  Future<SingleArtistLibraryModel> getsingleartistLibrary(
      {required String id}) async {
    final data =
        await dioservice.get("$libraryartistpath/$id/albums?include=tracks");
    final SingleArtistLibraryModel songs =
        SingleArtistLibraryModel.fromJson(data);
    return songs;
  }
}
