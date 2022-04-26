import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/money_state.dart';

import 'dart:convert';

import 'package:http/http.dart';

import '../utility/utility.dart';

//////////////////////////////////////////////////////////////////////

final moneyProvider = StateNotifierProvider.autoDispose
    .family<MoneyStateNotifier, MoneyState, String>((ref, date) {
  return MoneyStateNotifier()..getMoneyData(date: date);
});

class MoneyStateNotifier extends StateNotifier<MoneyState> {
  MoneyStateNotifier()
      : super(
          const MoneyState(
            yen_10000: 0,
            yen_5000: 0,
            yen_2000: 0,
            yen_1000: 0,
            yen_500: 0,
            yen_100: 0,
            yen_50: 0,
            yen_10: 0,
            yen_5: 0,
            yen_1: 0,
            bankA: 0,
            bankB: 0,
            bankC: 0,
            bankD: 0,
            bankE: 0,
            peyA: 0,
            peyB: 0,
            peyC: 0,
            peyD: 0,
            peyE: 0,
            total: 0,
          ),
        );

  ///
  void getMoneyData({required String date}) async {
    try {
      String url = "http://toyohide.work/BrainLog/api/moneydownload";
      Map<String, String> headers = {'content-type': 'application/json'};
      String body = json.encode({"date": date});

      Response response =
          await post(Uri.parse(url), headers: headers, body: body);

      var money = jsonDecode(response.body);

      ///////////////////////////////////////////////
      Utility _utility = Utility();
      _utility.makeTotal(money['data']);
      ///////////////////////////////////////////////

      var exMoney = (money['data']).split('|');

      state = state.copyWith(
        yen_10000: int.parse(exMoney[0]),
        yen_5000: int.parse(exMoney[1]),
        yen_2000: int.parse(exMoney[2]),
        yen_1000: int.parse(exMoney[3]),
        yen_500: int.parse(exMoney[4]),
        yen_100: int.parse(exMoney[5]),
        yen_50: int.parse(exMoney[6]),
        yen_10: int.parse(exMoney[7]),
        yen_5: int.parse(exMoney[8]),
        yen_1: int.parse(exMoney[9]),
        bankA: int.parse(exMoney[10]),
        bankB: int.parse(exMoney[11]),
        bankC: int.parse(exMoney[12]),
        bankD: int.parse(exMoney[13]),
        bankE: int.parse(exMoney[14]),
        peyA: int.parse(exMoney[15]),
        peyB: int.parse(exMoney[16]),
        peyC: int.parse(exMoney[17]),
        peyD: int.parse(exMoney[18]),
        peyE: int.parse(exMoney[19]),
        total: _utility.total,
      );
    } catch (e) {
      throw e.toString();
    }
  }
}

//////////////////////////////////////////////////////////////////////
