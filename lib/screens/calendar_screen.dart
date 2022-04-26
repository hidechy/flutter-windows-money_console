// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

import '../viewmodels/calendar_view_model.dart';

class CalendarScreen extends ConsumerWidget {
  CalendarScreen({Key? key}) : super(key: key);

  late WidgetRef _ref;

  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    final calendarSelectDateState = ref.watch(calendarSelectDateProvider);

    final exDate = calendarSelectDateState.split(' ');
    final exYmd = exDate[0].split('-');

    if (exYmd.length == 3) {
      _currentDate = DateTime(
          int.parse(exYmd[0]), int.parse(exYmd[1]), int.parse(exYmd[2]));
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: CalendarCarousel<Event>(
                minSelectedDate: DateTime(2020, 1, 1),

//                markedDatesMap: _markedDateMap,

                locale: 'JA',

                todayBorderColor: Colors.orangeAccent.withOpacity(0.8),
                todayButtonColor: Colors.orangeAccent.withOpacity(0.1),

                selectedDayButtonColor: Colors.greenAccent.withOpacity(0.1),

                thisMonthDayBorderColor: Colors.grey,

                weekendTextStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.red),
                weekdayTextStyle: const TextStyle(color: Colors.grey),
                dayButtonColor: Colors.black.withOpacity(0.3),

                weekFormat: false,
                daysHaveCircularBorder: false,
                customGridViewPhysics: const NeverScrollableScrollPhysics(),
                daysTextStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                todayTextStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),

                headerTextStyle: const TextStyle(fontSize: 18.0),

                onDayPressed: onDayPressed,

                selectedDateTime: _currentDate,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  onDayPressed(DateTime date, List<Event> events) {
    final calendarSelectDateViewModel =
        _ref.watch(calendarSelectDateProvider.notifier);
    calendarSelectDateViewModel.setCalendarSelectDate(date: date.toString());
  }
}
