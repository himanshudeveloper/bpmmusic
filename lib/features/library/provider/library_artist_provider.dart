import 'package:bmp_music/features/library/model/library_artist_model.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'library_artist_provider.g.dart';

@riverpod
Future<LibraryArtistModel> libraryartist(LibraryartistRef ref) {
  final libraryrepo = ref.read(libraryRepoProvider);
  return libraryrepo.getlibraryArtist();
}
