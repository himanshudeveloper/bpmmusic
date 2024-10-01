import 'package:bmp_music/features/library/model/library_album_model.dart';
import 'package:bmp_music/features/library/model/library_artist_model.dart';
import 'package:bmp_music/features/library/model/library_playlist_model.dart';
import 'package:bmp_music/features/library/model/library_song_model.dart';
import 'package:bmp_music/features/library/model/single_album_library_model.dart';
import 'package:bmp_music/features/library/model/single_library_artist_model.dart';
import 'package:bmp_music/features/library/model/single_playlist_library_model.dart';
import 'package:bmp_music/features/library/repo/http_library_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'library_repo.g.dart';

@riverpod
LibraryRepo libraryRepo(LibraryRepoRef ref) {
  return HttpLibraryRepo();
}

abstract class LibraryRepo {
  String get librarysongpath;
  String get libraryalbumpath;
  String get libraryartistpath;
  String get libraryplaylistpath;
  String get singleplaylistpath;
  String get singlealbumpath;
  Future<LibrarySongModel> getmultiplealbumSong({required String ids});
  Future<LibrarySongModel> getlibrarySong({required String index});
  Future<LibraryAlbumModel> getlibraryAlbum();
  Future<LibraryArtistModel> getlibraryArtist();
  Future<LibraryPlaylistModel> getlibraryPlaylist();
  Future<SinglePlaylistLibraryModel> getsingleplaylistLibrary(
      {required String id});
  Future<LibrarySongModel> getsinglealbumLibrary({required String id});
  Future<SingleArtistLibraryModel> getsingleartistLibrary({required String id});
}
