// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../utility/utility.dart';
import '../viewmodels/fund_view_model.dart';

import '../state/fund_state.dart';

class FundDisplayScreen extends ConsumerWidget {
  FundDisplayScreen({Key? key, required this.data}) : super(key: key);

  final List<String> data;

  final ScrollController _controller = ScrollController();

  var uuid = const Uuid();

  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> dataMakeMap = getDataMakeMap(data: data);

    final fundState = ref.watch(fundProvider);
    FundState thisState = getThisState(data: fundState, data2: dataMakeMap);

    Map<String, dynamic> mixedFundData =
        getMixedFundData(data: thisState, data2: dataMakeMap);

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
              child: Text(mixedFundData['fundName']),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
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
              child: dispFundList(data: mixedFundData),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Map<String, dynamic> getDataMakeMap({required List<String> data}) {
    Map<String, dynamic> _map = {};
    for (var i = 0; i < data.length; i++) {
      Map<String, String> _map2 = {};
      var exData = data[i].split('|');
      _map2['date'] = exData[0];
      _map2['num'] = exData[1];
      _map2['shutoku'] = exData[2];
      _map2['cost'] = exData[3];
      _map2['price'] = exData[4];
      _map2['diff'] = exData[5];
      _map2['basePrice'] = exData[6];

      final DateTime _date = DateTime.parse(exData[0]);
      final DateTime _zenjitsu = _date.add(const Duration(hours: 24) * -1);
      final exZenjitsu = _zenjitsu.toString().split(' ');

      _map[exZenjitsu[0]] = _map2;
    }
    return _map;
  }

  ///
  FundState getThisState(
      {required List<FundState> data, required Map<String, dynamic> data2}) {
    FundState fundState = const FundState(fundName: '');
    for (var i = 0; i < data.length; i++) {
      for (var j = 0; j < data[i].list.length; j++) {
        if (data2[data[i].list[j].date] != null) {
          if (data[i].list[j].basePrice ==
              data2[data[i].list[j].date]['basePrice']) {
            fundState = data[i];
            break;
          }
        }
      }
    }
    return fundState;
  }

  ///
  Map<String, dynamic> getMixedFundData(
      {required FundState data, required Map<String, dynamic> data2}) {
    Map<String, dynamic> mixedMap = {};

    mixedMap['fundName'] = data.fundName;

    List<Map<String, dynamic>> _list = [];
    for (var i = 0; i < data.list.length; i++) {
      Map<String, String> _map = {};
      _map['date'] = data.list[i].date;
      _map['basePrice'] = data.list[i].basePrice;
      _map['compareFront'] = data.list[i].compareFront;
      _map['yearlyReturn'] = data.list[i].yearlyReturn;
      _map['upDown'] = data.list[i].upDown;

      _map['num'] = '-';
      _map['shutoku'] = '-';
      _map['cost'] = '-';
      _map['price'] = '-';
      _map['diff'] = '-';

      if (data2[data.list[i].date] != null) {
        if (data.list[i].basePrice == data2[data.list[i].date]['basePrice']) {
          _map['num'] = data2[data.list[i].date]['num'];
          _map['shutoku'] = data2[data.list[i].date]['shutoku'];
          _map['cost'] = data2[data.list[i].date]['cost'];
          _map['price'] = data2[data.list[i].date]['price'];
          _map['diff'] = data2[data.list[i].date]['diff'];
        }
      }

      _list.add(_map);
    }

    mixedMap['list'] = _list;

    return mixedMap;
  }

  ///
  Widget dispFundList({required Map<String, dynamic> data}) {
    List<Widget> _list = [];

    var keepCost = '';
    for (var i = 0; i < data['list'].length; i++) {
      _utility.makeYMDYData(data['list'][i]['date']);

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
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          '${data['list'][i]['date']}（${_utility.youbiStr}）'),
                    ),
                    SizedBox(
                      width: 60,
                      child: (data['list'][i]['upDown'] == '-')
                          ? Container()
                          : _getUpDownMark(
                              updown: data['list'][i]['upDown'],
                            ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    data['list'][i]['cost'],
                    style: (data['list'][i]['cost'] != '-' &&
                            data['list'][i]['cost'] != keepCost)
                        ? const TextStyle(color: Colors.yellowAccent)
                        : null,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(data['list'][i]['price']),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(data['list'][i]['diff']),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(data['list'][i]['basePrice']),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(data['list'][i]['compareFront']),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(data['list'][i]['yearlyReturn']),
                ),
              ),
            ],
          ),
        ),
      );

      if (data['list'][i]['cost'] != '-') {
        keepCost = data['list'][i]['cost'];
      }
    }

    return SingleChildScrollView(
      controller: _controller,
      key: PageStorageKey(uuid.v1()),
      child: Column(
        children: _list,
      ),
    );
  }

  ///
  Widget _getUpDownMark({required String updown}) {
    switch (updown) {
      case '0':
        return const Icon(
          Icons.arrow_downward,
          color: Colors.redAccent,
        );
      case '1':
        return const Icon(
          Icons.arrow_upward,
          color: Colors.greenAccent,
        );
      default:
        return const Icon(
          Icons.crop_square,
          color: Colors.black,
        );
    }
  }
}
