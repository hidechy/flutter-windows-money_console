// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/bank_spend_model.dart';

import '../utility/utility.dart';

import '../viewmodels/bank_view_model.dart';

class BankSpendDisplayScreen extends ConsumerWidget {
  BankSpendDisplayScreen(
      {Key? key, required this.diffData, required this.height})
      : super(key: key);

  final List<Map> diffData;
  final double height;

  final Utility _utility = Utility();

  final ScrollController _controller = ScrollController();
  var uuid = const Uuid();

  final ScrollController _controller2 = ScrollController();
  var uuid2 = const Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankState = ref.watch(bankProvider);

    final bankSpendState = ref.watch(bankSpendProvider(bankState.bank));

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
          child: dispBankSpendList(data: bankSpendState),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 3,
              ),
            ),
          ),
          height: (height * 0.4),
          child: dispBankDiffList(),
        ),
      ],
    );
  }

  ///
  Widget dispBankSpendList({required List<BankSpendData> data}) {
    List<Widget> _list = [];

    var keepYm = '';
    for (var i = 0; i < data.length; i++) {
      var exDate = data[i].date.toString().split(' ');
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
                child: Text(exYmd[exYmd.length - 1]),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(data[i].item),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(_utility.makeCurrencyDisplay(data[i].price)),
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

  ///
  Widget dispBankDiffList() {
    List<Widget> _list = [];

    var keepYm = '';
    for (var i = 0; i < diffData.length; i++) {
      var exYmd = diffData[i]['date'].split('-');

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
                child: Text(exYmd[exYmd.length - 1]),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(diffData[i]['price'].toString()),
                ),
              ),
            ],
          ),
        ),
      );

      keepYm = '${exYmd[0]}-${exYmd[1]}';
    }

    if (_list.isEmpty) {
      _list.add(
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 30),
              Text(
                'No Diff Data',
                style: TextStyle(color: Colors.yellowAccent),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      controller: _controller2,
      key: PageStorageKey(uuid2.v1()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _list,
      ),
    );
  }
}
