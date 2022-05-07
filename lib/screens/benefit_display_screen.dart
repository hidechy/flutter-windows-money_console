// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../entity/benefit_entity.dart';

import '../utility/utility.dart';

import '../viewmodels/benefit_view_model.dart';

class BenefitDisplayScreen extends ConsumerWidget {
  BenefitDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  final ScrollController _controller = ScrollController();

  var uuid = const Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final benefitState = ref.watch(benefitProvider);

    return Column(
      children: [
        Expanded(child: dispBenefitList(data: benefitState)),
      ],
    );
  }

  ///
  Widget dispBenefitList({required List<Benefit> data}) {
    ////////////////////////////////////////////////////
    Map<dynamic, dynamic> yearmonth = {};

    var keepY2 = '';
    List<String> _list2 = [];

    for (var i = 0; i < data.length; i++) {
      var exYmd = data[i].date.split('-');

      if (int.parse(exYmd[0]) < 2020) {
        continue;
      }

      if (keepY2 != exYmd[0]) {
        _list2 = [];
      }

      _list2.add(data[i].date);

      yearmonth[exYmd[0]] = _list2;

      keepY2 = exYmd[0];
    }
    ////////////////////////////////////////////////////

    List<Widget> _list = [];

    var keepY = '';
    var yearSum = 0;
    for (var i = 0; i < data.length; i++) {
      var exYmd = data[i].date.split('-');

      if (int.parse(exYmd[0]) < 2020) {
        continue;
      }

      if (keepY != exYmd[0]) {
        _list.add(
          Container(
            decoration: BoxDecoration(
              color: Colors.yellowAccent.withOpacity(0.3),
            ),
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: Text(exYmd[0]),
          ),
        );

        yearSum = 0;
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
              Expanded(child: Text('${exYmd[1]}/${exYmd[2]}')),
              Expanded(child: Text(data[i].company)),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                      _utility.makeCurrencyDisplay(data[i].price.toString())),
                ),
              ),
            ],
          ),
        ),
      );

      yearSum += data[i].price;

      if (data[i].date == yearmonth[exYmd[0]][yearmonth[exYmd[0]].length - 1]) {
        _list.add(
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text(
              _utility.makeCurrencyDisplay(yearSum.toString()),
              style: const TextStyle(color: Colors.yellowAccent),
            ),
          ),
        );
      }

      keepY = exYmd[0];
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
