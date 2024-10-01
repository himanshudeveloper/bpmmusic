import 'package:bmp_music/features/bpm/model/audio_detail_model.dart';
import 'package:bmp_music/features/bpm/model/spodify_search_model.dart';
import 'package:bmp_music/features/bpm/model/spodify_token_model.dart';
import 'package:bmp_music/features/bpm/repo/bpm_repo.dart';
import 'package:bmp_music/features/bpm/services/read_spodify_token.dart';
import 'package:bmp_music/services/dio/dio_http_service.dart';

class HttpBpmRepo extends BpmRepo {
  @override
  Future<SpodifySearchModel> searchsong({required String search}) async {
    String token = await readsp();

    final data = await dioservice.get(
        "${searchsongpath}?q=$search&type=track&limit=1",
        customBaseUrl: "https://api.spotify.com/v1/",
        customtoken: token);
    final SpodifySearchModel songs = SpodifySearchModel.fromJson(data);

    print("searchsonggrespon${songs.tracks}");

    return songs;
  }

  @override
  String get searchsongpath => "search";

  @override
  Future<AudioDetail> songinfo({required String id}) async {
    String token = await readsp();

    final data = await dioservice.get("$songinfopath$id",
        customBaseUrl: "https://api.spotify.com/v1/", customtoken: token);
    final AudioDetail songs = AudioDetail.fromJson(data);

    return songs;
  }

  @override
  String get songinfopath => "audio-features/";

  @override
  Future<SpodifyTokenModel> gettoken() async {
    final data = await dioservice.post(
      "$tokenpath",
      customBaseUrl: "https://accounts.spotify.com/api/",
    );
    final SpodifyTokenModel songs = SpodifyTokenModel.fromJson(data);

    return songs;
  }

  @override
  String get tokenpath => "token";
}
