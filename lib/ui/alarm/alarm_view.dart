import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({super.key});

  @override
  State<StatefulWidget> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  late final List<Widget> _body = [
    Row(
      children: [
        Expanded(
          child: TextButton(onPressed: () => _removeAlarm(), child: Text('Remove')),
        ),
        Expanded(
          child: TextButton(onPressed: () => _addAlarm(), child: Text('Add')),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alarms')),
      body: Column(children: _body),
    );
  }

  void _removeAlarm() {
    if (_body.length <= 1) return;
    _body.removeAt(_body.length-2);
    setState(() {});
  }

  void _addAlarm() {
    _body.insert(_body.length-1, _alarmItem());
    setState(() {});
  }

  Widget _alarmItem() {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Alarm Name',
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
                debugPrint(pickedDate.toString());
              },
            ),
          ),
          Expanded(
            child: TextButton(onPressed: () {}, child: Text('Toggle')),
          ),
        ],
      ),
    );
  }
}
