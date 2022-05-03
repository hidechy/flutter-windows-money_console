import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_console/state/fund_detail_state.dart';

part 'fund_state.freezed.dart';

@freezed
class FundState with _$FundState {
  const factory FundState({
    required String fundName,
    @Default([
      FundDetailState(
          date: '',
          basePrice: '',
          compareFront: '',
          yearlyReturn: '',
          upDown: '')
    ])
        List<FundDetailState> list,
  }) = _FundState;
}
