import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_console/models/amazon_purchase_model.dart';

import '../viewmodels/amazon_purchase_view_model.dart';
import '../viewmodels/calendar_view_model.dart';

import '../utility/utility.dart';

import 'package:uuid/uuid.dart';

class AmazonPurchaseDisplayScreen extends ConsumerWidget {
  AmazonPurchaseDisplayScreen({Key? key}) : super(key: key);

  final Utility _utility = Utility();

  final ScrollController _controller = ScrollController();

  var uuid = const Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var calendarSelectDateState = ref.watch(calendarSelectDateProvider);
    if (calendarSelectDateState == "") {
      calendarSelectDateState = DateTime.now().toString();
    }

    _utility.makeYMDYData(calendarSelectDateState);

    final exDate = calendarSelectDateState.split(' ');
    final exYmd = exDate[0].split('-');

    final calendarViewModel = ref.watch(calendarSelectDateProvider.notifier);

    final prevYear = '${int.parse(exYmd[0]) - 1}-01-01';
    final nextYear = '${int.parse(exYmd[0]) + 1}-01-01';

    final amazonPurchaseState = ref.watch(amazonPurchaseProvider(exDate[0]));

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
                children: [
                  Text('月別項目別使用履歴 : ${exYmd[0]}'),
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            if (exYmd[0] == '2020') {
                            } else {
                              calendarViewModel.setCalendarSelectDate(
                                  date: prevYear);
                            }
                          },
                          child: const Icon(Icons.skip_previous),
                        ),
                      ),
                      const SizedBox(width: 10),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            calendarViewModel.setCalendarSelectDate(
                                date: nextYear);
                          },
                          child: const Icon(Icons.skip_next),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: dispAmazonPurchaseList(data: amazonPurchaseState),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget dispAmazonPurchaseList({required List<AmazonPurchaseData> data}) {
    List<Widget> _list = [];

    var keepYm = '';
    for (var i = 0; i < data.length; i++) {
      var exDate = data[i].date.toString().split(' ');
      var exYmd = exDate[0].split('-');

      if (keepYm != '${exYmd[0]}-${exYmd[1]}') {
        _list.add(
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.3),
            ),
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
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: Colors.white),
                child: (data[i].img == '')
                    ? Image.asset(
                        'assets/images/no_image.png',
                        fit: BoxFit.fitHeight,
                      )
                    : Image.network(
                        data[i].img,
                        fit: BoxFit.fitHeight,
                      ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[i].item),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(exDate[0]),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child:
                            Text(_utility.makeCurrencyDisplay(data[i].price)),
                      ),
                    ],
                  ),
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
        children: _list,
      ),
    );
  }
}
