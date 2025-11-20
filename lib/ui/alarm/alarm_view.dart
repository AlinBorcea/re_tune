import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:re_tune/domain/models/alarm/alarm.dart';
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
  late final List<Widget> _body = [
    Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => _removeAlarm(),
            child: Text('Remove'),
          ),
        ),
        Expanded(
          child: TextButton(onPressed: () => _addAlarm(), child: Text('Add')),
        ),
      ],
    ),
  ];

  final List<TextEditingController> _alarmNameControllers = [];
  final List<TextEditingController> _alarmDateControllers = [];
  final List<bool> _alarmToggleValues = [];
  late final List<Alarm> _alarms;
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
      appBar: AppBar(title: Text('Alarms')),
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

                return _alarmItem(
                  _alarms[index].name ?? '',
                  _alarms[index].date?.toString() ?? '',
                );
              },
            )
          : Text('Init not done'),
    );
  }

  void _removeAlarm() {
    if (_body.length <= 1) return;
    _body.removeAt(_body.length - 2);
    _alarmNameControllers.removeLast();
    _alarms.removeLast();
    setState(() {});
  }

  void _addAlarm() {
    _body.insert(_body.length - 1, _alarmItem());
    _alarms.add(Alarm());
    setState(() {});
  }

  Widget _alarmItem([String title = '', String date = '']) {
    final titleController = TextEditingController(text: title);
    final dateController = TextEditingController(text: date);
    var toggleValue = false;
    DateTime? pickedDate;

    _alarmNameControllers.add(dateController);
    _alarmDateControllers.add(dateController);
    _alarmToggleValues.add(toggleValue);

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
                        dateController.text = pickedDate.toString();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MySwitch(
              saveAlarmCallback: () => _saveAlarm(
                titleController.text,
                pickedDate ?? DateTime.now(),
              ),
              deleteAlarmCallback: () => _deleteAlarm(),
            ),
          ),
        ],
      ),
    );
  }

  void _saveAlarm(String name, DateTime date) async {
    final alarm = Alarm()
      ..name = name
      ..date = date
      ..storyId = widget.story.id;

    widget.alarmViewModel.addAlarm(alarm);
  }

  void _deleteAlarm() {
    widget.alarmViewModel.deleteAlarm(1);
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({
    super.key,
    required this.saveAlarmCallback,
    required this.deleteAlarmCallback,
  });

  final Function saveAlarmCallback;
  final Function deleteAlarmCallback;

  @override
  State<StatefulWidget> createState() => MySwitchState();
}

class MySwitchState extends State<MySwitch> {
  var toggleValue = false;

  @override
  Widget build(BuildContext context) => Switch(
    value: toggleValue,
    onChanged: (bool on) {
      setState(() {
        toggleValue = on;
      });

      if (on) {
        widget.saveAlarmCallback();
        return;
      } else if (!on) {
        widget.deleteAlarmCallback();
        return;
      }
    },
  );
}
