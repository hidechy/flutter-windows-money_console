import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/bank_model.dart';

part 'bank_detail_state.freezed.dart';

@freezed
class BankDetailState with _$BankDetailState {
  const factory BankDetailState({
    required String bank,
    required List<BankData> record,
  }) = _BankDetailState;
}
