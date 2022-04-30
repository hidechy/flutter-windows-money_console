import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/credit_model.dart';

import 'dart:convert';

import 'package:http/http.dart';

import '../state/credit_detail_state.dart';

//////////////////////////////////////////////////////////////////////

final creditProvider =
    StateNotifierProvider.autoDispose<CreditStateNotifier, CreditDetailState>(
  (ref) {
    return CreditStateNotifier(
      const CreditDetailState(
        ucCreditData: [],
        rakutenCreditData: [],
        sumitomoCreditData: [],
        amexCreditData: [],
      ),
    );
  },
);

class CreditStateNotifier extends StateNotifier<CreditDetailState> {
  CreditStateNotifier(CreditDetailState state) : super(state);

  ///
  void init() {
    state = const CreditDetailState(
      ucCreditData: [],
      rakutenCreditData: [],
      sumitomoCreditData: [],
      amexCreditData: [],
    );
  }

  ///
  void getCreditData({required String date}) async {
    String url = "http://toyohide.work/BrainLog/api/uccardspend";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"date": date});
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);
    final credit = creditFromJson(response.body);

    final cre = credit.data;

    List<CreditData> ucCreditData = [];
    List<CreditData> rakutenCreditData = [];
    List<CreditData> sumitomoCreditData = [];
    List<CreditData> amexCreditData = [];

    for (var i = 0; i < cre.length; i++) {
      switch (cre[i].kind) {
        case 'uc':
          ucCreditData.add(cre[i]);
          break;
        case 'rakuten':
          rakutenCreditData.add(cre[i]);
          break;
        case 'sumitomo':
          sumitomoCreditData.add(cre[i]);
          break;
        case 'amex':
          amexCreditData.add(cre[i]);
          break;
      }
    }

    state = CreditDetailState(
      ucCreditData: ucCreditData,
      rakutenCreditData: rakutenCreditData,
      sumitomoCreditData: sumitomoCreditData,
      amexCreditData: amexCreditData,
    );
  }

  ///
  void getSelectedCreditData(
      {required String date, required String kind}) async {
    String url = "http://toyohide.work/BrainLog/api/uccardspend";
    Map<String, String> headers = {'content-type': 'application/json'};
    String body = json.encode({"date": date});
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);
    final credit = creditFromJson(response.body);

    final cre = credit.data;

    List<CreditData> ucCreditData = [];
    List<CreditData> rakutenCreditData = [];
    List<CreditData> sumitomoCreditData = [];
    List<CreditData> amexCreditData = [];

    for (var i = 0; i < cre.length; i++) {
      switch (cre[i].kind) {
        case 'uc':
          ucCreditData.add(cre[i]);
          break;
        case 'rakuten':
          rakutenCreditData.add(cre[i]);
          break;
        case 'sumitomo':
          sumitomoCreditData.add(cre[i]);
          break;
        case 'amex':
          amexCreditData.add(cre[i]);
          break;
      }
    }

    var dummyCreditDate = CreditData(
      item: '-',
      price: '',
      date: DateTime.now(),
      kind: kind,
    );

    switch (kind) {
      case 'uc':
        state = state.copyWith(
          ucCreditData:
              (ucCreditData.isNotEmpty) ? ucCreditData : [dummyCreditDate],
          rakutenCreditData: [],
          sumitomoCreditData: [],
          amexCreditData: [],
        );
        break;
      case 'rakuten':
        state = state.copyWith(
          ucCreditData: [],
          rakutenCreditData: (rakutenCreditData.isNotEmpty)
              ? rakutenCreditData
              : [dummyCreditDate],
          sumitomoCreditData: [],
          amexCreditData: [],
        );
        break;
      case 'sumitomo':
        state = state.copyWith(
          ucCreditData: [],
          rakutenCreditData: [],
          sumitomoCreditData: (sumitomoCreditData.isNotEmpty)
              ? sumitomoCreditData
              : [dummyCreditDate],
          amexCreditData: [],
        );
        break;
      case 'amex':
        state = state.copyWith(
          ucCreditData: [],
          rakutenCreditData: [],
          sumitomoCreditData: [],
          amexCreditData:
              (amexCreditData.isNotEmpty) ? amexCreditData : [dummyCreditDate],
        );
        break;
    }
  }
}

//////////////////////////////////////////////////////////////////////
