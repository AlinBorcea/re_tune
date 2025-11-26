import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_tune/data/repositories/alarm/alarm_repository_isar.dart';
import 'package:re_tune/ui/alarm/view_models/alarm_view_model.dart';
import 'package:re_tune/ui/alarm/views/todays_alarms_view.dart';

import '../../calendar/widgets/calendar_view.dart';
import '../../settings/time_settings.dart';

import 'package:re_tune/ui/story/view_models/story_view_model.dart';
import '../../calendar/view_models/calendar_view_model.dart';

class StoryViewPopupMenu extends StatelessWidget {
  const StoryViewPopupMenu({super.key, required this.storyViewModel});

  final StoryViewModel storyViewModel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<void Function()>(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Text('Time Settings'),
            value: () =>
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => TimeSettings())),
          ),
          PopupMenuItem(
            child: Text('Calendar'),
            value: () =>
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        CalendarView(
                          calendarViewModel: CalendarViewModel(
                            storyViewModel.storyRepository,
                          ),
                        ),
                  ),
                ),
          ),
          PopupMenuItem(
              child: Text("Today's Alarms"),
              value: () async {
                final dirPath = await getApplicationDocumentsDirectory();
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) =>
                    TodaysAlarmsView(
                      alarmViewModel: AlarmViewModel(AlarmRepositoryIsar(dirPath.path)),)));
              }
          ),
        ];
      },
      onSelected: (fn) => fn(),
    );
  }
}
