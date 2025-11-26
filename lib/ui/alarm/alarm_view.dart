import 'package:flutter/material.dart';

import 'package:re_tune/domain/models/alarm/alarm.dart';
import 'package:re_tune/ui/alarm/alarm_item.dart';
import 'package:re_tune/ui/alarm/alarm_view_model.dart';

import '../../domain/models/story/story.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({
    super.key,
    required this.story,
    required this.alarmViewModel,
  });

  final Story story;
  final AlarmViewModel alarmViewModel;

  @override
  State<StatefulWidget> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  late List<Alarm> _alarms;
  var _initDone = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    _alarms = await widget.alarmViewModel.getAlarmsOfStory(widget.story.id);
    _initDone = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alarms of ${widget.story.name}')),
      body: _initDone
          ? ListView.builder(
              itemCount: _alarms.length + 1,
              itemBuilder: (context, index) {
                if (index == _alarms.length) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => _removeAlarm(),
                          child: Text('Remove'),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => _addAlarm(),
                          child: Text('Add'),
                        ),
                      ),
                    ],
                  );
                }

                final alarm = _alarms[index];
                return AlarmItem(
                  alarm: alarm,
                  deleteAlarm: () => _removeAlarm(),
                  saveAlarm: () => _saveAlarm(alarm),
                );
              },
            )
          : Text('Init not done'),
    );
  }

  void _removeAlarm() {
    final alarm = _alarms.removeLast();
    widget.alarmViewModel.deleteAlarm(alarm.id);
    setState(() {});
  }

  void _addAlarm() {
    _alarms.add(Alarm()..storyId = widget.story.id);
    setState(() {});
  }

  void _saveAlarm(Alarm alarm) async {
    widget.alarmViewModel.addAlarm(alarm);
  }

  void _deleteAlarm(Alarm alarm) async {
    await widget.alarmViewModel.deleteAlarm(alarm.id);
    _initData();
  }
}
