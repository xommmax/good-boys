import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';
import 'package:flutter_demo_app/features/search/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required BreedRepository breedRepository})
      : _breedRepository = breedRepository,
        super(const SearchState(status: SearchStatus.initial));

  final BreedRepository _breedRepository;

  Future<void> searchBreeds(String query) async {
    emit(state.copyWith(status: SearchStatus.searching, query: query));
    try {
      final result = await _breedRepository.search(state.query);
      final breeds = result.map((e) => Breed.fromRepo(e)).toList();
      emit(state.copyWith(
        status: SearchStatus.success,
        breeds: breeds,
      ));
    } on Exception {
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }
}
