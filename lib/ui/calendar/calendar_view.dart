import 'package:flutter/material.dart';
import 'package:re_tune/domain/models/story/story.dart';
import 'package:re_tune/ui/alarm/alarm_view.dart';
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
      children: _calendarContent(),
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

  List<Widget> _calendarContent() {
    List<Widget> rows = [];

    final currentDate = DateTime.now();
    final firstDayOfMonth = DateTime.utc(
      currentDate.year,
      currentDate.month,
      1,
    );
    final lastDay = firstDayOfMonth.add(
      Duration(days: (7 - firstDayOfMonth.weekday)),
    );
    final firstDay = lastDay.subtract(Duration(days: 6));

    rows.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _header(),
      ),
    );

    for (int i = lastDay.day - 6, c = 1; c <= 5; i += 7, c++) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _weekDays(i, i + 6),
        ),
      );
    }

    return rows;
  }

  List<Widget> _weekDays(int firstDay, int lastDay) {
    List<Widget> widgets = [];
    for (int i = firstDay; i <= lastDay; i++) {
      final story = widget.calendarViewModel.storyListContainsDay(_stories, i);
      final dayHasEvent = story != null;

      widgets.add(
        GestureDetector(
          onTap: () {
            final stories = widget.calendarViewModel.storiesOfDay(_stories, i);

            if (stories.length == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AlarmView(story: stories.last),
                ),
              );
            } else if (stories.length > 1) {
              _showSelectStoryDialog(stories);
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

  void _showSelectStoryDialog(List<Story> stories) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pick Story'),
        content: SizedBox(
          height: 200,
          width: 200,
          child: ListView.builder(
            itemCount: stories.length,
            itemBuilder: (context, index) => TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AlarmView(story: stories[index]),
                  ),
                );
              },
              child: Text('${stories[index].name}'),
            ),
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, 'Cancel'),
          ),
        ],
      ),
    );
  }
}
