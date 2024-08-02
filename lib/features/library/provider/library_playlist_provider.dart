import 'package:bmp_music/features/library/model/library_playlist_model.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'library_playlist_provider.g.dart';

@riverpod
Future<LibraryPlaylistModel> libraryplaylist(LibraryplaylistRef ref) {
  final libraryrepo = ref.read(libraryRepoProvider);
  return libraryrepo.getlibraryPlaylist();
}
