import 'package:bmp_music/features/bpm/model/audio_detail_model.dart';
import 'package:bmp_music/features/bpm/model/spodify_search_model.dart';
import 'package:bmp_music/features/bpm/repo/bpm_repo.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'bpm_song_provider.g.dart';

@riverpod
class BpmSongProvider extends _$BpmSongProvider {
  @override
  Future<AudioDetail> build(String id) async {
    final searchrepo = ref.read(bpmRepoProvider);
    return id.isEmpty
        ? Future.value(AudioDetail())
        : await searchrepo.songinfo(id: id);
  }

  Future<void> search(String id) async {
    final searchrepo = ref.read(bpmRepoProvider);
    state = AsyncValue.data(await searchrepo.songinfo(id: id));
  }
}
