import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_console/models/seiyu_purchase_model.dart';
import 'package:money_console/screens/components/blank_screen.dart';

import '../viewmodels/seiyu_purchase_view_model.dart';

import '../utility/utility.dart';

class SeiyuDisplayScreen extends ConsumerWidget {
  SeiyuDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seiyuPurchaseState = ref.watch(seiyuPurchaseProvider);
    final seiyuData = getSeiyuData(data: seiyuPurchaseState);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        width: MediaQuery.of(context).size.width - 200,
        height: MediaQuery.of(context).size.height - 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: SizedBox(
          height: 220,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 220,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: dispSeiyuList(data: seiyuData),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 220,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.white.withOpacity(0.2),
                            width: 3,
                          ),
                        ),
                      ),
                      child: const BlankScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  List<Map<String, dynamic>> getSeiyuData(
      {required List<SeiyuPurchaseData> data}) {
    List<Map<String, dynamic>> seiyuData = [];

    Map<String, dynamic> spdMap = {};
    List<String> dateList = [];

    var checkDate = '';
    List<SeiyuPurchaseData> list = [];
    Map<String, int> dateSum = {};
    int priceSum = 0;

    for (var i = 0; i < data.length; i++) {
      final exDate = data[i].date.toString().split(' ');

      if (exDate[0] != checkDate) {
        list = [];
        priceSum = 0;

        dateList.add(exDate[0]);
      }

      list.add(data[i]);
      priceSum += int.parse(data[i].price);

      spdMap[exDate[0]] = list;
      dateSum[exDate[0]] = priceSum;

      checkDate = exDate[0];
    }

    for (var i = 0; i < dateList.length; i++) {
      Map<String, dynamic> _map = {};
      _map['date'] = dateList[i];
      _map['sum'] = dateSum[dateList[i]];
      _map['list'] = spdMap[dateList[i]];
      seiyuData.add(_map);
    }

    return seiyuData;
  }

  ///
  Widget dispSeiyuList({required List<Map<String, dynamic>> data}) {
    List<Widget> _list = [];

    for (var i = 0; i < data.length; i++) {
      _list.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: 3,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(child: Text(data[i]['date'])),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: Text(
                    _utility.makeCurrencyDisplay(data[i]['sum'].toString())),
              ),
            ),
          ],
        ),
      ));
    }

    return SingleChildScrollView(
      child: Column(
        children: _list,
      ),
    );
  }
}
