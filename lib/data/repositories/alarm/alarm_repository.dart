import 'package:re_tune/domain/models/alarm/alarm.dart';

abstract class AlarmRepository {
  Future<List<Alarm>> getAlarmOfStory(int storyId);

  Future<void> setAlarm(Alarm alarm);

  Future<void> deleteAlarm(int alarmId);
}
