import 'dart:async';

import 'package:bmp_music/features/album/models/artist_model.dart';
import 'package:bmp_music/features/song/repo/song_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'artist_provider.g.dart';

@riverpod
Future<ArtistModel> artist(Ref ref, {required String id}) {
  final repo = ref.read(songRepoProvider);
  return repo.getartist(id: id);
}
