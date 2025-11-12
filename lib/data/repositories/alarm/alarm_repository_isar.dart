import 'package:isar/isar.dart';
import 'package:re_tune/data/repositories/alarm/alarm_repository.dart';
import 'package:re_tune/domain/models/alarm/alarm.dart';

class AlarmRepositoryIsar implements AlarmRepository {
  final Isar _isar;

  AlarmRepositoryIsar(String path)
    : _isar = Isar.openSync([AlarmSchema], directory: path);

  @override
  Future<List<Alarm>> getAlarmOfStory(int storyId) =>
      _isar.alarms.where().storyIdEqualTo(storyId).findAll();

  @override
  Future<void> setAlarm(Alarm alarm) async {
    await _isar.writeTxn(() async {
      await _isar.alarms.put(alarm);
    });
  }

  @override
  Future<void> deleteAlarm(int alarmId) async {
    await _isar.alarms.delete(alarmId);
  }
}
