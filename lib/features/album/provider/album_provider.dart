import 'dart:async';

import 'package:bmp_music/features/album/models/album_model.dart';
import 'package:bmp_music/features/song/repo/song_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'album_provider.g.dart';

@riverpod
Future<AlbumModel> album(Ref ref, {required String id}) {
  final repo = ref.read(songRepoProvider);
  return repo.getalbum(id: id);
}
