import 'package:bloc/bloc.dart';
import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/breed/breed.dart';

part 'breed_list_state.dart';
part 'breed_list_cubit.freezed.dart';

class BreedListCubit extends Cubit<BreedListState> {
  BreedListCubit(this._breedRepository) : super(const BreedListState()) {
    fetchInitialPage();
  }

  final BreedRepository _breedRepository;

  Future<void> fetchInitialPage() => fetchPage(page: 0);

  Future<void> fetchNextPage() async {
    if (state.status == BreedListStatus.fetchMore || !state.hasMore) return;
    emit(state.copyWith(status: BreedListStatus.fetchMore));
    return fetchPage(page: state.page + 1);
  }

  Future<void> fetchPage({int page = 0}) async {
    try {
      final breeds =
          (await _breedRepository.getBreeds(page: page)).map((b) => Breed.fromRepo(b)).toList();
      emit(state.copyWith(
        status: BreedListStatus.success,
        breeds: state.breeds + breeds,
        hasMore: breeds.isNotEmpty,
        page: page,
      ));
    } on Exception {
      emit(state.copyWith(status: BreedListStatus.failure));
    }
  }
}
