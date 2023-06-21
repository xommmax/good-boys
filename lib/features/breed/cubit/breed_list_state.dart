part of 'breed_list_cubit.dart';

enum BreedListStatus { initial, fetchMore, success, failure }

@freezed
class BreedListState with _$BreedListState {
  const factory BreedListState({
    @Default([]) List<Breed> breeds,
    @Default(BreedListStatus.initial) BreedListStatus status,
    @Default(0) int page,
    @Default(true) bool hasMore,
  }) = _BreedListState;
}
