// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utility/utility.dart';
import '../seiyu_purchase_display_screen.dart';

class FoodExpensesItemDisplayCell extends StatelessWidget {
  FoodExpensesItemDisplayCell(
      {Key? key, required this.type, required this.price})
      : super(key: key);

  final String type;
  final int price;

  final Utility _utility = Utility();

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Container(
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
          Expanded(child: Text(type)),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Text(_utility.makeCurrencyDisplay(price.toString())),
            ),
          ),
          const SizedBox(width: 20),
          getItemIcon(item: type),
        ],
      ),
    );
  }

  ///
  Widget getItemIcon({required String item}) {
    switch (item) {
      case '西友':
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: _context,
                builder: (_) {
                  return SeiyuPurchaseDisplayScreen();
                },
              );
            },
            child: const Icon(
              Icons.call_made,
              color: Colors.greenAccent,
            ),
          ),
        );
      default:
        return const Icon(Icons.check_box_outline_blank,
            color: Color(0xFF2e2e2e));
    }
  }
}
