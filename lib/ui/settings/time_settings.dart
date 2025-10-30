import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class TimeSettings extends StatefulWidget {
  const TimeSettings({super.key});

  @override
  State<StatefulWidget> createState() => _TimeSettingsState();
}

class _TimeSettingsState extends State<TimeSettings> {
  final _dailyHourController = TextEditingController();
  final _weeklyDayController = TextEditingController();
  final _monthlyDayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Settings')),
      body: Center(
        child: Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text('Daily Hour to report: ')),
                  Flexible(
                    child: TextField(
                      controller: _dailyHourController,
                      decoration: InputDecoration(
                        labelText: _dailyHourController.text,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      onTap: () async {
                        final time = await showAdaptiveDateTimePicker(
                          context: context,
                          mode: DateTimeFieldPickerMode.time,
                        );

                        if (time != null) {
                          _dailyHourController.text = time.toString();
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text('Weekly Day to report')),
                  Flexible(
                    child: TextField(
                      controller: _weeklyDayController,
                      decoration: InputDecoration(
                        labelText: _weeklyDayController.text,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      onTap: () async {
                        final time = await showAdaptiveDateTimePicker(
                          context: context,
                          mode: DateTimeFieldPickerMode.date,
                        );

                        if (time != null) {
                          _weeklyDayController.text = time.toString();
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text('Monthly Day to report')),
                  Flexible(
                    child: TextField(
                      controller: _monthlyDayController,
                      decoration: InputDecoration(
                        labelText: _monthlyDayController.text,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      onTap: () async {
                        final time = await showAdaptiveDateTimePicker(
                          context: context,
                          mode: DateTimeFieldPickerMode.date,
                        );

                        if (time != null) {
                          _monthlyDayController.text = time.toString();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
