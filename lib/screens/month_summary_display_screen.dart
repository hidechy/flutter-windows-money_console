// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/month_summary_model.dart';
import '../models/seiyu_purchase_model.dart';

import '../state/credit_detail_state.dart';

import '../utility/utility.dart';

import '../viewmodels/calendar_view_model.dart';
import '../viewmodels/credit_view_model.dart';
import '../viewmodels/month_summary_view_model.dart';
import '../viewmodels/seiyu_purchase_view_model.dart';

import 'credit_display_screen.dart';
import 'food_expenses_display_screen.dart';

import 'components/blank_screen.dart';

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

    final prevMonth =
        DateTime(int.parse(_utility.year), int.parse(_utility.month) - 1, 1);
    final nextMonth =
        DateTime(int.parse(_utility.year), int.parse(_utility.month) + 1, 1);

    final calendarViewModel = ref.watch(calendarSelectDateProvider.notifier);
    //-------------------

    final monthSummaryState = ref.watch(monthSummaryProvider(date));
    final monthSpendSum = getMonthSpendSum(data: monthSummaryState);
    _monthSpendSum = monthSpendSum;

    final seiyuPurchaseState = ref.watch(seiyuPurchaseProvider);

    final creditState = ref.watch(creditProvider);

    // ???????????????????????????????????????????????????
    // ???????????????????????????????????????
    // final foodExpensesState = ref.watch(foodExpensesProvider);

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
                color: Colors.yellowAccent.withOpacity(0.3),
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ym),
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            if (ym == '2020-01') {
                            } else {
                              calendarViewModel.setCalendarSelectDate(
                                  date: prevMonth.toString());
                            }
                          },
                          child: const Icon(Icons.skip_previous),
                        ),
                      ),
                      const SizedBox(width: 10),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            calendarViewModel.setCalendarSelectDate(
                                date: nextMonth.toString());
                          },
                          child: const Icon(Icons.skip_next),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                          color: Colors.white.withOpacity(0.2),
                          width: 3,
                        ),
                      ),
                    ),
                    child: screenSelector(
                      data: monthSummaryState,
                      data2: seiyuPurchaseState,
                      data3: creditState,
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
              color: Colors.white.withOpacity(0.2),
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
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              _ref.watch(seiyuPurchaseProvider.notifier).init();

              final creditViewModel = _ref.watch(creditProvider.notifier);
              creditViewModel.getCreditData(date: _date);
            },
            child: const Icon(
              Icons.credit_card,
              color: Colors.greenAccent,
            ),
          ),
        );
      case "??????":
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              _ref.watch(creditProvider.notifier).init();

              final seiyuPurchaseViewModel =
                  _ref.watch(seiyuPurchaseProvider.notifier);
              seiyuPurchaseViewModel.getSeiyuPurchaseData(date: _date);
            },
            child: const Icon(
              Icons.fastfood,
              color: Colors.greenAccent,
            ),
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
      required List<SeiyuPurchaseData> data2,
      required CreditDetailState data3}) {
    final isCreditScreenDisp = (data3.ucCreditData.isNotEmpty ||
            data3.rakutenCreditData.isNotEmpty ||
            data3.sumitomoCreditData.isNotEmpty ||
            data3.amexCreditData.isNotEmpty)
        ? 1
        : 0;

    if (data2.isNotEmpty) {
      var food = 0;
      var milk = 0;
      var bentou = 0;
      for (var i = 0; i < data.length; i++) {
        switch (data[i].item) {
          case '??????':
            food = data[i].sum;
            break;
          case '?????????':
            milk = data[i].sum;
            break;
          case '?????????':
            bentou = data[i].sum;
            break;
        }
      }

      var seiyu = 0;
      for (var i = 0; i < data2.length; i++) {
        final exDate = data2[i].date.toString().split('-');
        if (_ym == '${exDate[0]}-${exDate[1]}') {
          if (RegExp(r'?????????').hasMatch(data2[i].item)) {
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
    } else if (isCreditScreenDisp == 1) {
      return CreditDisplayScreen();
    } else {
      return const BlankScreen();
    }
  }
}
