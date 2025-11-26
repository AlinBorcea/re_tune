import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:re_tune/ui/alarm/alarm_switch.dart';
import 'package:re_tune/utils/utils.dart';

import '../../domain/models/alarm/alarm.dart';

class AlarmItem extends StatefulWidget {
  const AlarmItem({
    super.key,
    required this.alarm,
    required this.deleteAlarm,
    required this.saveAlarm,
  });

  final Alarm alarm;
  final Function deleteAlarm;
  final Function saveAlarm;

  @override
  State<StatefulWidget> createState() => _AlarmItemState();
}

class _AlarmItemState extends State<AlarmItem> {
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? pickedDate;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.alarm.name ?? '';
    _dateController.text = widget.alarm.date != null
        ? formattedDate(widget.alarm.date!)
        : '';
  }

  @override
  Widget build(BuildContext context) {
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
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Alarm Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Alarm Date',
                          hintText: 'Set Date!',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        onTap: () async {
                          pickedDate = await showAdaptiveDateTimePicker(
                            context: context,
                            mode: DateTimeFieldPickerMode.date,
                          );
                          _dateController.text = pickedDate != null
                              ? formattedDate(pickedDate!)
                              : _dateController.text;
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
                      widget.deleteAlarm();
                    },
                  ),
                  AlarmSwitch(
                    isOn: widget.alarm.on ?? false,
                    saveAlarmCallback: () {
                      widget.alarm.name = _titleController.text;
                      widget.alarm.date = pickedDate ?? widget.alarm.date;
                      widget.alarm.on = true;

                      widget.saveAlarm();
                    },
                    deleteAlarmCallback: () {
                      widget.alarm.on = false;
                      widget.saveAlarm(widget.alarm);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}
