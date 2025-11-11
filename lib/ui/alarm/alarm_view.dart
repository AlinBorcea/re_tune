import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import '../../domain/models/story/story.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({super.key, required this.story});

  final Story story;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alarms')),
      body: Column(children: _body),
    );
  }

  void _removeAlarm() {
    if (_body.length <= 1) return;
    _body.removeAt(_body.length - 2);
    _alarmNameControllers.removeLast();
    setState(() {});
  }

  void _addAlarm() {
    _body.insert(_body.length - 1, _alarmItem());
    setState(() {});
  }

  Widget _alarmItem() {
    final titleController = TextEditingController();
    final dateController = TextEditingController();
    var toggleValue = false;

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
                        final pickedDate = await showAdaptiveDateTimePicker(
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
            child: Switch(
              value: toggleValue,
              onChanged: (bool on) {
                setState(() {
                  toggleValue = on;
                });

                if (on) {
                  debugPrint('Saving alarm ${titleController.text}');
                  return;
                }

                debugPrint('Turning off alarm ${titleController.text}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
