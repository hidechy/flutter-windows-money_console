// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../viewmodels/benefit_view_model.dart';
import '../viewmodels/calendar_view_model.dart';
import '../viewmodels/money_view_model.dart';

import '../entity/benefit_entity.dart';
import '../entity/score_entity.dart';
import '../state/money_state.dart';

import '../utility/utility.dart';
import 'month_summary_display_screen.dart';

class ScoreDisplayScreen extends ConsumerWidget {
  ScoreDisplayScreen({Key? key}) : super(key: key);

  late WidgetRef _ref;

  String minimumDate = '';

  final Utility _utility = Utility();

  late BuildContext _context;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;
    _context = context;

    List<Score> scoreData = getScoreData();

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
            makeGraph(data: scoreData),
            Expanded(
              child: dispScoreList(data: scoreData),
            ),
          ],
        ),
      ),
    );
  }

  ///
  List<Score> getScoreData() {
    List<Score> _list = [];

    final allMoneyState = _ref.watch(allMoneyProvider);

    Map<String, dynamic> allDayMoneyTotalMap =
        getAllDayMoneyTotalMap(data: allMoneyState);

    if (allDayMoneyTotalMap.isNotEmpty) {
      final exMinimumDate = minimumDate.split('-');

      final beforeAdmtm =
          DateTime(int.parse(exMinimumDate[0]), int.parse(exMinimumDate[1]), 0);

      final exBeforeAdmtm = beforeAdmtm.toString().split(' ');
      final moneyState = _ref.watch(moneyProvider(exBeforeAdmtm[0]));
      allDayMoneyTotalMap[moneyState.date] = moneyState.total;

      List<Map<String, dynamic>> ymMap = getYmMap(data: allMoneyState);

      if (ymMap.isNotEmpty) {
        final benefitState = _ref.watch(benefitProvider);
        final benefitData = getBenefitData(data: benefitState);

        for (var i = 0; i < ymMap.length; i++) {
          final totalLmed =
              (allDayMoneyTotalMap[ymMap[i]['lastMonthEndDate']] != null)
                  ? int.parse(allDayMoneyTotalMap[ymMap[i]['lastMonthEndDate']]
                      .toString())
                  : 0;
          final totalTmed =
              (allDayMoneyTotalMap[ymMap[i]['thisMonthEndDate']] != null)
                  ? allDayMoneyTotalMap[ymMap[i]['thisMonthEndDate']]
                  : 0;

          int _lmed = int.parse(totalLmed.toString());
          int _tmed = int.parse(totalTmed.toString());

          int _benefit = (benefitData[ymMap[i]['ym']] != null)
              ? benefitData[ymMap[i]['ym']]['sum']
              : 0;

          String _company = (benefitData[ymMap[i]['ym']] != null)
              ? benefitData[ymMap[i]['ym']]['company'].substring(
                  0, benefitData[ymMap[i]['ym']]['company'].length - 1)
              : '';

          int _score = ((_lmed - _tmed) * -1);
          int _minus = (_benefit > 0) ? (_benefit - _score) : (_score * -1);

          _list.add(
            Score(
              yearmonth: ymMap[i]['ym'],
              prevTotal: totalLmed,
              thisTotal: totalTmed,
              score: _score,
              benefit: _benefit,
              benefitCompany: _company,
              minus: _minus,
            ),
          );
        }
      }
    }

    return _list;
  }

  ///
  Map<String, dynamic> getAllDayMoneyTotalMap(
      {required List<MoneyState> data}) {
    Map<String, dynamic> moneyMap = {};

    for (var i = 0; i < data.length; i++) {
      if (i == 0) {
        minimumDate = data[i].date;
      }

      moneyMap[data[i].date.toString()] = data[i].total;
    }

    return moneyMap;
  }

  ///
  List<Map<String, dynamic>> getYmMap({required List<MoneyState> data}) {
    List<Map<String, dynamic>> ymMap = [];
    for (var i = 0; i < data.length; i++) {
      final exDate = data[i].date.split('-');
      if (exDate[exDate.length - 1] == '01') {
        final lmed = DateTime(int.parse(exDate[0]), int.parse(exDate[1]), 0);
        final exLmed = lmed.toString().split(' ');
        final lastMonthEndDate = exLmed[0];

        final tmed =
            DateTime(int.parse(exDate[0]), int.parse(exDate[1]) + 1, 0);
        final exTmed = tmed.toString().split(' ');
        final thisMonthEndDate = exTmed[0];

        Map<String, String> _map = {};
        _map['ym'] = '${exDate[0]}-${exDate[1]}';
        _map['lastMonthEndDate'] = lastMonthEndDate;
        _map['thisMonthEndDate'] = thisMonthEndDate;

        ymMap.add(_map);
      }
    }

    return ymMap;
  }

  ///
  Map<String, dynamic> getBenefitData({required List<Benefit> data}) {
    Map<String, dynamic> benefitData = {};

    var yM = '';
    var sum = 0;
    var com = '';
    for (var i = 0; i < data.length; i++) {
      final ym = data[i].yearmonth;

      if (ym != yM) {
        sum = 0;
        com = '';
      }

      sum += data[i].price;
      com += data[i].company + '/';

      Map<String, dynamic> _map = {};
      _map['sum'] = sum;
      _map['company'] = com;
      benefitData[ym] = _map;

      yM = data[i].yearmonth;
    }

    return benefitData;
  }

  ///
  Widget dispScoreList({required List<Score> data}) {
    List<Widget> _list = [];

    for (var i = 0; i < data.length; i++) {
      _list.add(
        Container(
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
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Text(data[i].yearmonth)),
                    Expanded(flex: 2, child: Text(data[i].benefitCompany)),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          _utility.makeCurrencyDisplay(
                              data[i].prevTotal.toString()),
                          style: const TextStyle(color: Colors.yellowAccent),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(_utility
                            .makeCurrencyDisplay(data[i].benefit.toString())),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          _utility.makeCurrencyDisplay(
                              data[i].thisTotal.toString()),
                          style: const TextStyle(color: Colors.yellowAccent),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(_utility
                            .makeCurrencyDisplay(data[i].minus.toString())),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(_utility
                            .makeCurrencyDisplay(data[i].score.toString())),
                      ),
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
                  final calendarSelectDateViewModel =
                      _ref.watch(calendarSelectDateProvider.notifier);
                  calendarSelectDateViewModel.setCalendarSelectDate(
                      date: '${data[i].yearmonth}-01');

                  showDialog(
                    context: _context,
                    builder: (_) {
                      return MonthSummaryDisplayScreen();
                    },
                  );
                },
                child: const Text('Detail'),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: _list,
      ),
    );
  }

  ///
  Widget makeGraph({required List<Score> data}) {
    List<ChartData> _list = [];
    for (var i = 0; i < data.length; i++) {
      _list.add(
        ChartData(
          x: DateTime.parse('${data[i].yearmonth}-01'),
          val: data[i].thisTotal,
        ),
      );
    }

    return SfCartesianChart(
      series: <ChartSeries>[
        LineSeries<ChartData, DateTime>(
          color: Colors.yellowAccent,
          dataSource: _list,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.val,
        ),
      ],
      primaryXAxis: DateTimeAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(
          width: 2,
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}

class ChartData {
  final DateTime x;
  final num val;

  ChartData({required this.x, required this.val});
}
