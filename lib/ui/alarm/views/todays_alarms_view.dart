import 'package:flutter/material.dart';
import 'package:re_tune/domain/models/alarm/alarm.dart';
import 'package:re_tune/ui/alarm/view_models/alarm_view_model.dart';
import 'package:re_tune/ui/alarm/widgets/alarm_item.dart';

class TodaysAlarmsView extends StatefulWidget {
  const TodaysAlarmsView({super.key, required this.alarmViewModel});

  final AlarmViewModel alarmViewModel;

  @override
  State<StatefulWidget> createState() => _TodaysAlarmsViewState();
}

class _TodaysAlarmsViewState extends State<TodaysAlarmsView> {
  late final List<Alarm> _alarms;
  var _initDone = false;

  @override
  void initState() {
    super.initState();
    _initAlarms();
  }

  void _initAlarms() async {
    _alarms = await widget.alarmViewModel.getTodaysAlarms();
    _initDone = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_initDone) return Text('Loading');

    return Scaffold(
      appBar: AppBar(title: Text("Today's Alarms")),
      body: ListView.builder(
        itemCount: _alarms.length,
        itemBuilder: (context, index) {
          return AlarmItem(
            alarm: _alarms[index],
            deleteAlarm: () {},
            saveAlarm: () {},
          );
        },
      ),
    );
  }
}
