import 'package:bloc/bloc.dart';
import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/breed/breed.dart';

part 'breeds_state.dart';
part 'breeds_cubit.freezed.dart';

class BreedsCubit extends Cubit<BreedsState> {
  BreedsCubit({required BreedRepository breedRepository})
      : _breedRepository = breedRepository,
        super(const BreedsState()) {
    fetchInitialPage();
  }

  final BreedRepository _breedRepository;

  Future<void> fetchInitialPage() => fetchPage(page: 0);

  Future<void> fetchNextPage() async {
    if (state.status == BreedsStatus.fetchMore || !state.hasMore) return;
    emit(state.copyWith(status: BreedsStatus.fetchMore));
    return fetchPage(page: state.page + 1);
  }

  Future<void> fetchPage({int page = 0}) async {
    try {
      final breeds =
          (await _breedRepository.getBreeds(page: page)).map((b) => Breed.fromRepo(b)).toList();
      emit(state.copyWith(
        status: BreedsStatus.success,
        breeds: state.breeds + breeds,
        hasMore: breeds.isNotEmpty,
        page: page,
      ));
    } on Exception {
      emit(state.copyWith(status: BreedsStatus.failure));
    }
  }

  void switchViewType() {
    final BreedsViewType newViewType;
    if (state.viewType == BreedsViewType.list) {
      newViewType = BreedsViewType.grid;
    } else {
      newViewType = BreedsViewType.list;
    }
    emit(state.copyWith(viewType: newViewType));
  }
}
