import 'package:flutter_riverpod/flutter_riverpod.dart';

//////////////////////////////////////////////////////////////////////

final calendarSelectDateProvider =
    StateNotifierProvider.autoDispose<CalendarSelectDateStateNotifier, String>(
        (ref) {
  return CalendarSelectDateStateNotifier('');
});

class CalendarSelectDateStateNotifier extends StateNotifier<String> {
  CalendarSelectDateStateNotifier(String state) : super(state);

  void setCalendarSelectDate({required String date}) {
    state = date;
  }
}

//////////////////////////////////////////////////////////////////////
