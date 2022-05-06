// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_console/models/bank_spend_model.dart';
import 'package:money_console/screens/bank_spend_display_screen.dart';
import 'package:uuid/uuid.dart';

import 'components/blank_screen.dart';

import '../utility/utility.dart';

import '../viewmodels/bank_view_model.dart';

import 'bank_detail_display_screen.dart';
import '../state/bank_detail_state.dart';

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

  final ScrollController _controller = ScrollController();

  var uuid = const Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    final bankState = ref.watch(bankProvider);

    final bankSpendState = ref.watch(bankSpendProvider(bankState.bank));

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
              margin: const EdgeInsets.only(top: 2, bottom: 30),
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
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 220,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: dispBankList(data: bankList),
                  ),
                ),
                Expanded(
                  flex: 3,
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
                    child: screenSelector(data: bankState),
                  ),
                ),
                Expanded(
                  flex: 3,
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
  Widget dispBankList({required List<String> data}) {
    _utility.getBankName();
    final bankNames = _utility.bankNames;

    final bankState = _ref.watch(bankProvider);

    return ListView.separated(
      controller: _controller,
      key: PageStorageKey(uuid.v1()),
      itemBuilder: (context, position) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  _ref
                      .watch(bankProvider.notifier)
                      .getBankData(bank: bankList[position]);
                },
                child: Container(
                  width: double.infinity,
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
                  child: Text(
                    bankNames[bankList[position]]!,
                    style: TextStyle(
                      color: (bankList[position] == bankState.bank)
                          ? Colors.yellowAccent
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            if (bankList[position] == 'bankE') const SizedBox(height: 50),
          ],
        );
      },
      separatorBuilder: (context, position) => Container(),
      itemCount: bankList.length,
    );
  }

  ///
  Widget screenSelector({required BankDetailState data}) {
    return data.record.when(
      data: (_) => BankDetailDisplayScreen(),
      error: (_, __) => BlankScreen(),
      loading: () => BlankScreen(),
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
}
