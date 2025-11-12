import 'package:re_tune/data/repositories/alarm/alarm_repository.dart';

import '../../domain/models/alarm/alarm.dart';

class AlarmViewModel {
  final AlarmRepository alarmRepository;

  AlarmViewModel(this.alarmRepository);

  Future<List<Alarm>> getAlarmsOfStory(int storyId) async =>
      await alarmRepository.getAlarmOfStory(storyId);

  Future<void> addAlarm(Alarm alarm) async {
    await alarmRepository.setAlarm(alarm);
  }

  Future<void> deleteAlarm(int alarmId) async {
    await alarmRepository.deleteAlarm(alarmId);
  }
}
