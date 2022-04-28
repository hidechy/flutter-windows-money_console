import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/spend_item_state.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final spendItemProvider = StateNotifierProvider.autoDispose
    .family<SpendItemStateNotifier, List<SpendItemState>, String>((ref, date) {
  return SpendItemStateNotifier([])..getSpendItemData(date: date);
});

class SpendItemStateNotifier extends StateNotifier<List<SpendItemState>> {
  SpendItemStateNotifier(List<SpendItemState> state) : super(state);

  ///
  void getSpendItemData({required String date}) async {
    String url = "http://toyohide.work/BrainLog/api/monthlyspenditem";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"date": date});
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);

    var si = jsonDecode(response.body);

    if (si['data'][date] != null) {
      var spendItem = si['data'][date];

      List<SpendItemState> _list = [];
      for (var i = 0; i < spendItem.length; i++) {
        _list.add(SpendItemState(
          koumoku: spendItem[i]['koumoku'],
          price: spendItem[i]['price'].toString(),
          bank: spendItem[i]['bank'],
        ));
      }

      state = _list;
    }
  }
}

//////////////////////////////////////////////////////////////////////
