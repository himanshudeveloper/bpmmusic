import 'package:bmp_music/features/library/model/single_library_artist_model.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'single_library_artist_provider.g.dart';

@riverpod
Future<SingleArtistLibraryModel> singlelibraryartist(SinglelibraryartistRef ref,
    {required String id}) {
  final libraryrepo = ref.read(libraryRepoProvider);
  return libraryrepo.getsingleartistLibrary(id: id);
}
