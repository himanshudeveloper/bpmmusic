import 'package:bmp_music/features/library/model/library_song_model.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'library_song_provider.g.dart';

@riverpod
Future<LibrarySongModel> librarysong(LibrarysongRef ref,
    {required String index}) {
  final libraryrepo = ref.read(libraryRepoProvider);
  return libraryrepo.getlibrarySong(index: index);
}
