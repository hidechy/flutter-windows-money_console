// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import '../viewmodels/holiday_view_model.dart';
import '../viewmodels/calendar_view_model.dart';

import 'month_summary_display_screen.dart';
import 'month_list_display_screen.dart';
import 'score_display_screen.dart';

class CalendarScreen extends ConsumerWidget {
  CalendarScreen({Key? key}) : super(key: key);

  late WidgetRef _ref;

  DateTime _currentDate = DateTime.now();

  final EventList<Event> _markedDateMap = EventList(events: {});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    final holidayState = ref.watch(holidayProvider);

    Future(() => makeHolidayMap(holiday: holidayState));

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: CalendarCarousel<Event>(
                minSelectedDate: DateTime(2020, 1, 1),
                markedDatesMap: _markedDateMap,
                locale: 'JA',
                todayBorderColor: Colors.orangeAccent.withOpacity(0.8),
                todayButtonColor: Colors.orangeAccent.withOpacity(0.1),
                selectedDayButtonColor: Colors.greenAccent.withOpacity(0.1),
                thisMonthDayBorderColor: Colors.grey,
                weekendTextStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.red),
                weekdayTextStyle: const TextStyle(color: Colors.grey),
                dayButtonColor: Colors.black.withOpacity(0.3),
                onDayPressed: onDayPressed,
                weekFormat: false,
                selectedDateTime: _currentDate,
                daysHaveCircularBorder: false,
                customGridViewPhysics: const NeverScrollableScrollPhysics(),
                daysTextStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                todayTextStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                headerTextStyle: const TextStyle(fontSize: 18.0),
                onCalendarChanged: onCalendarChanged,
              ),
            ),
            const Divider(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent.withOpacity(0.3),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return MonthListDisplayScreen();
                    },
                  );
                },
                child: const Text('Month List'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent.withOpacity(0.3),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return MonthSummaryDisplayScreen();
                    },
                  );
                },
                child: const Text('Month Summary'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent.withOpacity(0.3),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return ScoreDisplayScreen();
                    },
                  );
                },
                child: const Text('Score List'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  void onDayPressed(DateTime date, List<Event> events) {
    final calendarSelectDateViewModel =
        _ref.watch(calendarSelectDateProvider.notifier);
    calendarSelectDateViewModel.setCalendarSelectDate(date: date.toString());
  }

  ///
  void onCalendarChanged(DateTime date) async {
    final calendarSelectDateViewModel =
        _ref.watch(calendarSelectDateProvider.notifier);
    calendarSelectDateViewModel.setCalendarSelectDate(date: date.toString());
  }

  ///
  void makeHolidayMap({required List holiday}) {
    holiday.map((holi) {
      final exHoli = holi.toString().split('-');
      _markedDateMap.add(
        DateTime(
            int.parse(exHoli[0]), int.parse(exHoli[1]), int.parse(exHoli[2])),
        Event(
          date: DateTime(
              int.parse(exHoli[0]), int.parse(exHoli[1]), int.parse(exHoli[2])),
          icon: const Icon(Icons.flag),
        ),
      );
    });
  }
}
