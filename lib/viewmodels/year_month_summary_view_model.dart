import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/year_month_summary_state.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////
final yearMonthSummaryProvider = StateNotifierProvider.autoDispose
    .family<YearMonthSummaryStateNotifier, YearMonthSummaryState, int>(
  (ref, year) {
    return YearMonthSummaryStateNotifier(
      const YearMonthSummaryState(
        yearMonthSummaryData: [
          {"": ""}
        ],
      ),
    )..getYearMonthSummaryData(year: year);
  },
);

class YearMonthSummaryStateNotifier
    extends StateNotifier<YearMonthSummaryState> {
  YearMonthSummaryStateNotifier(YearMonthSummaryState state) : super(state);

  ///
  void getYearMonthSummaryData({required int year}) async {
    String url = "http://toyohide.work/BrainLog/api/getYearSpendSummay";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"year": year});
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);

    final yms = jsonDecode(response.body);

    final yearMonthSummary = yms['data'];

    final midashi = yearMonthSummary['midashi'];
    final summary = yearMonthSummary['summary'];

    List<Map<String, dynamic>> _list = [];
    for (var i = 0; i < midashi.length; i++) {
      List<int> _list2 = [];
      for (var j = 1; j <= 12; j++) {
        var getMidashi = midashi[i];
        var getMonth = j.toString().padLeft(2, "0");
        var value = summary[getMidashi][getMonth];
        _list2.add(value);
      }

      Map<String, dynamic> _map = {};
      _map['midashi'] = midashi[i];
      _map['list'] = _list2;
      _list.add(_map);
    }

    state = state.copyWith(yearMonthSummaryData: _list);
  }
}
//////////////////////////////////////////////////////////////////////
