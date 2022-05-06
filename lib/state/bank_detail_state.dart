import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/bank_model.dart';

part 'bank_detail_state.freezed.dart';

@freezed
class BankDetailState with _$BankDetailState {
  const factory BankDetailState({
    required String bank,
    required AsyncValue<List<BankData>> record,
  }) = _BankDetailState;
}
