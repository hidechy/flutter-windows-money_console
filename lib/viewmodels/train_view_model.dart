import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final trainProvider = StateNotifierProvider.autoDispose
    .family<TrainStateNotifier, String, String>((ref, date) {
  return TrainStateNotifier('')..getTrainData(date: date);
});

class TrainStateNotifier extends StateNotifier<String> {
  TrainStateNotifier(String state) : super(state);

  ///
  void getTrainData({required String date}) async {
    String url = "http://toyohide.work/BrainLog/api/monthlytraindata";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"date": date});
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);

    var tr = jsonDecode(response.body);

    if (tr['data'][date] != null) {
      state = tr['data'][date][0];
    }
  }
}

//////////////////////////////////////////////////////////////////////
