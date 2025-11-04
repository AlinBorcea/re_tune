import 'package:flutter/material.dart';
import 'package:re_tune/domain/models/story/story.dart';
import 'package:re_tune/ui/calendar/calendar_view_model.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key, required this.calendarViewModel});

  final CalendarViewModel calendarViewModel;

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late final List<Story> _stories;
  bool _initDone = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    _stories = await widget.calendarViewModel.getByStartDateInRange(
      DateTime.now().subtract(Duration(days: 3)),
      DateTime.now().add(Duration(days: 26)),
    );

    debugPrint(_stories.toString());
    _initDone = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TableCalendar - Multi')),
      body: Center(child: _initDone ? _calendar() : Text('Loading')),
    );
  }

  Widget _calendar() {
    return Column(
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
      final story = widget.calendarViewModel.storyListContainsDay(_stories, i);
      final dayHasEvent = story != null;

      widgets.add(
        GestureDetector(
          onTap: () {
            if (dayHasEvent) {
              _onPressWeekDay(story);
            }
          },
          child: Text(
            '$i',
            style: TextStyle(color: dayHasEvent ? Colors.red : Colors.black),
          ),
        ),
      );
    }

    return widgets;
  }

  void _onPressWeekDay(Story story) {
    debugPrint(story.toString());
  }
}
