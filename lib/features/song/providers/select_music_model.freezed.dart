// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_music_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectedMusicModel {
  String? get musicurl => throw _privateConstructorUsedError;
  String? get musicname => throw _privateConstructorUsedError;
  String? get musicthumb => throw _privateConstructorUsedError;
  String? get musicartist => throw _privateConstructorUsedError;
  String? get musicid => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  bool get isplay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedMusicModelCopyWith<SelectedMusicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedMusicModelCopyWith<$Res> {
  factory $SelectedMusicModelCopyWith(
          SelectedMusicModel value, $Res Function(SelectedMusicModel) then) =
      _$SelectedMusicModelCopyWithImpl<$Res, SelectedMusicModel>;
  @useResult
  $Res call(
      {String? musicurl,
      String? musicname,
      String? musicthumb,
      String? musicartist,
      String? musicid,
      String? duration,
      bool isplay});
}

/// @nodoc
class _$SelectedMusicModelCopyWithImpl<$Res, $Val extends SelectedMusicModel>
    implements $SelectedMusicModelCopyWith<$Res> {
  _$SelectedMusicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicurl = freezed,
    Object? musicname = freezed,
    Object? musicthumb = freezed,
    Object? musicartist = freezed,
    Object? musicid = freezed,
    Object? duration = freezed,
    Object? isplay = null,
  }) {
    return _then(_value.copyWith(
      musicurl: freezed == musicurl
          ? _value.musicurl
          : musicurl // ignore: cast_nullable_to_non_nullable
              as String?,
      musicname: freezed == musicname
          ? _value.musicname
          : musicname // ignore: cast_nullable_to_non_nullable
              as String?,
      musicthumb: freezed == musicthumb
          ? _value.musicthumb
          : musicthumb // ignore: cast_nullable_to_non_nullable
              as String?,
      musicartist: freezed == musicartist
          ? _value.musicartist
          : musicartist // ignore: cast_nullable_to_non_nullable
              as String?,
      musicid: freezed == musicid
          ? _value.musicid
          : musicid // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      isplay: null == isplay
          ? _value.isplay
          : isplay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedMusicModelImplCopyWith<$Res>
    implements $SelectedMusicModelCopyWith<$Res> {
  factory _$$SelectedMusicModelImplCopyWith(_$SelectedMusicModelImpl value,
          $Res Function(_$SelectedMusicModelImpl) then) =
      __$$SelectedMusicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? musicurl,
      String? musicname,
      String? musicthumb,
      String? musicartist,
      String? musicid,
      String? duration,
      bool isplay});
}

/// @nodoc
class __$$SelectedMusicModelImplCopyWithImpl<$Res>
    extends _$SelectedMusicModelCopyWithImpl<$Res, _$SelectedMusicModelImpl>
    implements _$$SelectedMusicModelImplCopyWith<$Res> {
  __$$SelectedMusicModelImplCopyWithImpl(_$SelectedMusicModelImpl _value,
      $Res Function(_$SelectedMusicModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musicurl = freezed,
    Object? musicname = freezed,
    Object? musicthumb = freezed,
    Object? musicartist = freezed,
    Object? musicid = freezed,
    Object? duration = freezed,
    Object? isplay = null,
  }) {
    return _then(_$SelectedMusicModelImpl(
      musicurl: freezed == musicurl
          ? _value.musicurl
          : musicurl // ignore: cast_nullable_to_non_nullable
              as String?,
      musicname: freezed == musicname
          ? _value.musicname
          : musicname // ignore: cast_nullable_to_non_nullable
              as String?,
      musicthumb: freezed == musicthumb
          ? _value.musicthumb
          : musicthumb // ignore: cast_nullable_to_non_nullable
              as String?,
      musicartist: freezed == musicartist
          ? _value.musicartist
          : musicartist // ignore: cast_nullable_to_non_nullable
              as String?,
      musicid: freezed == musicid
          ? _value.musicid
          : musicid // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      isplay: null == isplay
          ? _value.isplay
          : isplay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SelectedMusicModelImpl implements _SelectedMusicModel {
  _$SelectedMusicModelImpl(
      {this.musicurl,
      this.musicname,
      this.musicthumb,
      this.musicartist,
      this.musicid,
      this.duration,
      required this.isplay});

  @override
  final String? musicurl;
  @override
  final String? musicname;
  @override
  final String? musicthumb;
  @override
  final String? musicartist;
  @override
  final String? musicid;
  @override
  final String? duration;
  @override
  final bool isplay;

  @override
  String toString() {
    return 'SelectedMusicModel(musicurl: $musicurl, musicname: $musicname, musicthumb: $musicthumb, musicartist: $musicartist, musicid: $musicid, duration: $duration, isplay: $isplay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedMusicModelImpl &&
            (identical(other.musicurl, musicurl) ||
                other.musicurl == musicurl) &&
            (identical(other.musicname, musicname) ||
                other.musicname == musicname) &&
            (identical(other.musicthumb, musicthumb) ||
                other.musicthumb == musicthumb) &&
            (identical(other.musicartist, musicartist) ||
                other.musicartist == musicartist) &&
            (identical(other.musicid, musicid) || other.musicid == musicid) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isplay, isplay) || other.isplay == isplay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, musicurl, musicname, musicthumb,
      musicartist, musicid, duration, isplay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedMusicModelImplCopyWith<_$SelectedMusicModelImpl> get copyWith =>
      __$$SelectedMusicModelImplCopyWithImpl<_$SelectedMusicModelImpl>(
          this, _$identity);
}

abstract class _SelectedMusicModel implements SelectedMusicModel {
  factory _SelectedMusicModel(
      {final String? musicurl,
      final String? musicname,
      final String? musicthumb,
      final String? musicartist,
      final String? musicid,
      final String? duration,
      required final bool isplay}) = _$SelectedMusicModelImpl;

  @override
  String? get musicurl;
  @override
  String? get musicname;
  @override
  String? get musicthumb;
  @override
  String? get musicartist;
  @override
  String? get musicid;
  @override
  String? get duration;
  @override
  bool get isplay;
  @override
  @JsonKey(ignore: true)
  _$$SelectedMusicModelImplCopyWith<_$SelectedMusicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
