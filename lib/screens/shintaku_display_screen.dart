import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/shintaku_model.dart';

import '../utility/utility.dart';

import '../viewmodels/holiday_view_model.dart';

import 'fund_display_screen.dart';

class ShintakuDisplayScreen extends ConsumerWidget {
  ShintakuDisplayScreen({Key? key, required this.record, required this.name})
      : super(key: key);

  final ShintakuRecord record;
  final String name;

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
                      child: Text(record.shutoku),
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
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent.withOpacity(0.3),
                      ),
                      onPressed: () {
                        _controller
                            .jumpTo(_controller.position.maxScrollExtent);
                      },
                      child: const Text('jump'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.3),
                    ),
                    alignment: Alignment.center,
                    child: const Text('num'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.3),
                    ),
                    alignment: Alignment.center,
                    child: const Text('shutoku'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.3),
                    ),
                    alignment: Alignment.center,
                    child: const Text('cost'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.3),
                    ),
                    alignment: Alignment.center,
                    child: const Text('price'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.3),
                    ),
                    alignment: Alignment.center,
                    child: const Text('diff'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.3),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(width: 40),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('kijun'),
                          ),
                        ),
                        Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return FundDisplayScreen(data: exData);
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.call_made,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                controller: _controller,
                itemBuilder: (context, int position) {
                  return dispShintakuRecord(
                    record: exData[position],
                    holiday: holidayState,
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider(color: Colors.white.withOpacity(0.2));
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
  Widget dispShintakuRecord({required String record, required List holiday}) {
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
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(exRecord[6]),
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
    for (var i = 0; i < exData.length; i++) {
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
          color: Colors.white.withOpacity(0.2),
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
