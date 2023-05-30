// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BreedListState {
  List<Breed> get breeds => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  BreedListStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BreedListStateCopyWith<BreedListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedListStateCopyWith<$Res> {
  factory $BreedListStateCopyWith(
          BreedListState value, $Res Function(BreedListState) then) =
      _$BreedListStateCopyWithImpl<$Res, BreedListState>;
  @useResult
  $Res call({List<Breed> breeds, int page, BreedListStatus status});
}

/// @nodoc
class _$BreedListStateCopyWithImpl<$Res, $Val extends BreedListState>
    implements $BreedListStateCopyWith<$Res> {
  _$BreedListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breeds = null,
    Object? page = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      breeds: null == breeds
          ? _value.breeds
          : breeds // ignore: cast_nullable_to_non_nullable
              as List<Breed>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BreedListStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BreedListStateCopyWith<$Res>
    implements $BreedListStateCopyWith<$Res> {
  factory _$$_BreedListStateCopyWith(
          _$_BreedListState value, $Res Function(_$_BreedListState) then) =
      __$$_BreedListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Breed> breeds, int page, BreedListStatus status});
}

/// @nodoc
class __$$_BreedListStateCopyWithImpl<$Res>
    extends _$BreedListStateCopyWithImpl<$Res, _$_BreedListState>
    implements _$$_BreedListStateCopyWith<$Res> {
  __$$_BreedListStateCopyWithImpl(
      _$_BreedListState _value, $Res Function(_$_BreedListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breeds = null,
    Object? page = null,
    Object? status = null,
  }) {
    return _then(_$_BreedListState(
      breeds: null == breeds
          ? _value._breeds
          : breeds // ignore: cast_nullable_to_non_nullable
              as List<Breed>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BreedListStatus,
    ));
  }
}

/// @nodoc

class _$_BreedListState implements _BreedListState {
  const _$_BreedListState(
      {final List<Breed> breeds = const [],
      this.page = 0,
      this.status = BreedListStatus.initial})
      : _breeds = breeds;

  final List<Breed> _breeds;
  @override
  @JsonKey()
  List<Breed> get breeds {
    if (_breeds is EqualUnmodifiableListView) return _breeds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breeds);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final BreedListStatus status;

  @override
  String toString() {
    return 'BreedListState(breeds: $breeds, page: $page, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BreedListState &&
            const DeepCollectionEquality().equals(other._breeds, _breeds) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_breeds), page, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BreedListStateCopyWith<_$_BreedListState> get copyWith =>
      __$$_BreedListStateCopyWithImpl<_$_BreedListState>(this, _$identity);
}

abstract class _BreedListState implements BreedListState {
  const factory _BreedListState(
      {final List<Breed> breeds,
      final int page,
      final BreedListStatus status}) = _$_BreedListState;

  @override
  List<Breed> get breeds;
  @override
  int get page;
  @override
  BreedListStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_BreedListStateCopyWith<_$_BreedListState> get copyWith =>
      throw _privateConstructorUsedError;
}
