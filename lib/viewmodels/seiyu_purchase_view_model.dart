import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/seiyu_purchase_model.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final seiyuPurchaseProvider = StateNotifierProvider.autoDispose<
    SeiyuPurchaseStateNotifier, List<SeiyuPurchaseData>>((ref) {
//  return SeiyuPurchaseStateNotifier([])..getSeiyuPurchaseData(date: date);
  return SeiyuPurchaseStateNotifier([]);
});

class SeiyuPurchaseStateNotifier
    extends StateNotifier<List<SeiyuPurchaseData>> {
  SeiyuPurchaseStateNotifier(List<SeiyuPurchaseData> state) : super(state);

  ///
  void getSeiyuPurchaseData({required String date}) async {
    String url = "http://toyohide.work/BrainLog/api/seiyuuPurchaseList";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"date": date});
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);
    final seiyuPurchase = seiyuPurchaseFromJson(response.body);

    state = seiyuPurchase.data;
  }
}

//////////////////////////////////////////////////////////////////////
