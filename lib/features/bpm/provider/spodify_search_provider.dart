import 'package:bmp_music/features/bpm/model/spodify_search_model.dart';
import 'package:bmp_music/features/bpm/repo/bpm_repo.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'spodify_search_provider.g.dart';

@riverpod
class SearchSpodifyMusic extends _$SearchSpodifyMusic {
  @override
  Future<SpodifySearchModel> build(String text) async {
    final searchrepo = ref.read(bpmRepoProvider);
    return text.isEmpty
        ? Future.value(SpodifySearchModel())
        : await searchrepo.searchsong(search: text);
  }

  Future<void> search(String search) async {
    final searchrepo = ref.read(bpmRepoProvider);
    state = AsyncValue.data(await searchrepo.searchsong(search: search));
  }
}
