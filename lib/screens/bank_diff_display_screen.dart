// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:uuid/uuid.dart';

import '../utility/utility.dart';

class BankDiffDisplayScreen extends ConsumerWidget {
  BankDiffDisplayScreen({Key? key, required this.data}) : super(key: key);

  final List<Map<dynamic, dynamic>> data;

  final Utility _utility = Utility();

  final ScrollController _controller = ScrollController();

  var uuid = const Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        Expanded(child: dispBankDiffList()),
      ],
    );
  }

  ///
  Widget dispBankDiffList() {
    List<Widget> _list = [];

    var keepYm = '';
    for (var i = 0; i < data.length; i++) {
      var exYmd = data[i]['date'].split('-');

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(exYmd[exYmd.length - 1]),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(_utility
                      .makeCurrencyDisplay(data[i]['price'].toString())),
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
