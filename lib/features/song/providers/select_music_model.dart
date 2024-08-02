import 'package:freezed_annotation/freezed_annotation.dart';
part 'select_music_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class SelectedMusicModel with _$SelectedMusicModel {
  factory SelectedMusicModel({
    String? musicurl,
    String? musicname,
    String? musicthumb,
    String? musicartist,
    String? musicid,
    String? duration,
    required bool isplay,
  }) = _SelectedMusicModel;
}
