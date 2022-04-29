import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/gold_model.dart';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final goldProvider =
    StateNotifierProvider.autoDispose<GoldStateNotifier, List<GoldData>>((ref) {
  return GoldStateNotifier([])..getGoldData();
});

class GoldStateNotifier extends StateNotifier<List<GoldData>> {
  GoldStateNotifier(List<GoldData> state) : super(state);

  ///
  void getGoldData() async {
    String url = "http://toyohide.work/BrainLog/api/getgolddata";
    Map<String, String> headers = {'content-type': 'application/json'};
    Response response = await post(Uri.parse(url), headers: headers);

    final gold = goldFromJson(response.body);

    state = gold.data;
  }
}

//////////////////////////////////////////////////////////////////////
