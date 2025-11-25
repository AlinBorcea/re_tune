import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:re_tune/domain/models/alarm/alarm.dart';
import 'package:re_tune/ui/alarm/alarm_view_model.dart';

import '../../domain/models/story/story.dart';
import '../../utils/utils.dart';

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
                return _alarmItem(alarm);
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

  Widget _alarmItem(Alarm alarm) {
    final titleController = TextEditingController(text: alarm.name);
    final dateController = TextEditingController(
      text: alarm.date != null ? formattedDate(alarm.date!) : '',
    );
    DateTime? pickedDate;

    return Card(
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 80,
              child: Column(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Alarm Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        labelText: 'Alarm Date',
                        hintText: 'Set Date!',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      onTap: () async {
                        pickedDate = await showAdaptiveDateTimePicker(
                          context: context,
                          mode: DateTimeFieldPickerMode.date,
                        );
                        dateController.text = pickedDate != null
                            ? formattedDate(pickedDate!)
                            : dateController.text;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      Text('Delete'),
                    ],
                  ),
                  onPressed: () {
                    _deleteAlarm(alarm);
                  },
                ),
                MySwitch(
                  isOn: alarm.on ?? false,
                  saveAlarmCallback: () {
                    alarm.name = titleController.text;
                    alarm.date = pickedDate ?? alarm.date;
                    alarm.on = true;

                    _saveAlarm(alarm);
                  },
                  deleteAlarmCallback: () {
                    alarm.on = false;
                    _saveAlarm(alarm);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _saveAlarm(Alarm alarm) async {
    widget.alarmViewModel.addAlarm(alarm);
  }

  void _deleteAlarm(Alarm alarm) async {
    await widget.alarmViewModel.deleteAlarm(alarm.id);
    _initData();
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({
    super.key,
    required this.isOn,
    required this.saveAlarmCallback,
    required this.deleteAlarmCallback,
  });

  final bool isOn;
  final Function saveAlarmCallback;
  final Function deleteAlarmCallback;

  @override
  State<StatefulWidget> createState() => MySwitchState();
}

class MySwitchState extends State<MySwitch> {
  var toggleValue = false;

  @override
  void initState() {
    super.initState();
    toggleValue = widget.isOn;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Switch(
    value: toggleValue,
    onChanged: (bool on) {
      setState(() {
        toggleValue = on;
      });

      if (on) {
        widget.saveAlarmCallback();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Alarm turned on'),
            duration: Duration(seconds: 1),
          ),
        );
        return;
      } else if (!on) {
        widget.deleteAlarmCallback();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Alarm turned off'),
            duration: Duration(seconds: 1),
          ),
        );
        return;
      }
    },
  );
}
