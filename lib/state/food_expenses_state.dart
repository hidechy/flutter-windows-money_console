//
// I can not use this.
//

import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/month_summary_model.dart';
import '../models/seiyu_purchase_model.dart';

part 'food_expenses_state.freezed.dart';

@freezed
class FoodExpensesState with _$FoodExpensesState {
  const factory FoodExpensesState({
    required List<MonthSummaryData> monthSummaryDataList,
    required List<SeiyuPurchaseData> seiyuPurchaseDataList,
  }) = _FoodExpensesState;
}
