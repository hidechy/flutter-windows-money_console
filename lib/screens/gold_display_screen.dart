import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/gold.dart';

import '../viewmodels/gold_view_model.dart';
import '../viewmodels/holiday_view_model.dart';

import '../utility/utility.dart';

class GoldDisplayScreen extends ConsumerWidget {
  GoldDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goldState = ref.watch(goldProvider);

    final holidayState = ref.watch(holidayProvider);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      title: const Text('Gold'),
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
            makeGraph(data: goldState),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, int position) {
                  return dispGoldRecord(
                    gold: goldState[position],
                    holiday: holidayState,
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider(color: Colors.white.withOpacity(0.3));
                },
                itemCount: goldState.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget dispGoldRecord({required GoldData gold, required List holiday}) {
    final date = '${gold.year}-${gold.month}-${gold.day}';

    _utility.makeYMDYData(date);

    return Container(
      color: _utility.getBgColor(date, holiday),
      child: Row(
        children: [
          Expanded(child: Text('$date（${_utility.youbiStr}）')),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(gold.payPrice.toString()),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(gold.goldValue.toString()),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text((gold.goldValue == '-')
                  ? '-'
                  : (gold.goldValue - gold.payPrice).toString()),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(gold.goldTanka.toString()),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(gold.diff.toString()),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(gold.upDown.toString()),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(gold.goldPrice.toString()),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(gold.gramNum.toString()),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(gold.totalGram.toString()),
            ),
          ),
        ],
      ),
    );
  }

  ///
  makeGraph({required List<GoldData> data}) {
    List<ChartData> _list = [];
    for (var i = 0; i < data.length; i++) {
      if (data[i].goldValue == "-") {
        continue;
      }

      _list.add(
        ChartData(
          x: DateTime(
            int.parse(data[i].year),
            int.parse(data[i].month),
            int.parse(data[i].day),
          ),
          goldValue: data[i].goldValue,
          payPrice: data[i].payPrice,
        ),
      );
    }

    return SfCartesianChart(
      series: <ChartSeries>[
        LineSeries<ChartData, DateTime>(
          color: Colors.yellowAccent,
          dataSource: _list,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.goldValue,
        ),
        LineSeries<ChartData, DateTime>(
          color: Colors.orangeAccent,
          dataSource: _list,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.payPrice,
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
  final num goldValue;
  final num payPrice;

  ChartData({required this.x, required this.goldValue, required this.payPrice});
}
