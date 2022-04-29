//
// I can not use this.
//
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:money_console/models/month_summary.dart';
// import 'package:money_console/models/seiyu_purchase.dart';
// import 'package:money_console/viewmodels/seiyu_purchase_view_model.dart';
//
// import '../request/date_request.dart';
// import '../state/food_expenses_state.dart';
//
// import 'dart:convert';
//
// import 'package:http/http.dart';
//
// import 'month_summary_view_model.dart';
//
// //////////////////////////////////////////////////////////////////////
//
// final foodExpensesProvider = StateNotifierProvider.autoDispose<
//     FoodExpensesStateNotifier, FoodExpensesState>((ref) {
//   return FoodExpensesStateNotifier(
//     FoodExpensesState(
//       monthSummaryDataList: [
//         MonthSummaryData(
//           item: '',
//           sum: 0,
//           percent: 0,
//         )
//       ],
//       seiyuPurchaseDataList: [
//         SeiyuPurchaseData(
//           date: DateTime.now(),
//           pos: 0,
//           item: '',
//           tanka: '',
//           kosuu: '',
//           price: '',
//         )
//       ],
//     ),
//   );
// });
//
// class FoodExpensesStateNotifier extends StateNotifier<FoodExpensesState> {
//   FoodExpensesStateNotifier(FoodExpensesState state)
//       : super(
//           FoodExpensesState(
//             monthSummaryDataList: [
//               MonthSummaryData(
//                 item: '',
//                 sum: 0,
//                 percent: 0,
//               )
//             ],
//             seiyuPurchaseDataList: [
//               SeiyuPurchaseData(
//                 date: DateTime.now(),
//                 pos: 0,
//                 item: '',
//                 tanka: '',
//                 kosuu: '',
//                 price: '',
//               )
//             ],
//           ),
//         );
//
//   ///
//   void getFoodExpensesData({required DateRequest dateRequest}) async {
//     // final monthSummaryState =
//     //     await dateRequest.ref.watch(monthSummaryProvider(dateRequest.date));
//     //
//     // final seiyuPurchaseState =
//     //     await dateRequest.ref.watch(seiyuPurchaseProvider(dateRequest.date));
//     //
//     // print(dateRequest.date);
//     // print(monthSummaryState);
//     // print(seiyuPurchaseState);
//   }
// }
//
// //////////////////////////////////////////////////////////////////////
