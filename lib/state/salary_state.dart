import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_state.freezed.dart';

@freezed
class SalaryState with _$SalaryState {
  const factory SalaryState({
    required String date,
    required String ym,
    required String price,
    required String company,
  }) = _SalaryState;
}
