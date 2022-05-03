import 'package:freezed_annotation/freezed_annotation.dart';

part 'fund_detail_state.freezed.dart';

@freezed
class FundDetailState with _$FundDetailState {
  const factory FundDetailState({
    required String date,
    required String basePrice,
    required String compareFront,
    required String yearlyReturn,
    required String upDown,
  }) = _FundDetailState;
}
