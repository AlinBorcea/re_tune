import 'package:flutter/material.dart';
import 'package:re_tune/ui/story/view_models/story_view_model.dart';

import '../../calendar/calendar_view.dart';
import '../../calendar/calendar_view_model.dart';
import '../../settings/time_settings.dart';

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
            value: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => TimeSettings())),
          ),
          PopupMenuItem(
            child: Text('Calendar'),
            value: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CalendarView(
                  calendarViewModel: CalendarViewModel(
                    storyViewModel.storyRepository,
                  ),
                ),
              ),
            ),
          ),
        ];
      },
      onSelected: (fn) => fn(),
    );
  }
}
