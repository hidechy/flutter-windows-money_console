import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_console/models/shintaku.dart';

import '../utility/utility.dart';
import '../viewmodels/holiday_view_model.dart';

class ShintakuDisplayScreen extends ConsumerWidget {
  ShintakuDisplayScreen({Key? key, required this.record}) : super(key: key);

  final ShintakuRecord record;

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exData = record.data.split('/');

    final holidayState = ref.watch(holidayProvider);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      title: const Text('Stock'),
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
              child: Row(
                children: [
                  SizedBox(
                    width: 500,
                    child: Text(record.name),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.topRight,
                    child: Text(record.num.toString()),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.topRight,
                    child: Text(record.shutoku),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.topRight,
                    child: Text(record.cost.toString()),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.topRight,
                    child: Text(record.price),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.topRight,
                    child: Text(record.diff.toString()),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, int position) {
                  return dispShintakuRecord(
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
  Widget dispShintakuRecord({required String record, required List holiday}) {
    final exRecord = record.split('|');

    _utility.makeYMDYData(exRecord[0]);

    return Container(
      color: _utility.getBgColor(exRecord[0], holiday),
      child: Row(
        children: [
          Text('${exRecord[0]}（${_utility.youbiStr}）'),
          const SizedBox(width: 50),
          Container(
            width: 80,
            alignment: Alignment.topRight,
            child: Text(exRecord[1]),
          ),
          Container(
            width: 100,
            alignment: Alignment.topRight,
            child: Text(exRecord[2]),
          ),
          Container(
            width: 100,
            alignment: Alignment.topRight,
            child: Text(exRecord[3]),
          ),
          Container(
            width: 100,
            alignment: Alignment.topRight,
            child: Text(exRecord[4]),
          ),
          Container(
            width: 100,
            alignment: Alignment.topRight,
            child: Text(exRecord[5]),
          ),
        ],
      ),
    );
  }
}
