part of 'breed_details_cubit.dart';

enum BreedDetailsStatus { initial, imageLoading, imageLoaded, failure }

@freezed
class BreedDetailsState with _$BreedDetailsState {
  const factory BreedDetailsState({
    required Breed breed,
    required Set<String> imageUrls,
    @Default(BreedDetailsStatus.initial) BreedDetailsStatus status,
  }) = _BreedDetailsState;
}
