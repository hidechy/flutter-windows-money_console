// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'components/blank_screen.dart';

import '../utility/utility.dart';

import '../viewmodels/bank_view_model.dart';

import 'bank_detail_display_screen.dart';
import '../state/bank_detail_state.dart';

import '../models/bank_spend_model.dart';
import 'bank_spend_display_screen.dart';

import 'bank_diff_display_screen.dart';

class BankDisplayScreen extends ConsumerWidget {
  BankDisplayScreen({Key? key}) : super(key: key);

  final bankList = [
    'bankA',
    'bankB',
    'bankC',
    'bankD',
    'bankE',
    'payA',
    'payB',
    'payC',
    'payD',
    'payE',
  ];

  final Utility _utility = Utility();

  late WidgetRef _ref;

  var uuid = const Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    final bankState = ref.watch(bankProvider);

    final bankSpendState = ref.watch(bankSpendProvider(bankState.bank));

    List<Map<dynamic, dynamic>> diffData = [];
    if (bankState.bank != '') {
      diffData = getBankDiffData(data: bankState, data2: bankSpendState);
    }

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
              margin: const EdgeInsets.only(top: 2),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.2),
                    width: 3,
                  ),
                ),
                color: Colors.yellowAccent.withOpacity(0.3),
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Bank Record'),
                ],
              ),
            ),
            Container(
              child: makeBankList(data: bankList),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 220,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: screenSelector(data: bankState),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 220,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                          width: 3,
                        ),
                      ),
                    ),
                    child: screenSelector3(data: diffData),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 220,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                          width: 3,
                        ),
                      ),
                    ),
                    child: screenSelector2(data: bankSpendState),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget makeBankList({required List<String> data}) {
    _utility.getBankName();
    final bankNames = _utility.bankNames;

    List<Widget> _list = [];
    List<Widget> _list2 = [];

    final bankState = _ref.watch(bankProvider);

    for (var i = 0; i < data.length; i++) {
      if (RegExp(r'bank').hasMatch(data[i])) {
        _list.add(
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  _ref
                      .watch(bankProvider.notifier)
                      .getBankData(bank: bankList[i]);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    bankNames[data[i]]!,
                    style: TextStyle(
                      color: (bankList[i] == bankState.bank)
                          ? Colors.yellowAccent
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    for (var i = 0; i < data.length; i++) {
      if (RegExp(r'pay').hasMatch(data[i])) {
        _list2.add(
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  _ref
                      .watch(bankProvider.notifier)
                      .getBankData(bank: bankList[i]);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    bankNames[data[i]]!,
                    style: TextStyle(
                      color: (bankList[i] == bankState.bank)
                          ? Colors.yellowAccent
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return Column(
      children: [
        Row(
          children: _list,
        ),
        Row(
          children: _list2,
        ),
      ],
    );
  }

  ///
  Widget screenSelector({required BankDetailState data}) {
    return data.record.when(
      data: (_) => BankDetailDisplayScreen(),
      error: (_, __) => const BlankScreen(),
      loading: () => const BlankScreen(),
    );
  }

  ///
  Widget screenSelector2({required List<BankSpendData> data}) {
    final bankState = _ref.watch(bankProvider);

    if (RegExp(r'pay').hasMatch(bankState.bank)) {
      return const BlankScreen();
    } else if (data.isNotEmpty) {
      return BankSpendDisplayScreen();
    } else {
      return const BlankScreen();
    }
  }

  ///
  List<Map<dynamic, dynamic>> getBankDiffData(
      {required BankDetailState data, required List<BankSpendData> data2}) {
    List<Map<dynamic, dynamic>> _list = [];

    //----------------------------------------------//
    List<Map<dynamic, dynamic>> _l1 = [];

    List<int> _l2 = [];

    Map<String, String> _m2 = {};

    var keepDate = '';

    bool tesuuryou = false;

    for (var i = 0; i < data2.length; i++) {
      var exDate = data2[i].date.toString().split(' ');

      if (keepDate != exDate[0]) {
        _l2 = [];

        tesuuryou = false;
      }

      _l2.add(int.parse(data2[i].price));

      tesuuryou = (data2[i].item == "手数料") ? true : false;

      if (keepDate != exDate[0]) {
        Map _m1 = {};
        _m1['date'] = exDate[0];
        _m1['tesuuryou'] = tesuuryou;
        _m1['list'] = _l2;

        _l1.add(_m1);
      }

      _m2[exDate[0]] = '';

      keepDate = exDate[0];
    }
    //----------------------------------------------//

    //----------------------------------------------//
    Map<String, int> _m6 = {};

    for (var i = 0; i < _l1.length; i++) {
      var sum = 0;
      for (var j = 0; j < _l1[i]['list'].length; j++) {
        sum += int.parse(_l1[i]['list'][j].toString());
      }

      _m6[_l1[i]['date']] = sum;
    }
    //----------------------------------------------//

    for (var i = 0; i < data.record.value!.length; i++) {
      var exDate = data.record.value![i].date.toString().split(' ');
      var price = data.record.value![i].diff;

      if (_m6[exDate[0]] != null) {
        var sum = (price + int.parse(_m6[exDate[0]].toString()));
        if (sum != 0) {
          Map<dynamic, dynamic> _m3 = {};
          _m3['date'] = exDate[0];
          _m3['price'] = price;
          _list.add(_m3);
        }
      } else {
        Map<dynamic, dynamic> _m3 = {};
        _m3['date'] = exDate[0];
        _m3['price'] = price;
        _list.add(_m3);
      }
    }

    return _list;
  }

  ///
  Widget screenSelector3({required List<Map> data}) {
    final bankState = _ref.watch(bankProvider);

    if (RegExp(r'pay').hasMatch(bankState.bank)) {
      return const BlankScreen();
    } else if (data != null) {
      return BankDiffDisplayScreen(data: data);
    } else {
      return const BlankScreen();
    }
  }
}
