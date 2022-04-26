import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/calendar_screen.dart';
import 'screens/detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CalendarScreen(),
        ),
        Expanded(
          flex: 4,
          child: DetailScreen(),
        ),
      ],
    );
  }
}
