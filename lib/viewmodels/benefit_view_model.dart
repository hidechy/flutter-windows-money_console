import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/benefit_entity.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final benefitProvider =
    StateNotifierProvider.autoDispose<BenefitStateNotifier, List<Benefit>>(
        (ref) {
  return BenefitStateNotifier([])..getBenefitData();
});

class BenefitStateNotifier extends StateNotifier<List<Benefit>> {
  BenefitStateNotifier(List<Benefit> state) : super(state);

  ///
  void getBenefitData() async {
    String url = "http://toyohide.work/BrainLog/api/getAllBenefit";
    Map<String, String> headers = {'content-type': 'application/json'};
    Response response = await post(Uri.parse(url), headers: headers);
    var benefit = jsonDecode(response.body);

    if (benefit['data'].length > 0) {
      List<Benefit> _list = [];
      for (var i = 0; i < benefit['data'].length; i++) {
        final exBenefit = benefit['data'][i].split('|');

        _list.add(
          Benefit(
            date: exBenefit[0],
            yearmonth: exBenefit[1],
            price: int.parse(exBenefit[2]),
            company: exBenefit[3],
          ),
        );
      }

      state = _list;
    }
  }
}

//////////////////////////////////////////////////////////////////////
