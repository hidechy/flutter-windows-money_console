import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_console/state/money_state.dart';

import '../viewmodels/calendar_view_model.dart';
import '../viewmodels/holiday_view_model.dart';
import '../viewmodels/money_view_model.dart';

import '../utility/utility.dart';

class MonthListDisplayScreen extends ConsumerWidget {
  MonthListDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              decoration: BoxDecoration(
                color: Colors.yellowAccent.withOpacity(0.3),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              child: Text(ym),
            ),

            // makeGraph(data: allMoneyState),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, int position) {
                  return dispMonthMoneyRecord(
                    money: monthMoney[position],
                    holiday: holidayState,
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider(color: Colors.white.withOpacity(0.3));
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
  getMonthMoney({required String ym, required List<MoneyState> data}) {
    List<MoneyState> _list = [];

    for (var i = 0; i < data.length; i++) {
      var exDate = data[i].date.split('-');
      if (ym == '${exDate[0]}-${exDate[1]}') {
        _list.add(data[i]);
      }
    }

    return _list;
  }

  ///
  Widget dispMonthMoneyRecord(
      {required MoneyState money, required List holiday}) {
    return Container(
      width: double.infinity,
      color: _utility.getBgColor(money.date, holiday),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${money.date}（${_utility.youbiStr}）'),
              Text(_utility.makeCurrencyDisplay(money.total.toString())),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                flex: 1,
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
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.bankA.toString())),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.bankB.toString())),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.bankC.toString())),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.bankD.toString())),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.bankE.toString())),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.peyA.toString())),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.peyB.toString())),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.peyC.toString())),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.peyD.toString())),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(_utility
                                .makeCurrencyDisplay(money.peyE.toString())),
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
    );
  }
}
