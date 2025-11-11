import 'package:isar/isar.dart';

part 'alarm.g.dart';

@collection
class Alarm {
  Id id = Isar.autoIncrement;

  String? name;

  DateTime? date;

  @Index()
  int? storyId;
}