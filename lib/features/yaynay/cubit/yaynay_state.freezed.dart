// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yaynay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$YayNayState {
  List<String> get imageUrls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $YayNayStateCopyWith<YayNayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YayNayStateCopyWith<$Res> {
  factory $YayNayStateCopyWith(
          YayNayState value, $Res Function(YayNayState) then) =
      _$YayNayStateCopyWithImpl<$Res, YayNayState>;
  @useResult
  $Res call({List<String> imageUrls});
}

/// @nodoc
class _$YayNayStateCopyWithImpl<$Res, $Val extends YayNayState>
    implements $YayNayStateCopyWith<$Res> {
  _$YayNayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrls = null,
  }) {
    return _then(_value.copyWith(
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_YayNayStateCopyWith<$Res>
    implements $YayNayStateCopyWith<$Res> {
  factory _$$_YayNayStateCopyWith(
          _$_YayNayState value, $Res Function(_$_YayNayState) then) =
      __$$_YayNayStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> imageUrls});
}

/// @nodoc
class __$$_YayNayStateCopyWithImpl<$Res>
    extends _$YayNayStateCopyWithImpl<$Res, _$_YayNayState>
    implements _$$_YayNayStateCopyWith<$Res> {
  __$$_YayNayStateCopyWithImpl(
      _$_YayNayState _value, $Res Function(_$_YayNayState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrls = null,
  }) {
    return _then(_$_YayNayState(
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_YayNayState implements _YayNayState {
  const _$_YayNayState({final List<String> imageUrls = const []})
      : _imageUrls = imageUrls;

  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  String toString() {
    return 'YayNayState(imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_YayNayState &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_imageUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_YayNayStateCopyWith<_$_YayNayState> get copyWith =>
      __$$_YayNayStateCopyWithImpl<_$_YayNayState>(this, _$identity);
}

abstract class _YayNayState implements YayNayState {
  const factory _YayNayState({final List<String> imageUrls}) = _$_YayNayState;

  @override
  List<String> get imageUrls;
  @override
  @JsonKey(ignore: true)
  _$$_YayNayStateCopyWith<_$_YayNayState> get copyWith =>
      throw _privateConstructorUsedError;
}
