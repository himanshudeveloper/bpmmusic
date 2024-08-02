import 'package:bmp_music/features/song/models/song_response.dart';
import 'package:bmp_music/services/dio/dio_http_service.dart';

import '../models/song_model.dart';

Future<List<SongModel>> fetchSongs() async {
  List<SongModel> results = [];

  final data = await dioservice.get("me/songs/1672026071");
  //   await ApiService().provideDio().get();

  final SongResponse songs = SongResponse.fromJson(data);

  return songs.data!;
}
