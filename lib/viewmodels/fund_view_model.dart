import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_console/state/fund_detail_state.dart';

import '../state/fund_state.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final fundProvider =
    StateNotifierProvider.autoDispose<FundStateNotifier, List<FundState>>(
        (ref) {
  return FundStateNotifier([])..getFundData();
});

class FundStateNotifier extends StateNotifier<List<FundState>> {
  FundStateNotifier(List<FundState> state) : super(state);

  ///
  void getFundData() async {
    String url = "http://toyohide.work/BrainLog/api/getFundRecord";
    Map<String, String> headers = {'content-type': 'application/json'};
    Response response = await post(Uri.parse(url), headers: headers);

    final fd = jsonDecode(response.body);

    final fund = fd['data'];

    List<FundState> _list = [];
    for (var i = 0; i < fund.length; i++) {
      var exFund = fund[i].split(':');
      var fundName = exFund[0];
      var exData = exFund[1].split('/');

      List<FundDetailState> _list2 = [];
      for (var j = 0; j < exData.length; j++) {
        var value = exData[j].split('|');
        _list2.add(
          FundDetailState(
            date: value[0],
            basePrice: value[1],
            compareFront: value[2],
            yearlyReturn: value[3],
            upDown: value[4],
          ),
        );
      }

      _list.add(
        FundState(
          fundName: fundName,
          list: _list2,
        ),
      );
    }

    state = _list;
  }
}

//////////////////////////////////////////////////////////////////////
