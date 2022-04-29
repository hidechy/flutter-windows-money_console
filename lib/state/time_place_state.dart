import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_place_state.freezed.dart';

@freezed
class TimePlaceState with _$TimePlaceState {
  const factory TimePlaceState({
    required String time,
    required String place,
    required int price,
  }) = _TimePlaceState;
}
