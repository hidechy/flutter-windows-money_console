import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/stock.dart';

import '../utility/utility.dart';

import '../viewmodels/holiday_view_model.dart';

class StockDisplayScreen extends ConsumerWidget {
  StockDisplayScreen({Key? key, required this.record}) : super(key: key);

  final StockRecord record;

  final Utility _utility = Utility();

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exData = record.data.split('/');

    final holidayState = ref.watch(holidayProvider);

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
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(record.name),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(record.num.toString()),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(record.oneStock),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(record.cost.toString()),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(record.price),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(record.diff.toString()),
                    ),
                  ),
                ],
              ),
            ),
            makeGraph(data: record.data),
            Expanded(
              child: ListView.separated(
                controller: _controller,
                itemBuilder: (context, int position) {
                  return dispStockRecord(
                    record: exData[position],
                    holiday: holidayState,
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider(color: Colors.white.withOpacity(0.3));
                },
                itemCount: exData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget dispStockRecord({required String record, required List holiday}) {
    final exRecord = record.split('|');

    _utility.makeYMDYData(exRecord[0]);

    return Container(
      color: _utility.getBgColor(exRecord[0], holiday),
      child: Row(
        children: [
          Expanded(child: Text('${exRecord[0]}（${_utility.youbiStr}）')),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(exRecord[1]),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(exRecord[2]),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(exRecord[3]),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(exRecord[4]),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(exRecord[5]),
            ),
          ),
        ],
      ),
    );
  }

  ///
  Widget makeGraph({required String data}) {
    List<ChartData> _list = [];

    final exData = (data).split('/');
    for (var i = (exData.length - 30); i < exData.length; i++) {
      final exValue = (exData[i]).split('|');

      if (exValue[5] == "-") {
        continue;
      }

      _utility.makeYMDYData(exValue[0]);

      _list.add(
        ChartData(
          x: DateTime(
            int.parse(_utility.year),
            int.parse(_utility.month),
            int.parse(_utility.day),
          ),
          val: int.parse(exValue[4].replaceAll(',', '')),
          pay: int.parse(exValue[3].replaceAll(',', '')),
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
        LineSeries<ChartData, DateTime>(
          color: Colors.orangeAccent,
          dataSource: _list,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.pay,
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
  final num pay;

  ChartData({required this.x, required this.val, required this.pay});
}
