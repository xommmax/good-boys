import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/breed/breed.dart';

part 'breed_details_state.dart';
part 'breed_details_cubit.freezed.dart';

class BreedDetailsCubit extends Cubit<BreedDetailsState> {
  BreedDetailsCubit(Breed breed, this._breedRepository)
      : super(BreedDetailsState(breed: breed, imageUrls: {breed.imageUrl}));

  final BreedRepository _breedRepository;

  Future<void> fetchImageUrls() async {
    emit(state.copyWith(status: BreedDetailsStatus.imageLoading));

    try {
      final imageUrls = await _breedRepository.getBreedImages(state.breed.id);
      log('imageUrls: $imageUrls');
      emit(state.copyWith(
        imageUrls: {...state.imageUrls, ...imageUrls},
        status: BreedDetailsStatus.imageLoaded,
      ));
    } on Exception {
      emit(state.copyWith(status: BreedDetailsStatus.failure));
    }
  }
}
