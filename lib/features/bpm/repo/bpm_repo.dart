import 'package:bmp_music/features/bpm/model/audio_detail_model.dart';
import 'package:bmp_music/features/bpm/model/spodify_search_model.dart';
import 'package:bmp_music/features/bpm/model/spodify_token_model.dart';
import 'package:bmp_music/features/bpm/repo/http_bpm_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'bpm_repo.g.dart';

@riverpod
BpmRepo bpmRepo(BpmRepoRef ref) {
  return HttpBpmRepo();
}

abstract class BpmRepo {
  String get searchsongpath;
  String get songinfopath;
  String get tokenpath;
  Future<SpodifySearchModel> searchsong({required String search});
  Future<AudioDetail> songinfo({required String id});
  Future<SpodifyTokenModel> gettoken();
}
