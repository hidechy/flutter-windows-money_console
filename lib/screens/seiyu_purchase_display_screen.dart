// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/seiyu_purchase_model.dart';
import 'components/blank_screen.dart';
import 'seiyu_purchase_detail_display_screen.dart';

import '../viewmodels/seiyu_purchase_view_model.dart';

import '../utility/utility.dart';

class SeiyuPurchaseDisplayScreen extends ConsumerWidget {
  SeiyuPurchaseDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  late WidgetRef _ref;

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    final seiyuPurchaseState = ref.watch(seiyuPurchaseProvider);
    final seiyuData = getSeiyuData(data: seiyuPurchaseState);

    final seiyuPurchaseDetailState = ref.watch(seiyuPurchaseDetailProvider);

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
              Container(
                margin: const EdgeInsets.only(top: 2, bottom: 30),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white.withOpacity(0.2),
                      width: 3,
                    ),
                  ),
                  color: Colors.yellowAccent.withOpacity(0.3),
                ),
                width: double.infinity,
                child: const Text('西友購入履歴'),
              ),
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
                      child: screenSelector(
                        data: seiyuPurchaseDetailState,
                      ),
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

    var keepYm = '';
    for (var i = 0; i < data.length; i++) {
      var exYmd = data[i]['date'].split('-');

      if (keepYm != '${exYmd[0]}-${exYmd[1]}') {
        _list.add(
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.3),
            ),
            child: Text('${exYmd[0]}-${exYmd[1]}'),
          ),
        );
      }

      _list.add(MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            final seiyuPurchaseDetailViewModel =
                _ref.watch(seiyuPurchaseDetailProvider.notifier);
            seiyuPurchaseDetailViewModel.setSeiyuPurchaseDetailData(
                data: data[i]['list']);
          },
          child: Container(
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
                    child: Text(_utility
                        .makeCurrencyDisplay(data[i]['sum'].toString())),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));

      keepYm = '${exYmd[0]}-${exYmd[1]}';
    }

    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        children: _list,
      ),
    );
  }

  ///
  Widget screenSelector({required List<SeiyuPurchaseData> data}) {
    if (data.isNotEmpty) {
      return SeiyuPurchaseDetailDisplayScreen();
    } else {
      return const BlankScreen();
    }
  }
}
