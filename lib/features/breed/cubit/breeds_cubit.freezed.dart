// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breeds_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BreedsState {
  List<Breed> get breeds => throw _privateConstructorUsedError;
  BreedsStatus get status => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  BreedsViewType get viewType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BreedsStateCopyWith<BreedsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedsStateCopyWith<$Res> {
  factory $BreedsStateCopyWith(
          BreedsState value, $Res Function(BreedsState) then) =
      _$BreedsStateCopyWithImpl<$Res, BreedsState>;
  @useResult
  $Res call(
      {List<Breed> breeds,
      BreedsStatus status,
      int page,
      bool hasMore,
      BreedsViewType viewType});
}

/// @nodoc
class _$BreedsStateCopyWithImpl<$Res, $Val extends BreedsState>
    implements $BreedsStateCopyWith<$Res> {
  _$BreedsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breeds = null,
    Object? status = null,
    Object? page = null,
    Object? hasMore = null,
    Object? viewType = null,
  }) {
    return _then(_value.copyWith(
      breeds: null == breeds
          ? _value.breeds
          : breeds // ignore: cast_nullable_to_non_nullable
              as List<Breed>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BreedsStatus,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as BreedsViewType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BreedsStateCopyWith<$Res>
    implements $BreedsStateCopyWith<$Res> {
  factory _$$_BreedsStateCopyWith(
          _$_BreedsState value, $Res Function(_$_BreedsState) then) =
      __$$_BreedsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Breed> breeds,
      BreedsStatus status,
      int page,
      bool hasMore,
      BreedsViewType viewType});
}

/// @nodoc
class __$$_BreedsStateCopyWithImpl<$Res>
    extends _$BreedsStateCopyWithImpl<$Res, _$_BreedsState>
    implements _$$_BreedsStateCopyWith<$Res> {
  __$$_BreedsStateCopyWithImpl(
      _$_BreedsState _value, $Res Function(_$_BreedsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breeds = null,
    Object? status = null,
    Object? page = null,
    Object? hasMore = null,
    Object? viewType = null,
  }) {
    return _then(_$_BreedsState(
      breeds: null == breeds
          ? _value._breeds
          : breeds // ignore: cast_nullable_to_non_nullable
              as List<Breed>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BreedsStatus,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as BreedsViewType,
    ));
  }
}

/// @nodoc

class _$_BreedsState implements _BreedsState {
  const _$_BreedsState(
      {final List<Breed> breeds = const [],
      this.status = BreedsStatus.initial,
      this.page = 0,
      this.hasMore = true,
      this.viewType = BreedsViewType.list})
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
  final BreedsStatus status;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final BreedsViewType viewType;

  @override
  String toString() {
    return 'BreedsState(breeds: $breeds, status: $status, page: $page, hasMore: $hasMore, viewType: $viewType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BreedsState &&
            const DeepCollectionEquality().equals(other._breeds, _breeds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_breeds),
      status,
      page,
      hasMore,
      viewType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BreedsStateCopyWith<_$_BreedsState> get copyWith =>
      __$$_BreedsStateCopyWithImpl<_$_BreedsState>(this, _$identity);
}

abstract class _BreedsState implements BreedsState {
  const factory _BreedsState(
      {final List<Breed> breeds,
      final BreedsStatus status,
      final int page,
      final bool hasMore,
      final BreedsViewType viewType}) = _$_BreedsState;

  @override
  List<Breed> get breeds;
  @override
  BreedsStatus get status;
  @override
  int get page;
  @override
  bool get hasMore;
  @override
  BreedsViewType get viewType;
  @override
  @JsonKey(ignore: true)
  _$$_BreedsStateCopyWith<_$_BreedsState> get copyWith =>
      throw _privateConstructorUsedError;
}
