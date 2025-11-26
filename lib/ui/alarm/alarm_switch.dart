import 'package:flutter/material.dart';

class AlarmSwitch extends StatefulWidget {
  const AlarmSwitch({
    super.key,
    required this.isOn,
    required this.saveAlarmCallback,
    required this.deleteAlarmCallback,
  });

  final bool isOn;
  final Function saveAlarmCallback;
  final Function deleteAlarmCallback;

  @override
  State<StatefulWidget> createState() => _AlarmSwitchState();
}

class _AlarmSwitchState extends State<AlarmSwitch> {
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
