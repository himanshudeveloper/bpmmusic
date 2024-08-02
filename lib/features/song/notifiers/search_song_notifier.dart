// import 'package:bmp_music/features/song/models/searc_song_response.dart';
// import 'package:bmp_music/features/song/models/song_model.dart';
// import 'package:bmp_music/features/song/models/song_response.dart';
// import 'package:bmp_music/features/song/services/song_handler.dart';
// import 'package:bmp_music/services/dio/dio_http_service.dart';
// import 'package:flutter/material.dart';

// class SearchSongNotifier extends ChangeNotifier {
//   bool loading = false;
//   final List<SongModel> _songlist = [];

//   List<SongModel> get songlist => _songlist;

//   // late SongHandler _songHandler;

//   // SongHandler get songHandler => _songHandler;

//   // void assignHandler(SongHandler handler) {
//   //   _songHandler = handler;
//   //   notifyListeners();
//   // }

//   void serachSong(String text) async {
//     loading = true;
//     notifyListeners();
//     String serachquery = text.replaceAll(' ', '+');
//     final data = await dioservice
//         .get("me/search?term=$serachquery&limit=25&types=songs");
//     final SeachSongResponse songs = SeachSongResponse.fromJson(data);

//     int lent = songs.results!.songs!.data!.length;
//     print("musiclenght$lent");
//     for (int i = 0; i < lent; i++) {
//       _songlist.add(songs.results!.songs!.data![i]);
//     }
//     // await _songHandler.initSongs(
//     //     songs: songlist.map((s) => s.toJson()).toList());
//     loading = false;
//     notifyListeners();
//   }
// }
