import 'dart:async';
import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';
import 'package:flutter_demo_app/features/favorites/cubit/favorites_list_state.dart';

class FavoritesListCubit extends Cubit<FavoritesListState> {
  FavoritesListCubit(this._breedRepository) : super(const FavoritesListState()) {
    _getFavorites();
    _listenFavoriteBreeds();
  }

  final BreedRepository _breedRepository;
  StreamSubscription? favoritesSubscription;

  Future<void> _listenFavoriteBreeds() async {
    favoritesSubscription = _breedRepository.listenFavorites().listen((favList) {
      final breeds = favList.map((e) => Breed.fromRepo(e)).toList();
      emit(state.copyWith(breeds: breeds));
    });
  }

  Future<void> _getFavorites() async {
    final favList = await _breedRepository.getFavorites();
    final breeds = favList.map((e) => Breed.fromRepo(e)).toList();
    emit(state.copyWith(breeds: breeds));
  }

  @override
  Future<void> close() {
    favoritesSubscription?.cancel();
    return super.close();
  }
}
