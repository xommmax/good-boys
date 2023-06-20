import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorites_list_state.freezed.dart';

@freezed
class FavoritesListState with _$FavoritesListState {
  const factory FavoritesListState({
    List<Breed>? breeds,
  }) = _FavoritesListState;
}
