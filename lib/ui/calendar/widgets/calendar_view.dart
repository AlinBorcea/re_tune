import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_tune/data/repositories/alarm/alarm_repository_isar.dart';
import 'package:re_tune/domain/models/story/story.dart';
import 'package:re_tune/ui/alarm/alarm_view.dart';
import 'package:re_tune/ui/alarm/alarm_view_model.dart';
import 'package:re_tune/ui/calendar/view_models/calendar_view_model.dart';
import 'package:re_tune/ui/calendar/widgets/calendar_content.dart';
import 'package:re_tune/ui/calendar/widgets/calendar_header.dart';

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
      body: Center(
        child: _initDone
            ? CalendarContent(
                stories: _stories,
                calendarHeader: CalendarHeader(),
                calendarViewModel: widget.calendarViewModel,
                showSelectStoryDialog: _showSelectStoryDialog,
              )
            : Text('Loading'),
      ),
    );
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
              onPressed: () async {
                final dirPath = await getApplicationDocumentsDirectory();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AlarmView(
                      story: stories[index],
                      alarmViewModel: AlarmViewModel(
                        AlarmRepositoryIsar(dirPath.path),
                      ),
                    ),
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
