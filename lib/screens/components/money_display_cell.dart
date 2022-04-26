// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utility/utility.dart';

class MoneyDisplayCell extends StatelessWidget {
  MoneyDisplayCell(
      {Key? key,
      required this.type,
      required this.price,
      required this.colorFlag,
      required this.flex})
      : super(key: key);

  final String type;
  final String price;
  final int colorFlag;
  final int flex;

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context) {
    _utility.getBankName();
    final bankNames = _utility.bankNames;
    final dispName = (bankNames[type] != null) ? bankNames[type] : type;

    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: (colorFlag == 1)
                    ? Colors.greenAccent.withOpacity(0.3)
                    : Colors.yellowAccent.withOpacity(0.3),
              ),
              child: Text(dispName!),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.topRight,
              child: Text(price),
            ),
          ],
        ),
      ),
    );
  }
}
