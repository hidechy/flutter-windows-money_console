import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/shintaku.dart';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final shintakuProvider = StateNotifierProvider.autoDispose
    .family<ShintakuStateNotifier, List<ShintakuRecord>, String>((ref, date) {
  return ShintakuStateNotifier([])..getShintakuData(date: date);
});

class ShintakuStateNotifier extends StateNotifier<List<ShintakuRecord>> {
  ShintakuStateNotifier(List<ShintakuRecord> state) : super(state);

  ///
  void getShintakuData({required String date}) async {
    String url = "http://toyohide.work/BrainLog/api/getDataShintaku";
    Map<String, String> headers = {'content-type': 'application/json'};
    Response response = await post(Uri.parse(url), headers: headers);

    final shintaku = shintakuFromJson(response.body);

    final exDate = shintaku.data.date.toString().split(' ');

    List<ShintakuRecord> shintakuRecord = [];

    if (date.compareTo(exDate[0]) <= 0) {
      if (shintaku.data.record.isNotEmpty) {
        for (var i = 0; i < shintaku.data.record.length; i++) {
          shintakuRecord.add(shintaku.data.record[i]);
        }
      }
    }

    state = shintakuRecord;
  }
}

//////////////////////////////////////////////////////////////////////
