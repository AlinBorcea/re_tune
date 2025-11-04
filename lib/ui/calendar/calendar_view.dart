import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TableCalendar - Multi')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _header(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _weekDays(1, 7),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _weekDays(8, 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _weekDays(15, 21),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _weekDays(22, 28),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text('data')],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _header() {
    return [
      Text('Monday'),
      Text('Tuesday'),
      Text('Wednesday'),
      Text('Thursday'),
      Text('Friday'),
      Text('Saturday'),
      Text('Sunday'),
    ];
  }

  List<Widget> _weekDays(int firstDay, int lastDay) {
    List<Widget> widgets = [];
    for (int i = firstDay; i <= lastDay; i++) {
      widgets.add(Text('$i'));
    }

    return widgets;
  }
}
