import 'package:bmp_music/features/bpm/notifiers/bpm_notifier.dart';
import 'package:bmp_music/features/song/notifiers/song_notifier.dart';
import 'package:bmp_music/features/song/providers/select_music_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_kit/music_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'selected_music_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedMusic extends _$SelectedMusic {
  var musicKit = MusicKit();

  // Stream<Duration> getmusicduratye() {
  //   return musicKit.onSubscriptionUpdated.first
  // }

  // Future<void> getmusicduration() async {
  //   print("totalduration");
  //   Duration? duration = await _player.getDuration();
  //   print("totalduration$duration");
  //   state = state.copyWith(duration: duration!.inMinutes.toString());
  // }

  void requestpermission() async {
    final authorize = await musicKit.requestAuthorizationStatus();
  }

  Future<String> devtoken() async {
    return await musicKit.requestDeveloperToken();
  }

  Future<String> usertoken(String token) async {
    final String usertoken = await musicKit.requestUserToken(token);

    return usertoken;
  }

  Stream<MusicPlayerState> getmusicstate() {
    return musicKit.onMusicPlayerStateChanged;
  }

  Stream<MusicPlayerQueue> getmusicsque() {
    return musicKit.onPlayerQueueChanged;
  }

  void addmusic(
      {String type = "songs", required Map<String, dynamic> song}) async {
    await musicKit.setQueue(type, item: song);
    musicKit.play();

    final bmp = ref.read(bmpNotifierprovider);
    musicKit.setPlaybackRate((bmp).value / 100);
  }

  Future<double> getplaybacktime() async {
    final currentime = await musicKit.playbackTime;

    return currentime;
  }

  void addmusiclist(
      {required List<Map<String, dynamic>> songs, required int index}) async {
    await musicKit.setQueueWithItems("songs", items: songs, startingAt: index);
    //await musicKit.setQueue("songs", item: song.toJson());
    musicKit.play();
    final bmp = ref.read(bmpNotifierprovider);
    musicKit.setPlaybackRate((bmp).value / 100);
  }

  @override
  SelectedMusicModel build() {
    return SelectedMusicModel(isplay: true);
  }

  void change(SelectedMusicModel music) {
    state = music;
    // addmusic(music.musicurl.toString());
  }

  void skipToPrevious() async {
    await musicKit.skipToPreviousEntry();
    musicKit.play();
  }

  void setplactime(double rate) {
    musicKit.setPlaybackTime(rate);
  }

  void setplackrate(double rate) {
    musicKit.setPlaybackRate(rate);
  }

  void skipToNext() async {
    await musicKit.skipToNextEntry();
    musicKit.play();
  }

  Future<void> startShuffleQueue() async {
    ref.read(songnNotifierprovider.notifier).updateShuffle();
    await musicKit.setShuffleMode(MusicPlayerShuffleMode.songs);
  }

  Future<MusicPlayerShuffleMode> getsufflestate() async {
    return musicKit.shuffleMode;
  }

  Future<MusicPlayerRepeatMode> getrepeatstate() async {
    return musicKit.repeatMode;
  }

  Future<void> endShuffleQueue() async {
    ref.read(songnNotifierprovider.notifier).updateShuffle();

    await musicKit.setShuffleMode(MusicPlayerShuffleMode.off);
  }

  Future<void> startrepet() async {
    ref.read(songnNotifierprovider.notifier).updateLoopMode(LoopMode.one);

    await musicKit.setRepeatMode(MusicPlayerRepeatMode.one);
  }

  Future<void> startallrepet() async {
    ref.read(songnNotifierprovider.notifier).updateLoopMode(LoopMode.all);

    await musicKit.setRepeatMode(MusicPlayerRepeatMode.all);
  }

  Future<void> endrepet() async {
    ref.read(songnNotifierprovider.notifier).updateLoopMode(LoopMode.off);

    await musicKit.setRepeatMode(MusicPlayerRepeatMode.none);
  }

  void changemusicstate() async {
    final currentstate = await musicKit.musicPlayerState;

    if (currentstate.playbackStatus == MusicPlayerPlaybackStatus.playing) {
      musicKit.pause();
      //state = state.copyWith(isplay: false);
    } else {
      musicKit.play();
      //state = state.copyWith(isplay: true);
    }
  }

  void changeplay() async {
    state = state.copyWith(isplay: true);
  }

  void changepause() async {
    state = state.copyWith(isplay: false);
  }

  void release() {
    state = SelectedMusicModel(isplay: false);
    // _player.release();
  }
}
