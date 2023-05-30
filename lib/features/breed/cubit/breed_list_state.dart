part of 'breed_list_cubit.dart';

enum BreedListStatus { initial, loading, success, failure }

@freezed
class BreedListState with _$BreedListState {
  const factory BreedListState({
    @Default([]) List<Breed> breeds,
    @Default(0) int page,
    @Default(BreedListStatus.initial) BreedListStatus status,
  }) = _BreedListState;
}
