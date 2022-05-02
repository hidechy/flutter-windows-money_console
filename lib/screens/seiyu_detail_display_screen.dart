// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/seiyu_purchase_view_model.dart';

import '../models/seiyu_purchase_model.dart';

import 'package:uuid/uuid.dart';

class SeiyuDetailDisplayScreen extends ConsumerWidget {
  SeiyuDetailDisplayScreen({Key? key}) : super(key: key);

  final ScrollController controller = ScrollController();

  var uuid = const Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seiyuPurchaseDetailState = ref.watch(seiyuPurchaseDetailProvider);

    final exDate = seiyuPurchaseDetailState[0].date.toString().split(' ');

    return SizedBox(
      height: MediaQuery.of(context).size.height - 220,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(exDate[0]),
          ),
          Expanded(
            child: dispSeiyuPurchaseList(data: seiyuPurchaseDetailState),
          ),
        ],
      ),
    );
  }

  ///
  Widget dispSeiyuPurchaseList({required List<SeiyuPurchaseData> data}) {
    List<Widget> _list = [];

    for (var i = 0; i < data.length; i++) {
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
              SizedBox(
                width: 60,
                child: Image.network(data[i].img),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[i].item),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(data[i].tanka),
                  Text(data[i].kosuu),
                  Text(data[i].price),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      controller: controller,
      key: PageStorageKey(uuid.v1()),
      child: Column(
        children: _list,
      ),
    );
  }
}
