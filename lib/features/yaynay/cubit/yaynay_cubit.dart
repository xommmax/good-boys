import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/features/yaynay/cubit/yaynay_state.dart';

class YayNayCubit extends Cubit<YayNayState> {
  YayNayCubit(this._breedRepository) : super(const YayNayState()) {
    loadRandomBreeds(limit: 20);
  }

  final BreedRepository _breedRepository;

  Future<void> loadRandomBreeds({int limit = 10}) async {
    final result = await _breedRepository.getRandomImages(limit: limit);
    emit(state.copyWith(imageUrls: [...state.imageUrls, ...result]));
  }
}
