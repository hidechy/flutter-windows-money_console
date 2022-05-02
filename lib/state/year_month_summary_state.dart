import 'package:freezed_annotation/freezed_annotation.dart';

part 'year_month_summary_state.freezed.dart';

@freezed
class YearMonthSummaryState with _$YearMonthSummaryState {
  const factory YearMonthSummaryState(
          {@Default([
            {"aaa": "aaa"}
          ])
              List<Map<String, dynamic>> yearMonthSummaryData}) =
      _YearMonthSummaryState;
}
