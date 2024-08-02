import 'package:bmp_music/features/library/model/single_playlist_library_model.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'single_librrary_playlist_provider.g.dart';

@riverpod
Future<SinglePlaylistLibraryModel> singlelibraryplaylist(
    SinglelibraryplaylistRef ref,
    {required String id}) {
  final libraryrepo = ref.read(libraryRepoProvider);
  return libraryrepo.getsingleplaylistLibrary(id: id);
}
