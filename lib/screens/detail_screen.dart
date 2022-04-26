// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_console/models/gold.dart';
import 'package:money_console/models/shintaku.dart';
import 'package:money_console/models/stock.dart';
import 'package:money_console/screens/gold_display_screen.dart';
import 'package:money_console/state/money_state.dart';
import 'package:money_console/viewmodels/gold_view_model.dart';
import 'package:money_console/viewmodels/shintaku_view_model.dart';
import 'package:money_console/viewmodels/stock_view_model.dart';

import '../viewmodels/calendar_view_model.dart';
import '../viewmodels/money_view_model.dart';

import '../utility/utility.dart';

import 'components/money_display_cell.dart';

class DetailScreen extends ConsumerWidget {
  DetailScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  late BuildContext _context;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;

    var calendarSelectDateState = ref.watch(calendarSelectDateProvider);

    if (calendarSelectDateState == "") {
      calendarSelectDateState = DateTime.now().toString();
    }

    final exDate = calendarSelectDateState.split(' ');

    final moneyState = ref.watch(moneyProvider(exDate[0]));

    int toushiTotal = 0;

    final goldState = ref.watch(goldProvider);
    var todayGold = getTodayGold(date: exDate[0], data: goldState);
    if (todayGold != null) {
      if (todayGold.payPrice == '-') {
        todayGold = null;
      } else {
        toushiTotal += int.parse(todayGold.goldValue.toString());
      }
    }

    final stockState = ref.watch(stockProvider(exDate[0]));
    final todayStock = (stockState.isNotEmpty) ? stockState : null;
    if (todayStock != null) {
      for (var i = 0; i < todayStock.length; i++) {
        toushiTotal += int.parse(todayStock[i].price.toString());
      }
    }

    final shintakuState = ref.watch(shintakuProvider(exDate[0]));
    final todayShintaku = (shintakuState.isNotEmpty) ? shintakuState : null;
    if (todayShintaku != null) {
      for (var i = 0; i < todayShintaku.length; i++) {
        toushiTotal += int.parse(todayShintaku[i].price.toString());
      }
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      exDate[0],
                      style: const TextStyle(fontSize: 30),
                    ),
                    Row(
                      children: [
                        Text(
                          _utility
                              .makeCurrencyDisplay(moneyState.total.toString()),
                          style: const TextStyle(fontSize: 20),
                        ),
                        if (toushiTotal > 0)
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              _utility
                                  .makeCurrencyDisplay(toushiTotal.toString()),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                dispCurrency(moneyState),
                dispBank(moneyState),
                dispEMoney(moneyState),
                if (todayGold != null) dispGold(todayGold),
                if (todayStock != null) dispStock(todayStock),
                if (todayShintaku != null) dispShintaku(todayShintaku),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget dispEMoney(MoneyState moneyState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text(
          'E-Money',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            MoneyDisplayCell(
              type: 'payA',
              price: moneyState.peyA.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'payB',
              price: moneyState.peyB.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'payC',
              price: moneyState.peyC.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'payD',
              price: moneyState.peyD.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'payE',
              price: moneyState.peyE.toString(),
              colorFlag: 1,
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }

  ///
  Widget dispBank(MoneyState moneyState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text(
          'Bank',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            MoneyDisplayCell(
              type: 'bankA',
              price: moneyState.bankA.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'bankB',
              price: moneyState.bankB.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'bankC',
              price: moneyState.bankC.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'bankD',
              price: moneyState.bankD.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'bankE',
              price: moneyState.bankE.toString(),
              colorFlag: 1,
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }

  ///
  Widget dispCurrency(MoneyState moneyState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Currency',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            MoneyDisplayCell(
              type: '10000',
              price: moneyState.yen_10000.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: '5000',
              price: moneyState.yen_5000.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: '2000',
              price: moneyState.yen_2000.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: '1000',
              price: moneyState.yen_1000.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: '500',
              price: moneyState.yen_500.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: '100',
              price: moneyState.yen_100.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: '50',
              price: moneyState.yen_50.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: '10',
              price: moneyState.yen_10.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: '5',
              price: moneyState.yen_5.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: '1',
              price: moneyState.yen_1.toString(),
              colorFlag: 1,
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }

  ///
  getTodayGold({required String date, required List<GoldData> data}) {
    var goldData;
    for (var i = 0; i < data.length; i++) {
      if (date == '${data[i].year}-${data[i].month}-${data[i].day}') {
        goldData = data[i];
      }
    }
    return goldData;
  }

  ///
  Widget dispGold(todayGold) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text(
          'Gold',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent.withOpacity(0.3),
              ),
              onPressed: () {
                showDialog(
                  context: _context,
                  builder: (_) {
                    return const GoldDisplayScreen();
                  },
                );
              },
              child: const Text('Detail'),
            ),
            const SizedBox(width: 20),
            MoneyDisplayCell(
              type: 'PayPrice',
              price: todayGold.payPrice.toString(),
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'GoldValue',
              price: todayGold.goldValue.toString(),
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'Gain',
              price: (todayGold.goldValue == '-')
                  ? '-'
                  : (todayGold.goldValue - todayGold.payPrice).toString(),
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'GoldTanka',
              price: todayGold.goldTanka.toString(),
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'Diff',
              price: todayGold.diff.toString(),
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'GoldPrice',
              price: todayGold.goldPrice.toString(),
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'GramNum',
              price: todayGold.gramNum.toString(),
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'TotalGram',
              price: todayGold.totalGram.toString(),
              colorFlag: 0,
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }

  ///
  Widget dispStock(List<StockRecord> todayStock) {
    List<Widget> _list = [];
    for (var i = 0; i < todayStock.length; i++) {
      final exDate = todayStock[i].date.toString().split(' ');

      _list.add(
        Row(
          children: [
            MoneyDisplayCell(
              type: 'Date',
              price: exDate[0],
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: todayStock[i].name,
              price: '',
              colorFlag: 0,
              flex: 5,
            ),
            MoneyDisplayCell(
              type: 'StockValue',
              price: todayStock[i].price,
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'Cost',
              price: todayStock[i].cost.toString(),
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'Gain',
              price: todayStock[i].diff.toString(),
              colorFlag: 0,
              flex: 1,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text(
          'Stock',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Column(
          children: _list,
        ),
      ],
    );
  }

  ///
  dispShintaku(List<ShintakuRecord> todayShintaku) {
    List<Widget> _list = [];

    for (var i = 0; i < todayShintaku.length; i++) {
      final exDate = todayShintaku[i].date.toString().split(' ');

      _list.add(
        Row(
          children: [
            MoneyDisplayCell(
              type: 'Date',
              price: exDate[0],
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: todayShintaku[i].name,
              price: '',
              colorFlag: 0,
              flex: 5,
            ),
            MoneyDisplayCell(
              type: 'ShintakuValue',
              price: todayShintaku[i].price,
              colorFlag: 1,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'Cost',
              price: todayShintaku[i].cost.toString(),
              colorFlag: 0,
              flex: 1,
            ),
            MoneyDisplayCell(
              type: 'Gain',
              price: todayShintaku[i].diff.toString(),
              colorFlag: 0,
              flex: 1,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text(
          'Shintaku',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Column(
          children: _list,
        ),
      ],
    );
  }

  /////////////////////////////////////////////////////////

}
