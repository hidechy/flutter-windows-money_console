// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/calendar_view_model.dart';
import '../viewmodels/year_month_summary_view_model.dart';

import '../state/year_month_summary_state.dart';

import '../utility/utility.dart';

import 'package:uuid/uuid.dart';

class YearMonthSummaryDisplayScreen extends ConsumerWidget {
  YearMonthSummaryDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  final ScrollController _controller = ScrollController();

  var uuid = const Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var calendarSelectDateState = ref.watch(calendarSelectDateProvider);
    if (calendarSelectDateState == "") {
      calendarSelectDateState = DateTime.now().toString();
    }

    final exDate = calendarSelectDateState.split(' ');
    final exYmd = exDate[0].split('-');

    final yearMonthSummaryState =
        ref.watch(yearMonthSummaryProvider(int.parse(exYmd[0])));

    final calendarViewModel = ref.watch(calendarSelectDateProvider.notifier);

    final prevYear = '${int.parse(exYmd[0]) - 1}-01-01';
    final nextYear = '${int.parse(exYmd[0]) + 1}-01-01';

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
                  Text('月別項目別使用履歴 : ${exYmd[0]}'),
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            if (exYmd[0] == '2020') {
                            } else {
                              calendarViewModel.setCalendarSelectDate(
                                  date: prevYear);
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
                                date: nextYear);
                          },
                          child: const Icon(Icons.skip_next),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 110,
                  child: Container(),
                ),
                for (var i = 1; i <= 12; i++)
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.withOpacity(0.3),
                      ),
                      alignment: Alignment.center,
                      child: Text(i.toString()),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: dispYearMonthSummaryList(data: yearMonthSummaryState),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget dispYearMonthSummaryList({required YearMonthSummaryState data}) {
    List<Widget> _list = [];

    for (var i = 0; i < data.yearMonthSummaryData.length; i++) {
      var ymsData = data.yearMonthSummaryData[i];

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
              SizedBox(
                width: 110,
                child: Text('${ymsData['midashi']}'),
              ),
              Expanded(
                child: dispKoumokuData(data: ymsData['list']),
              ),
            ],
          ),
        ),
      );
    }

    _list.add(const SizedBox(height: 500));

    return SingleChildScrollView(
      controller: _controller,
      key: PageStorageKey(uuid.v1()),
      child: Column(
        children: _list,
      ),
    );
  }

  ///
  Widget dispKoumokuData({required data}) {
    List<Widget> _list = [];

    if (data != null) {
      for (var i = 0; i < data.length; i++) {
        _list.add(
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                _utility.makeCurrencyDisplay(data[i].toString()),
              ),
            ),
          ),
        );
      }
    }

    return Row(
      children: _list,
    );
  }
}
