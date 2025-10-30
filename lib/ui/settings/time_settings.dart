import 'package:flutter/material.dart';

class TimeSettings extends StatefulWidget {
  const TimeSettings({super.key});

  @override
  State<StatefulWidget> createState() => _TimeSettingsState();
}

class _TimeSettingsState extends State<TimeSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Settings')),
      body: Center(
        child: Card(
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(child: Text('Daily Hour to report: ')),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Time of day'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(child: Text('Weekly Day to report')),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Day of week'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(child: Text('Monthly Day to report')),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Day of month'),
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
