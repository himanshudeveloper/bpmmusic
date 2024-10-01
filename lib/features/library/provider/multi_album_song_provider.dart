import 'package:bmp_music/features/library/model/library_song_model.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'multi_album_song_provider.g.dart';

@riverpod
Future<LibrarySongModel> multialbumsong(MultialbumsongRef ref,
    {required String ids}) {
  final libraryrepo = ref.read(libraryRepoProvider);
  return libraryrepo.getmultiplealbumSong(ids: ids);
}
