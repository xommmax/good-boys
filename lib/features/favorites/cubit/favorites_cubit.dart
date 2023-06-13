import 'package:favorites_repository/favorites_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/features/favorites/cubit/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._favoritesRepository) : super(FavoritesState());

  final FavoritesRepository _favoritesRepository;

  Future<bool> isFavorite(String breedId) => _favoritesRepository.isFavorite(breedId);

  Future<void> favorite(String breedId) => _favoritesRepository.setFavorite(breedId, true);

  Future<void> unfavorite(String breedId) => _favoritesRepository.setFavorite(breedId, false);
}
