// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/month_summary_model.dart';
import '../models/seiyu_purchase_model.dart';

import '../utility/utility.dart';

import 'components/blank_screen.dart';
import 'food_expenses_display_screen.dart';

import '../viewmodels/calendar_view_model.dart';
import '../viewmodels/month_summary_view_model.dart';
import '../viewmodels/seiyu_purchase_view_model.dart';

// I can not use these.
/////import '../request/date_request.dart';
/////import '../state/food_expenses_state.dart';
/////import '../viewmodels/food_expenses_view_model.dart';

class MonthSummaryDisplayScreen extends ConsumerWidget {
  MonthSummaryDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  late WidgetRef _ref;

  String _ym = '';
  String _date = '';

  int _monthSpendSum = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    //-------------------
    var calendarSelectDateState = ref.watch(calendarSelectDateProvider);
    if (calendarSelectDateState == "") {
      calendarSelectDateState = DateTime.now().toString();
    }
    _utility.makeYMDYData(calendarSelectDateState);

    final ym = '${_utility.year}-${_utility.month}';
    _ym = ym;

    final date = '${_utility.year}-${_utility.month}-${_utility.day}';
    _date = date;
    //-------------------

    final monthSummaryState = ref.watch(monthSummaryProvider(date));
    final monthSpendSum = getMonthSpendSum(data: monthSummaryState);
    _monthSpendSum = monthSpendSum;

    final seiyuPurchaseState = ref.watch(seiyuPurchaseProvider);

    // これは未来への課題として残しておく
    // 解決できる日が来るといいね
    // final foodExpensesState = ref.watch(foodExpensesProvider);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        width: MediaQuery.of(context).size.width - 200,
        height: MediaQuery.of(context).size.height - 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
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
                    color: Colors.white.withOpacity(0.3),
                    width: 3,
                  ),
                ),
                color: Colors.yellowAccent.withOpacity(0.3),
              ),
              width: double.infinity,
              child: Text(ym),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _utility.makeCurrencyDisplay(monthSpendSum.toString()),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 220,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: dispMonthSummaryList(data: monthSummaryState),
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
                          color: Colors.white.withOpacity(0.3),
                          width: 3,
                        ),
                      ),
                    ),
                    child: screenSelector(
                      data: monthSummaryState,
                      data2: seiyuPurchaseState,
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
  Widget dispMonthSummaryList({required List<MonthSummaryData> data}) {
    List<Widget> _list = [];

    for (var i = 0; i < data.length; i++) {
      _list.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.3),
              width: 3,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(flex: 2, child: Text(data[i].item)),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child:
                    Text(_utility.makeCurrencyDisplay(data[i].sum.toString())),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: Text(data[i].percent.toString()),
              ),
            ),
            Expanded(
              child: getItemIcon(item: data[i].item),
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

  ///
  int getMonthSpendSum({required List<MonthSummaryData> data}) {
    int sum = 0;

    for (var i = 0; i < data.length; i++) {
      sum += data[i].sum;
    }

    return sum;
  }

  ///
  Widget getItemIcon({required String item}) {
    switch (item) {
      case "credit":
        return GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.credit_card,
            color: Colors.greenAccent,
          ),
        );
      case "食費":
        return GestureDetector(
          onTap: () {
            final seiyuPurchaseViewModel =
                _ref.watch(seiyuPurchaseProvider.notifier);
            seiyuPurchaseViewModel.getSeiyuPurchaseData(date: _date);
          },
          child: const Icon(
            Icons.fastfood,
            color: Colors.greenAccent,
          ),
        );
      default:
        return const Icon(Icons.check_box_outline_blank,
            color: Color(0xFF2e2e2e));
    }
  }

  ///
  Widget screenSelector(
      {required List<MonthSummaryData> data,
      required List<SeiyuPurchaseData> data2}) {
    if (data2.isNotEmpty) {
      var food = 0;
      var milk = 0;
      var bentou = 0;
      for (var i = 0; i < data.length; i++) {
        switch (data[i].item) {
          case '食費':
            food = data[i].sum;
            break;
          case '牛乳代':
            milk = data[i].sum;
            break;
          case '弁当代':
            bentou = data[i].sum;
            break;
        }
      }

      var seiyu = 0;
      for (var i = 0; i < data2.length; i++) {
        final exDate = data2[i].date.toString().split('-');
        if (_ym == '${exDate[0]}-${exDate[1]}') {
          if (RegExp(r'非食品').hasMatch(data2[i].item)) {
            continue;
          }

          seiyu += int.parse(data2[i].price);
        }
      }

      final sum = (food + milk + bentou + seiyu);

      final wariai = (sum / _monthSpendSum * 100).floor();

      ////////////////////////////////////////
      final now = DateTime.now();
      _utility.makeYMDYData(now.toString());

      var endDay = 0;
      final exDate = _date.split('-');
      if (_ym == '${_utility.year}-${_utility.month}') {
        endDay = int.parse(exDate[exDate.length - 1]);
      } else {
        final lastMonthEndDate =
            DateTime(int.parse(exDate[0]), (int.parse(exDate[1]) + 1), 0);
        _utility.makeYMDYData(lastMonthEndDate.toString());
        endDay = int.parse(_utility.day);
      }

      final average = (sum / endDay).ceil();
      ////////////////////////////////////////

      Map<String, dynamic> _foodExpenses = {
        "food": food,
        "milk": milk,
        "bentou": bentou,
        "seiyu": seiyu,
        "sum": sum,
        "wariai": wariai,
        "endDay": endDay,
        "average": average,
      };

      return FoodExpensesDisplayScreen(foodExpenses: _foodExpenses);
    } else {
      return const BlankScreen();
    }
  }
}
