import 'package:bmp_music/features/bpm/notifiers/bpm_notifier.dart';
import 'package:bmp_music/features/bpm/provider/bpm_song_provider.dart';
import 'package:bmp_music/features/bpm/provider/spodify_search_provider.dart';
import 'package:bmp_music/features/bpm/repo/bpm_repo.dart';
import 'package:bmp_music/features/bpm/repo/http_bpm_repo.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'apply_bpm_provider.g.dart';

@riverpod
class Applybpm extends _$Applybpm {
  @override
  Future<String> build() async {
    return Future.value('foo');
  }

  void change(String title) async {
    print("channsnsnsnnsnsnsndndndnnndedcall");

    //  final spodifysong = ref.read(searchSpodifyMusicProvider(title));
    final bpm = ref.read(bmpNotifierprovider);

    // final songbpm = ref.read(
    //     bpmSongProviderProvider(song.tracks!.items!.first.id.toString()));

    final song = await ref.read(bpmRepoProvider).searchsong(search: title);
    final songbpm = await ref
        .read(bpmRepoProvider)
        .songinfo(id: song.tracks!.items!.first.id.toString());

    ref
        .read(bmpNotifierprovider)
        .updateSpValue((songbpm.tempo!.round()).toInt());
    double value = bpm.value / bpm.sfbpm;
    ref.read(selectedMusicProvider.notifier).setplackrate(value);

    print("channsnsnsnnsnsnsndndndnnndedrate");
  }
}
