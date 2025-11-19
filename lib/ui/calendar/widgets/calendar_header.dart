import 'package:flutter/material.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 80, child: Text(' Monday')),
        SizedBox(width: 80, child: Text(' Tuesday')),
        SizedBox(width: 80, child: Text('Wednesday')),
        SizedBox(width: 80, child: Text('  Thursday')),
        SizedBox(width: 80, child: Text('      Friday')),
        SizedBox(width: 80, child: Text('    Saturday')),
        SizedBox(width: 80, child: Text('       Sunday')),
      ],
    );
  }
}
