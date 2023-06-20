// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritesListState {
  List<Breed>? get breeds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesListStateCopyWith<FavoritesListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesListStateCopyWith<$Res> {
  factory $FavoritesListStateCopyWith(
          FavoritesListState value, $Res Function(FavoritesListState) then) =
      _$FavoritesListStateCopyWithImpl<$Res, FavoritesListState>;
  @useResult
  $Res call({List<Breed>? breeds});
}

/// @nodoc
class _$FavoritesListStateCopyWithImpl<$Res, $Val extends FavoritesListState>
    implements $FavoritesListStateCopyWith<$Res> {
  _$FavoritesListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breeds = freezed,
  }) {
    return _then(_value.copyWith(
      breeds: freezed == breeds
          ? _value.breeds
          : breeds // ignore: cast_nullable_to_non_nullable
              as List<Breed>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoritesListStateCopyWith<$Res>
    implements $FavoritesListStateCopyWith<$Res> {
  factory _$$_FavoritesListStateCopyWith(_$_FavoritesListState value,
          $Res Function(_$_FavoritesListState) then) =
      __$$_FavoritesListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Breed>? breeds});
}

/// @nodoc
class __$$_FavoritesListStateCopyWithImpl<$Res>
    extends _$FavoritesListStateCopyWithImpl<$Res, _$_FavoritesListState>
    implements _$$_FavoritesListStateCopyWith<$Res> {
  __$$_FavoritesListStateCopyWithImpl(
      _$_FavoritesListState _value, $Res Function(_$_FavoritesListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breeds = freezed,
  }) {
    return _then(_$_FavoritesListState(
      breeds: freezed == breeds
          ? _value._breeds
          : breeds // ignore: cast_nullable_to_non_nullable
              as List<Breed>?,
    ));
  }
}

/// @nodoc

class _$_FavoritesListState implements _FavoritesListState {
  const _$_FavoritesListState({final List<Breed>? breeds}) : _breeds = breeds;

  final List<Breed>? _breeds;
  @override
  List<Breed>? get breeds {
    final value = _breeds;
    if (value == null) return null;
    if (_breeds is EqualUnmodifiableListView) return _breeds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FavoritesListState(breeds: $breeds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoritesListState &&
            const DeepCollectionEquality().equals(other._breeds, _breeds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_breeds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoritesListStateCopyWith<_$_FavoritesListState> get copyWith =>
      __$$_FavoritesListStateCopyWithImpl<_$_FavoritesListState>(
          this, _$identity);
}

abstract class _FavoritesListState implements FavoritesListState {
  const factory _FavoritesListState({final List<Breed>? breeds}) =
      _$_FavoritesListState;

  @override
  List<Breed>? get breeds;
  @override
  @JsonKey(ignore: true)
  _$$_FavoritesListStateCopyWith<_$_FavoritesListState> get copyWith =>
      throw _privateConstructorUsedError;
}
