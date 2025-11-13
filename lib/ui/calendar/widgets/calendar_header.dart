import 'package:flutter/material.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Monday'),
        Text('Tuesday'),
        Text('Wednesday'),
        Text('Thursday'),
        Text('Friday'),
        Text('Saturday'),
        Text('Sunday'),
      ],
    );
  }
}
