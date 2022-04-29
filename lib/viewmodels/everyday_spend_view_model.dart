import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/everyday_spend_model.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final everydaySpendProvider = StateNotifierProvider.autoDispose
    .family<EverydaySpendStateNotifier, List<EverydaySpendData>, String>(
        (ref, date) {
  return EverydaySpendStateNotifier([])..getEverydaySpendData(date: date);
});

class EverydaySpendStateNotifier
    extends StateNotifier<List<EverydaySpendData>> {
  EverydaySpendStateNotifier(List<EverydaySpendData> state) : super(state);

  ///
  void getEverydaySpendData({required String date}) async {
    String url = "http://toyohide.work/BrainLog/api/everydaySpendSearch";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"date": date});
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);
    final everydaySpend = everydaySpendFromJson(response.body);
    state = everydaySpend.data;
  }
}

//////////////////////////////////////////////////////////////////////
