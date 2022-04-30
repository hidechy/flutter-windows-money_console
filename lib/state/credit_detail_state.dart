import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/credit_model.dart';

part 'credit_detail_state.freezed.dart';

@freezed
class CreditDetailState with _$CreditDetailState {
  const factory CreditDetailState({
    required List<CreditData> ucCreditData,
    required List<CreditData> rakutenCreditData,
    required List<CreditData> sumitomoCreditData,
    required List<CreditData> amexCreditData,
  }) = _CreditDetailState;
}
