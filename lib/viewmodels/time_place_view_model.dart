import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/time_place_state.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final timePlaceProvider = StateNotifierProvider.autoDispose
    .family<TimePlaceStateNotifier, List<TimePlaceState>, String>((ref, date) {
  return TimePlaceStateNotifier([])..getTimePlaceData(date: date);
});

class TimePlaceStateNotifier extends StateNotifier<List<TimePlaceState>> {
  TimePlaceStateNotifier(List<TimePlaceState> state) : super(state);

  ///
  void getTimePlaceData({required String date}) async {
    String url = "http://toyohide.work/BrainLog/api/monthlytimeplace";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"date": date});
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);

    var tp = jsonDecode(response.body);

    if (tp['data'][date] != null) {
      var timePlace = tp['data'][date];

      List<TimePlaceState> _list = [];
      for (var i = 0; i < timePlace.length; i++) {
        _list.add(TimePlaceState(
          time: timePlace[i]['time'],
          place: timePlace[i]['place'],
          price: timePlace[i]['price'],
        ));
      }

      state = _list;
    }
  }
}

//////////////////////////////////////////////////////////////////////
