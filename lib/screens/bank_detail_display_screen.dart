// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_console/state/bank_detail_state.dart';
import 'package:uuid/uuid.dart';

import '../viewmodels/bank_view_model.dart';

import '../utility/utility.dart';

class BankDetailDisplayScreen extends ConsumerWidget {
  BankDetailDisplayScreen({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();

  var uuid = const Uuid();

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankState = ref.watch(bankProvider);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.pinkAccent.withOpacity(0.3),
            ),
            onPressed: () {
              _controller.jumpTo(_controller.position.maxScrollExtent);
            },
            child: const Text('jump'),
          ),
        ),
        Expanded(
          child: dispBankDetailList(data: bankState),
        ),
      ],
    );
  }

  ///
  Widget _getUpDownMark({required int diff}) {
    if (diff > 0) {
      return const Icon(
        Icons.arrow_upward,
        color: Colors.greenAccent,
      );
    } else {
      return const Icon(
        Icons.arrow_downward,
        color: Colors.redAccent,
      );
    }
  }

  ///
  Widget dispBankDetailList({required BankDetailState data}) {
    List<Widget> _list = [];

    var keepYm = '';
    for (var i = 0; i < data.record.length; i++) {
      var exDate = data.record[i].date.toString().split(' ');
      var exYmd = exDate[0].split('-');

      if (keepYm != '${exYmd[0]}-${exYmd[1]}') {
        _list.add(
          Container(
            decoration: BoxDecoration(
              color: Colors.yellowAccent.withOpacity(0.3),
            ),
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: Text('${exYmd[0]}-${exYmd[1]}'),
          ),
        );
      }

      _list.add(
        Container(
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
              Expanded(
                child: Text(exDate[0]),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child:
                      Text(_utility.makeCurrencyDisplay(data.record[i].price)),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(_utility
                      .makeCurrencyDisplay(data.record[i].diff.toString())),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: _getUpDownMark(diff: data.record[i].diff),
                ),
              ),
            ],
          ),
        ),
      );

      keepYm = '${exYmd[0]}-${exYmd[1]}';
    }

    return SingleChildScrollView(
      controller: _controller,
      key: PageStorageKey(uuid.v1()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _list,
      ),
    );
  }
}
