import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_tune/data/services/date_service.dart';
import 'package:re_tune/domain/models/story/story.dart';
import 'package:re_tune/ui/calendar/view_models/calendar_view_model.dart';
import 'package:re_tune/ui/calendar/widgets/calendar_header.dart';

import '../../../data/repositories/alarm/alarm_repository_isar.dart';
import '../../alarm/alarm_view.dart';
import '../../alarm/alarm_view_model.dart';

class CalendarContent extends StatefulWidget {
  const CalendarContent({
    super.key,
    required this.stories,
    required this.calendarHeader,
    required this.calendarViewModel,
    required this.showSelectStoryDialog,
  });

  final CalendarViewModel calendarViewModel;
  final void Function(List<Story> stories) showSelectStoryDialog;

  final CalendarHeader calendarHeader;
  final List<Story> stories;

  @override
  State<StatefulWidget> createState() => _CalendarContentState();
}

class _CalendarContentState extends State<CalendarContent> {
  @override
  Widget build(BuildContext context) {
    final dateService = DateService(DateTime.now());

    List<Widget> rows = [widget.calendarHeader];
    for (int i = dateService.firstDayOnCalendar; i < dateService.lastDayOnCalendar; i += 7) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _weekDays(i, i + 6, dateService.lastDayOfMonth),
        ),
      );
    }

    return Column(children: rows);
  }

  List<Widget> _weekDays(int firstDay, int lastDay, int lastDayOfMonth) {
    List<Widget> widgets = [];
    for (int i = firstDay; i <= lastDay; i++) {
      final story = widget.calendarViewModel.storyListContainsDay(
        widget.stories,
        i,
      );
      final dayHasEvent = story != null;

      widgets.add(
        OutlinedButton(
          onPressed: () async {
            final stories = widget.calendarViewModel.storiesOfDay(
              widget.stories,
              i,
            );

            if (stories.length == 1) {
              final dirPath = await getApplicationDocumentsDirectory();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AlarmView(
                    story: stories.last,
                    alarmViewModel: AlarmViewModel(
                      AlarmRepositoryIsar(dirPath.path),
                    ),
                  ),
                ),
              );
            } else if (stories.length > 1) {
              widget.showSelectStoryDialog(stories);
            }
          },
          child: Text(
            i >= 1 && i <= lastDayOfMonth ? '$i' : '',
            style: TextStyle(color: dayHasEvent ? Colors.red : Colors.black, fontSize: 20),
          ),
        ),
      );
    }

    return widgets;
  }
}
