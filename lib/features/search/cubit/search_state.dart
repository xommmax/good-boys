import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

enum SearchStatus { initial, searching, success, failure }

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<Breed> breeds,
    @Default(SearchStatus.initial) SearchStatus status,
    @Default('') String query,
  }) = _SearchState;
}
