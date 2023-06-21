part of 'breeds_cubit.dart';

enum BreedsStatus { initial, fetchMore, success, failure }

enum BreedsViewType { list, grid }

@freezed
class BreedsState with _$BreedsState {
  const factory BreedsState({
    @Default([]) List<Breed> breeds,
    @Default(BreedsStatus.initial) BreedsStatus status,
    @Default(0) int page,
    @Default(true) bool hasMore,
    @Default(BreedsViewType.list) BreedsViewType viewType,
  }) = _BreedsState;
}
