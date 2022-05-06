import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/salary_state.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final salaryProvider =
    StateNotifierProvider.autoDispose<SalaryStateNotifier, List<SalaryState>>(
        (ref) {
  return SalaryStateNotifier([])..getSalaryData();
});

class SalaryStateNotifier extends StateNotifier<List<SalaryState>> {
  SalaryStateNotifier(List<SalaryState> state) : super(state);

  ///
  void getSalaryData() async {
    String url = "http://toyohide.work/BrainLog/api/getAllBenefit";
    Map<String, String> headers = {'content-type': 'application/json'};

    Response response = await post(Uri.parse(url), headers: headers);

    var salary = jsonDecode(response.body);

    List<SalaryState> _list = [];
    for (var i = 0; i < salary['data'].length; i++) {
      var exData = salary['data'][i].split('|');

      var exYmd = exData[0].split('-');
      if (int.parse(exYmd[0]) < 2020) {
        continue;
      }

      _list.add(
        SalaryState(
          date: exData[0],
          ym: exData[1],
          price: exData[2],
          company: exData[3],
        ),
      );
    }

    state = _list;
  }
}

//////////////////////////////////////////////////////////////////////
