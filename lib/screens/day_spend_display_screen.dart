import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/everyday_spend_model.dart';

import '../state/money_state.dart';
import '../state/spend_item_state.dart';

import '../utility/utility.dart';

import '../viewmodels/everyday_spend_view_model.dart';
import '../viewmodels/holiday_view_model.dart';
import '../viewmodels/money_view_model.dart';
import '../viewmodels/spend_item_view_model.dart';
import '../viewmodels/train_view_model.dart';

import 'components/month_date_money_display_cell.dart';

class DaySpendDisplayScreen extends ConsumerWidget {
  DaySpendDisplayScreen({Key? key, required this.date, required this.spend})
      : super(key: key);

  final String date;
  final int spend;

  final Utility _utility = Utility();

  final ScrollController _controller = ScrollController();
  final ScrollController _controller2 = ScrollController();
  final ScrollController _controller3 = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moneyState = ref.watch(moneyProvider(date));

    final spendItemState = ref.watch(spendItemProvider(date));

//    final timePlaceState = ref.watch(timePlaceProvider(date));

    final trainState = ref.watch(trainProvider(date));

    final everydaySpendState = ref.watch(everydaySpendProvider(date));
    final todayEverydaySpend =
        getTodayEverydaySpend(date: date, data: everydaySpendState);

    var step = '';
    var distance = '';
    step = todayEverydaySpend.step.toString();
    distance = todayEverydaySpend.distance.toString();

    final holidayState = ref.watch(holidayProvider);

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
                color: _utility.getBgColor(date, holidayState),
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date),
                  Row(
                    children: [
                      Text('$step steps.'),
                      const SizedBox(width: 30),
                      Text('$distance m.'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _utility.makeCurrencyDisplay(moneyState.total.toString()),
                  ),
                  Text(
                    _utility.makeCurrencyDisplay(spend.toString()),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 220,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: dispMoneyList(data: moneyState),
                  ),
                ),
                Expanded(
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
                  child: dispSpendItemList(
                    height: MediaQuery.of(context).size.height - 220,
                    data: spendItemState,
                    data2: trainState,
                  ),
                )),
                Expanded(
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
                    child: dispEverydaySpendList(
                      data: todayEverydaySpend,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  EverydaySpendData getTodayEverydaySpend(
      {required String date, required List<EverydaySpendData> data}) {
    var everydaySpendData = EverydaySpendData(
        spend: 0, record: '', diff: 0, step: '', distance: '');

    for (var i = 0; i < data.length; i++) {
      final exDate = data[i].date.toString().split(' ');
      if (date == exDate[0]) {
        everydaySpendData = data[i];
      }
    }
    return everydaySpendData;
  }

  ///
  Widget dispMoneyList({required MoneyState data}) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        children: [
          MonthDateMoneyDisplayCell(type: '10000', price: data.yen_10000),
          MonthDateMoneyDisplayCell(type: '5000', price: data.yen_5000),
          MonthDateMoneyDisplayCell(type: '2000', price: data.yen_2000),
          MonthDateMoneyDisplayCell(type: '1000', price: data.yen_1000),
          MonthDateMoneyDisplayCell(type: '500', price: data.yen_500),
          MonthDateMoneyDisplayCell(type: '100', price: data.yen_100),
          MonthDateMoneyDisplayCell(type: '50', price: data.yen_50),
          MonthDateMoneyDisplayCell(type: '10', price: data.yen_10),
          MonthDateMoneyDisplayCell(type: '5', price: data.yen_5),
          MonthDateMoneyDisplayCell(type: '1', price: data.yen_1),
          const SizedBox(height: 50),
          MonthDateMoneyDisplayCell(type: 'bankA', price: data.bankA),
          MonthDateMoneyDisplayCell(type: 'bankB', price: data.bankB),
          MonthDateMoneyDisplayCell(type: 'bankC', price: data.bankC),
          MonthDateMoneyDisplayCell(type: 'bankD', price: data.bankD),
          MonthDateMoneyDisplayCell(type: 'bankE', price: data.bankE),
          const SizedBox(height: 50),
          MonthDateMoneyDisplayCell(type: 'payA', price: data.peyA),
          MonthDateMoneyDisplayCell(type: 'payB', price: data.peyB),
          MonthDateMoneyDisplayCell(type: 'payC', price: data.peyC),
          MonthDateMoneyDisplayCell(type: 'payD', price: data.peyD),
          MonthDateMoneyDisplayCell(type: 'payE', price: data.peyE),
        ],
      ),
    );
  }

  ///
  Widget dispEverydaySpendList({required EverydaySpendData data}) {
    if (data.record.isEmpty) {
      return Container();
    }

    final exRecord = data.record.split('/');

    List<Widget> _list = [];
    for (var i = 0; i < exRecord.length; i++) {
      final exRe = exRecord[i].split('|');

      _list.add(
        Container(
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
              Expanded(child: Text(exRe[0])),
              Expanded(child: Text(exRe[1])),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(_utility.makeCurrencyDisplay(exRe[2])),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      controller: _controller2,
      child: Column(
        children: _list,
      ),
    );
  }

  ///
  Widget dispSpendItemList(
      {required double height,
      required List<SpendItemState> data,
      required String data2}) {
    List<Widget> _list = [];
    for (var i = 0; i < data.length; i++) {
      _list.add(
        Container(
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
              Expanded(child: Text(data[i].koumoku)),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(data[i].price),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 3,
              ),
            ),
          ),
          height: height * 0.7,
          child: SingleChildScrollView(
            controller: _controller3,
            child: Column(
              children: _list,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(data2),
        ),
      ],
    );
  }
}
