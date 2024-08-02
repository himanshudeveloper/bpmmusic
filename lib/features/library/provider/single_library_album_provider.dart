import 'package:bmp_music/features/library/model/single_album_library_model.dart';
import 'package:bmp_music/features/library/model/single_playlist_library_model.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'single_library_album_provider.g.dart';

@riverpod
Future<SingleAlbumtLibraryModel> singlelibraryalbum(SinglelibraryalbumRef ref,
    {required String id}) {
  final libraryrepo = ref.read(libraryRepoProvider);
  return libraryrepo.getsinglealbumLibrary(id: id);
}
