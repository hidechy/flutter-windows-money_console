// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/credit_model.dart';
import '../viewmodels/calendar_view_model.dart';
import '../viewmodels/credit_view_model.dart';

import '../utility/utility.dart';

import '../state/credit_detail_state.dart';

class CreditDisplayScreen extends ConsumerWidget {
  CreditDisplayScreen({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();

  final Utility _utility = Utility();

  int _total = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var calendarSelectDateState = ref.watch(calendarSelectDateProvider);
    if (calendarSelectDateState == "") {
      calendarSelectDateState = DateTime.now().toString();
    }

    final exDate = calendarSelectDateState.split(' ');

    final creditState = ref.watch(creditProvider);
    final creditData = getCreditData(data: creditState);

    final creditViewModel = ref.watch(creditProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent.withOpacity(0.3),
                  ),
                  onPressed: () {
                    creditViewModel.getSelectedCreditData(
                        date: exDate[0], kind: 'uc');
                  },
                  child: const Text('UC'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent.withOpacity(0.3),
                  ),
                  onPressed: () {
                    creditViewModel.getSelectedCreditData(
                        date: exDate[0], kind: 'rakuten');
                  },
                  child: const Text('Rakuten'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent.withOpacity(0.3),
                  ),
                  onPressed: () {
                    creditViewModel.getSelectedCreditData(
                        date: exDate[0], kind: 'sumitomo');
                  },
                  child: const Text('Sumitomo'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent.withOpacity(0.3),
                  ),
                  onPressed: () {
                    creditViewModel.getSelectedCreditData(
                        date: exDate[0], kind: 'amex');
                  },
                  child: const Text('Amex'),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(_utility.makeCurrencyDisplay(_total.toString())),
          ),
          Expanded(
            child: dispCreditList(data: creditData),
          ),
        ],
      ),
    );
  }

  ///
  ListView dispCreditList({required List<CreditData> data}) {
    return ListView.separated(
      controller: _controller,
      itemBuilder: (context, position) {
        final exDate = data[position].date.toString().split(' ');
        return (data[position].item == '-')
            ? const Text('No Data.')
            : Container(
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
                    Expanded(child: Text(exDate[0])),
                    Expanded(
                      flex: 3,
                      child: Text(data[position].item),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                            _utility.makeCurrencyDisplay(data[position].price)),
                      ),
                    ),
                  ],
                ),
              );
      },
      separatorBuilder: (context, position) => const Divider(),
      itemCount: data.length,
    );
  }

  ///
  List<CreditData> getCreditData({required CreditDetailState data}) {
    List<CreditData> _list = [];

    if (data.ucCreditData.isNotEmpty) {
      _list = data.ucCreditData;
    } else if (data.rakutenCreditData.isNotEmpty) {
      _list = data.rakutenCreditData;
    } else if (data.sumitomoCreditData.isNotEmpty) {
      _list = data.sumitomoCreditData;
    } else {
      _list = data.amexCreditData;
    }

    for (var i = 0; i < _list.length; i++) {
      if (_list[i].item != '-') {
        _total += int.parse(_list[i].price);
      }
    }

    return _list;
  }
}
