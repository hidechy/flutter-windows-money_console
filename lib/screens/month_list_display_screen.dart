// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/calendar_view_model.dart';
import '../viewmodels/holiday_view_model.dart';
import '../viewmodels/money_view_model.dart';

import '../utility/utility.dart';

import 'day_spend_display_screen.dart';

import '../state/money_state.dart';

class MonthListDisplayScreen extends ConsumerWidget {
  MonthListDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  late BuildContext _context;

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;

    final allMoneyState = ref.watch(allMoneyProvider);

    final holidayState = ref.watch(holidayProvider);

    //-------------------
    var calendarSelectDateState = ref.watch(calendarSelectDateProvider);
    if (calendarSelectDateState == "") {
      calendarSelectDateState = DateTime.now().toString();
    }
    _utility.makeYMDYData(calendarSelectDateState);
    final ym = '${_utility.year}-${_utility.month}';
    //-------------------

    var monthMoney = <MoneyState>[];
    if (allMoneyState.isNotEmpty) {
      monthMoney = getMonthMoney(ym: ym, data: allMoneyState);
    }

    final lastMonthEnd =
        DateTime(int.parse(_utility.year), int.parse(_utility.month), 0);
    final exLastMonthEnd = lastMonthEnd.toString().split(' ');

    final mo = ref.watch(moneyProvider(exLastMonthEnd[0]));
    final kurikoshi = mo.total;

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
              decoration: BoxDecoration(
                color: Colors.yellowAccent.withOpacity(0.3),
              ),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Text(ym),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent.withOpacity(0.3),
                ),
                onPressed: () {
                  _controller.jumpTo(_controller.position.maxScrollExtent);
                },
                child: const Text('jump'),
              ),
            ),
            Expanded(
              child: ListView.separated(
                controller: _controller,
                itemBuilder: (context, int position) {
                  int spend = 0;
                  if (position == 0) {
                    spend = kurikoshi - monthMoney[position].total;
                  } else {
                    spend = monthMoney[position - 1].total -
                        monthMoney[position].total;
                  }

                  return dispMonthMoneyRecord(
                    money: monthMoney[position],
                    holiday: holidayState,
                    spend: spend,
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider(color: Colors.white.withOpacity(0.2));
                },
                itemCount: monthMoney.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  List<MoneyState> getMonthMoney(
      {required String ym, required List<MoneyState> data}) {
    List<MoneyState> _list = [];

    for (var i = 0; i < data.length; i++) {
      final exDate = data[i].date.split('-');
      if (ym == '${exDate[0]}-${exDate[1]}') {
        _list.add(data[i]);
      }
    }

    return _list;
  }

  ///
  Widget dispMonthMoneyRecord(
      {required MoneyState money, required List holiday, required int spend}) {
    return Container(
      width: double.infinity,
      color: _utility.getBgColor(money.date, holiday),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${money.date}（${_utility.youbiStr}）'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _utility.makeCurrencyDisplay(money.total.toString()),
                        ),
                        Text(
                          _utility.makeCurrencyDisplay(spend.toString()),
                          style: const TextStyle(color: Colors.yellowAccent),
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_10000.toString()),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_5000.toString()),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_2000.toString()),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_1000.toString()),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_500.toString()),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_100.toString()),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_50.toString()),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_10.toString()),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_5.toString()),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(money.yen_1.toString()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.bankA.toString())),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.bankB.toString())),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.bankC.toString())),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.bankD.toString())),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.bankE.toString())),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.peyA.toString())),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.peyB.toString())),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.peyC.toString())),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.peyD.toString())),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(_utility.makeCurrencyDisplay(
                                      money.peyE.toString())),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.pinkAccent.withOpacity(0.3),
            ),
            onPressed: () {
              showDialog(
                context: _context,
                builder: (_) {
                  return DaySpendDisplayScreen(
                    date: money.date,
                    spend: spend,
                  );
                },
              );
            },
            child: const Text('Detail'),
          ),
        ],
      ),
    );
  }
}
