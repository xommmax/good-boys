// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BreedDetailsState {
  Breed get breed => throw _privateConstructorUsedError;
  Set<String> get imageUrls => throw _privateConstructorUsedError;
  BreedDetailsStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BreedDetailsStateCopyWith<BreedDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedDetailsStateCopyWith<$Res> {
  factory $BreedDetailsStateCopyWith(
          BreedDetailsState value, $Res Function(BreedDetailsState) then) =
      _$BreedDetailsStateCopyWithImpl<$Res, BreedDetailsState>;
  @useResult
  $Res call({Breed breed, Set<String> imageUrls, BreedDetailsStatus status});

  $BreedCopyWith<$Res> get breed;
}

/// @nodoc
class _$BreedDetailsStateCopyWithImpl<$Res, $Val extends BreedDetailsState>
    implements $BreedDetailsStateCopyWith<$Res> {
  _$BreedDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breed = null,
    Object? imageUrls = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as Breed,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BreedDetailsStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BreedCopyWith<$Res> get breed {
    return $BreedCopyWith<$Res>(_value.breed, (value) {
      return _then(_value.copyWith(breed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BreedDetailsStateCopyWith<$Res>
    implements $BreedDetailsStateCopyWith<$Res> {
  factory _$$_BreedDetailsStateCopyWith(_$_BreedDetailsState value,
          $Res Function(_$_BreedDetailsState) then) =
      __$$_BreedDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Breed breed, Set<String> imageUrls, BreedDetailsStatus status});

  @override
  $BreedCopyWith<$Res> get breed;
}

/// @nodoc
class __$$_BreedDetailsStateCopyWithImpl<$Res>
    extends _$BreedDetailsStateCopyWithImpl<$Res, _$_BreedDetailsState>
    implements _$$_BreedDetailsStateCopyWith<$Res> {
  __$$_BreedDetailsStateCopyWithImpl(
      _$_BreedDetailsState _value, $Res Function(_$_BreedDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breed = null,
    Object? imageUrls = null,
    Object? status = null,
  }) {
    return _then(_$_BreedDetailsState(
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as Breed,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BreedDetailsStatus,
    ));
  }
}

/// @nodoc

class _$_BreedDetailsState implements _BreedDetailsState {
  const _$_BreedDetailsState(
      {required this.breed,
      required final Set<String> imageUrls,
      this.status = BreedDetailsStatus.initial})
      : _imageUrls = imageUrls;

  @override
  final Breed breed;
  final Set<String> _imageUrls;
  @override
  Set<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableSetView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_imageUrls);
  }

  @override
  @JsonKey()
  final BreedDetailsStatus status;

  @override
  String toString() {
    return 'BreedDetailsState(breed: $breed, imageUrls: $imageUrls, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BreedDetailsState &&
            (identical(other.breed, breed) || other.breed == breed) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, breed,
      const DeepCollectionEquality().hash(_imageUrls), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BreedDetailsStateCopyWith<_$_BreedDetailsState> get copyWith =>
      __$$_BreedDetailsStateCopyWithImpl<_$_BreedDetailsState>(
          this, _$identity);
}

abstract class _BreedDetailsState implements BreedDetailsState {
  const factory _BreedDetailsState(
      {required final Breed breed,
      required final Set<String> imageUrls,
      final BreedDetailsStatus status}) = _$_BreedDetailsState;

  @override
  Breed get breed;
  @override
  Set<String> get imageUrls;
  @override
  BreedDetailsStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_BreedDetailsStateCopyWith<_$_BreedDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
