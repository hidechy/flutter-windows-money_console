import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/amazon_purchase_model.dart';

import 'dart:convert';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final amazonPurchaseProvider = StateNotifierProvider.autoDispose
    .family<AmazonPurchaseStateNotifier, List<AmazonPurchaseData>, String>(
        (ref, date) {
  return AmazonPurchaseStateNotifier([])..getAmazonPurchaseData(date: date);
});

class AmazonPurchaseStateNotifier
    extends StateNotifier<List<AmazonPurchaseData>> {
  AmazonPurchaseStateNotifier(List<AmazonPurchaseData> state) : super(state);

  ///
  void getAmazonPurchaseData({required String date}) async {
    String url = "http://toyohide.work/BrainLog/api/amazonPurchaseList";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"date": date});
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);
    final amazonPurchase = amazonPurchaseFromJson(response.body);
    state = amazonPurchase.data;
  }
}

//////////////////////////////////////////////////////////////////////
