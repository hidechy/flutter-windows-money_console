import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/stock.dart';

import 'package:http/http.dart';

//////////////////////////////////////////////////////////////////////

final stockProvider = StateNotifierProvider.autoDispose
    .family<StockStateNotifier, List<StockRecord>, String>((ref, date) {
  return StockStateNotifier([])..getStockData(date: date);
});

class StockStateNotifier extends StateNotifier<List<StockRecord>> {
  StockStateNotifier(List<StockRecord> state) : super(state);

  ///
  void getStockData({required String date}) async {
    String url = "http://toyohide.work/BrainLog/api/getDataStock";
    Map<String, String> headers = {'content-type': 'application/json'};
    Response response = await post(Uri.parse(url), headers: headers);

    final stock = stockFromJson(response.body);

    final exDate = stock.data.date.toString().split(' ');

    List<StockRecord> stockRecord = [];

    if (date.compareTo(exDate[0]) <= 0) {
      if (stock.data.record.isNotEmpty) {
        for (var i = 0; i < stock.data.record.length; i++) {
          stockRecord.add(stock.data.record[i]);
        }
      }
    }

    state = stockRecord;
  }
}

//////////////////////////////////////////////////////////////////////
