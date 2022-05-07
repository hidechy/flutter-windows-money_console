import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../state/money_state.dart';

import '../utility/utility.dart';

import '../viewmodels/holiday_view_model.dart';
import '../viewmodels/money_view_model.dart';

class MoneyDisplayScreen extends ConsumerWidget {
  MoneyDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allMoneyState = ref.watch(allMoneyProvider);

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
            makeGraph(data: allMoneyState),
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
                  return dispAllMoneyRecord(
                    money: allMoneyState[position],
                    holiday: holidayState,
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider(color: Colors.white.withOpacity(0.2));
                },
                itemCount: allMoneyState.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget dispAllMoneyRecord(
      {required MoneyState money, required List holiday}) {
    _utility.makeYMDYData(money.date);

    return Container(
      color: _utility.getBgColor(money.date, holiday),
      child: Row(
        children: [
          Expanded(child: Text('${money.date}（${_utility.youbiStr}）')),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(_utility.makeCurrencyDisplay(money.total.toString())),
            ),
          ),
        ],
      ),
    );
  }

  ///
  Widget makeGraph({required List<MoneyState> data}) {
    List<ChartData> _list = [];
    for (var i = 0; i < data.length; i++) {
      final exDate = data[i].date.split('-');

      _list.add(
        ChartData(
          x: DateTime(
            int.parse(exDate[0]),
            int.parse(exDate[1]),
            int.parse(exDate[2]),
          ),
          total: data[i].total,
        ),
      );
    }

    return SfCartesianChart(
      series: <ChartSeries>[
        LineSeries<ChartData, DateTime>(
          color: Colors.yellowAccent,
          dataSource: _list,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.total,
        ),
      ],
      primaryXAxis: DateTimeAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: const MajorGridLines(
          width: 2,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ChartData {
  final DateTime x;
  final num total;

  ChartData({required this.x, required this.total});
}
