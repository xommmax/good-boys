import 'package:bloc/bloc.dart';
import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/breed/breed.dart';

part 'breed_details_state.dart';
part 'breed_details_cubit.freezed.dart';

class BreedDetailsCubit extends Cubit<BreedDetailsState> {
  BreedDetailsCubit({required Breed breed, required BreedRepository breedRepository})
      : _breedRepository = breedRepository,
        super(BreedDetailsState(breed: breed, imageUrls: {breed.imageUrl})) {
    fetchImageUrls();
    checkIfFavorite();
  }

  final BreedRepository _breedRepository;

  Future<void> fetchImageUrls() async {
    emit(state.copyWith(status: BreedDetailsStatus.imageLoading));

    try {
      final imageUrls = await _breedRepository.getBreedImages(state.breed.id);
      emit(state.copyWith(
        imageUrls: {...state.imageUrls, ...imageUrls},
        status: BreedDetailsStatus.imageLoaded,
      ));
    } on Exception {
      emit(state.copyWith(status: BreedDetailsStatus.failure));
    }
  }

  Future<void> onFavoritePressed() async {
    final currentFavorite = state.isFavorite;
    await _breedRepository.setFavorite(state.breed.id, !currentFavorite);
    emit(state.copyWith(isFavorite: !currentFavorite));
  }

  void checkIfFavorite() async {
    final isFavorite = await _breedRepository.isFavorite(state.breed.id);
    emit(state.copyWith(isFavorite: isFavorite));
  }
}
