import 'package:bmp_music/features/song/enums.dart';
import 'package:bmp_music/features/song/models/searc_song_response.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:bmp_music/services/dio/dio_http_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_kit/music_kit.dart';
import 'package:music_kit_platform_interface/music_kit_platform_interface.dart';

import '../models/song_model.dart';
import '../services/fetch_songs.dart';
import '../services/read_loop_mode.dart';
import '../services/read_shuffle.dart';
import '../services/save_loop_mode.dart';
import '../services/save_shuffle.dart';

final songnNotifierprovider =
    ChangeNotifierProvider((ref) => SongNotifier(ref: ref));

class SongNotifier extends ChangeNotifier {
  final Ref ref;
  bool loading = false;
  // late SongHandler _songHandler;

  // SongHandler get songHandler => _songHandler;

  late MusicPlayerQueueEntry _cureentmusic;

  SongNotifier({required this.ref});
  MusicPlayerQueueEntry get currentmusic => _cureentmusic;

  late MusicPlayerState _musicPlayerState;
  MusicPlayerState get musicstate => _musicPlayerState;

  void changestate(MusicPlayerState state) {
    _musicPlayerState = state;
    if (state.playbackStatus == MusicPlayerPlaybackStatus.playing) {
      ref.read(selectedMusicProvider.notifier).changeplay();
    } else {
      ref.read(selectedMusicProvider.notifier).changepause();
    }

    notifyListeners();
  }

  void currentSong(MusicPlayerQueueEntry entry) {
    _cureentmusic = entry;
    notifyListeners();
  }

  // void assignHandler(SongHandler handler) {
  //   _songHandler = handler;
  //   notifyListeners();
  // }

  void skipToNext() {
    // _songHandler.skipToNext();
    notifyListeners();
  }

  void skipToPrevious() {
    // _songHandler.skipToPrevious();
    notifyListeners();
  }

  LoopMode _loopMode = LoopMode.off;
  LoopMode get loopMode => _loopMode;

  bool _shuffle = false;
  bool get shuffle => _shuffle;

  void updateLoopMode(LoopMode newLoopMode) {
    _loopMode = newLoopMode;
    saveLoopMode(newLoopMode);
    //  _songHandler.toggleLoopMode(newLoopMode);
    notifyListeners();
  }

  void updateShuffle() {
    _shuffle = !shuffle;
    saveShuffle(shuffle);
    if (shuffle) {
      //  _songHandler.shuffleQueue();
    } else {
      //  _songHandler.unShuffleQueue();
    }
    notifyListeners();
  }

  List<SongModel> _songs = [];

  List<SongModel> get songs => _songs;

  Future<void> loadSongs() async {
    _loopMode = await readLoopMode();
    _shuffle = await readShuffle();
    final results = await fetchSongs();
    _songs = results;
    // await _songHandler.initSongs(
    //     songs: results.map((s) => s.toJson()).toList());
    // _songHandler.toggleLoopMode(loopMode);
    // if (shuffle) {
    //   _songHandler.shuffleQueue();
    // }
    loading = false;
    notifyListeners();
  }

  void serachSong(String text) async {
    loading = true;
    notifyListeners();
    String serachquery = text.replaceAll(' ', '+');
    final data = await dioservice
        .get("me/search?term=$serachquery&limit=25&types=songs");
    final SearchSongResponse songs = SearchSongResponse.fromJson(data);

    int lent = songs.results!.songs!.data!.length;
    _songs.clear();
    for (int i = 0; i < lent; i++) {
      _songs.add(songs.results!.songs!.data![i]);
    }
    // await _songHandler.initSongs(songs: _songs.map((s) => s.toJson()).toList());
    loading = false;
    notifyListeners();
  }
}
