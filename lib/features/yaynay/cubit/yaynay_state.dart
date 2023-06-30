import 'package:freezed_annotation/freezed_annotation.dart';

part 'yaynay_state.freezed.dart';

@freezed
class YayNayState with _$YayNayState {
  const factory YayNayState({
    @Default([]) List<String> imageUrls,
  }) = _YayNayState;
}
