import 'package:flutter/material.dart';

import '../../utility/utility.dart';

class FoodExpensesItemDisplayCell extends StatelessWidget {
  FoodExpensesItemDisplayCell(
      {Key? key, required this.type, required this.price})
      : super(key: key);

  final String type;
  final int price;

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(child: Text(type)),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(_utility.makeCurrencyDisplay(price.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
