import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bank_model.dart';

import 'dart:convert';

import 'package:http/http.dart';

import '../models/bank_spend_model.dart';
import '../state/bank_detail_state.dart';

//////////////////////////////////////////////////////////////////////

final bankProvider =
    StateNotifierProvider.autoDispose<BankStateNotifier, BankDetailState>(
        (ref) {
  return BankStateNotifier(
    const BankDetailState(
      bank: '',
      record: AsyncValue<List<BankData>>.loading(),
    ),
  );
});

class BankStateNotifier extends StateNotifier<BankDetailState> {
  BankStateNotifier(BankDetailState state) : super(state);

  ///
  void getBankData({required String bank}) async {
    Map<String, String> _searchBankMap = {
      "bankA": "bank_a",
      "bankB": "bank_b",
      "bankC": "bank_c",
      "bankD": "bank_d",
      "bankE": "bank_e",
      "payA": "pay_a",
      "payB": "pay_b",
      "payC": "pay_c",
      "payD": "pay_d",
      "payE": "pay_e",
    };

    String url = "http://toyohide.work/BrainLog/api/bankSearch";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"bank": _searchBankMap[bank]});

    Response response =
        await post(Uri.parse(url), headers: headers, body: body);

    final bk = bankFromJson(response.body);

    state = state.copyWith(
      bank: bank,
      record: AsyncValue.data([...bk.data]),
    );
  }
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

final bankSpendProvider = StateNotifierProvider.autoDispose
    .family<BankSpendStateNotifier, List<BankSpendData>, String>((ref, bank) {
  return BankSpendStateNotifier([])..getBankSpendData(bank: bank);
});

class BankSpendStateNotifier extends StateNotifier<List<BankSpendData>> {
  BankSpendStateNotifier(List<BankSpendData> state) : super(state);

  ///
  void getBankSpendData({required String bank}) async {
    String url = "http://toyohide.work/BrainLog/api/creditDetail";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"bank": bank});

    Response response =
        await post(Uri.parse(url), headers: headers, body: body);

    final bankSpend = bankSpendFromJson(response.body);

    state = bankSpend.data;
  }
}

//////////////////////////////////////////////////////////////////////
