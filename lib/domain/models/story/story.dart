import 'package:isar/isar.dart';

part 'story.g.dart';

@collection
class Story {
  Id id = Isar.autoIncrement;

  String? name;

  String? description;

  DateTime? startDate;

  DateTime? endDate;

  @override
  String toString() {
    return 'Story{id: $id, name: $name, description: $description, startDate: $startDate, endDate: $endDate}';
  }
}
