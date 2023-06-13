import 'package:bloc/bloc.dart';
import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:favorites_repository/favorites_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/breed/breed.dart';

part 'breed_details_state.dart';
part 'breed_details_cubit.freezed.dart';

class BreedDetailsCubit extends Cubit<BreedDetailsState> {
  BreedDetailsCubit(Breed breed, this._breedRepository, this._favoritesRepository)
      : super(BreedDetailsState(
          breed: breed,
          imageUrls: {breed.imageUrl},
        )) {
    fetchImageUrls();
    checkIfFavorite();
  }

  final BreedRepository _breedRepository;
  final FavoritesRepository _favoritesRepository;

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
    await _favoritesRepository.setFavorite(state.breed.id.toString(), !currentFavorite);
    emit(state.copyWith(isFavorite: !currentFavorite));
  }

  void checkIfFavorite() async {
    final isFavorite = await _favoritesRepository.isFavorite(state.breed.id.toString());
    emit(state.copyWith(isFavorite: isFavorite));
  }
}
