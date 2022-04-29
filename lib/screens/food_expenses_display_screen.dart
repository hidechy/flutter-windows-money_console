import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/food_expenses_item_display_cell.dart';

class FoodExpensesDisplayScreen extends ConsumerWidget {
  const FoodExpensesDisplayScreen({Key? key, required this.foodExpenses})
      : super(key: key);

  final Map<String, dynamic> foodExpenses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                FoodExpensesItemDisplayCell(
                    type: '食費', price: foodExpenses['food']),
                FoodExpensesItemDisplayCell(
                    type: '牛乳代', price: foodExpenses['milk']),
                FoodExpensesItemDisplayCell(
                    type: '弁当代', price: foodExpenses['bentou']),
                FoodExpensesItemDisplayCell(
                    type: '西友', price: foodExpenses['seiyu']),
                const SizedBox(height: 50),
                FoodExpensesItemDisplayCell(
                    type: '合計', price: foodExpenses['sum']),
                FoodExpensesItemDisplayCell(
                    type: '割合（%）', price: foodExpenses['wariai']),
                FoodExpensesItemDisplayCell(
                    type: '平均（${foodExpenses['endDay']}日間）',
                    price: foodExpenses['average']),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
