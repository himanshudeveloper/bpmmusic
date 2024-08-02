import 'dart:async';

import 'package:bmp_music/features/library/model/library_album_model.dart';
import 'package:bmp_music/features/library/repo/library_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'library_album_provider.g.dart';

@riverpod
Future<LibraryAlbumModel> libraryalbum(Ref ref) {
  final libraryrepo = ref.read(libraryRepoProvider);
  return libraryrepo.getlibraryAlbum();
}
