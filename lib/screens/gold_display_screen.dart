import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/gold.dart';

import '../viewmodels/gold_view_model.dart';

class GoldDisplayScreen extends ConsumerWidget {
  const GoldDisplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goldState = ref.watch(goldProvider);

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
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, int position) {
                  return dispGoldRecord(gold: goldState[position]);
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
  Widget dispGoldRecord({required GoldData gold}) {
    return Row(
      children: [
        Text('${gold.year}-${gold.month}-${gold.day}'),
        const SizedBox(width: 50),
        Container(
          width: 80,
          alignment: Alignment.topRight,
          child: Text(gold.payPrice.toString()),
        ),
        Container(
          width: 80,
          alignment: Alignment.topRight,
          child: Text(gold.goldValue.toString()),
        ),
        Container(
          width: 80,
          alignment: Alignment.topRight,
          child: Text((gold.goldValue == '-')
              ? '-'
              : (gold.goldValue - gold.payPrice).toString()),
        ),
        Container(
          width: 80,
          alignment: Alignment.topRight,
          child: Text(gold.goldTanka.toString()),
        ),
        Container(
          width: 80,
          alignment: Alignment.topRight,
          child: Text(gold.diff.toString()),
        ),
        Container(
          width: 80,
          alignment: Alignment.topRight,
          child: Text(gold.upDown.toString()),
        ),
        Container(
          width: 80,
          alignment: Alignment.topRight,
          child: Text(gold.goldPrice.toString()),
        ),
        Container(
          width: 120,
          alignment: Alignment.topRight,
          child: Text(gold.gramNum.toString()),
        ),
        Container(
          width: 120,
          alignment: Alignment.topRight,
          child: Text(gold.totalGram.toString()),
        ),
      ],
    );
  }
}
