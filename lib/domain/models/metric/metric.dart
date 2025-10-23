import 'package:isar/isar.dart';

part 'metric.g.dart';

@collection
class Metric {
  Id id = Isar.autoIncrement;

  //metric
  String? name;
  String? target;

  //progress
  @enumerated
  late TimeInterval progressTimeInterval;
  List<String>? progressValues;
  List<bool>? progressDone;

  //milestone
  List<String>? milestoneNames;
  List<bool>? milestonesDone;

  //setback
  List<String>? setbackNames;
  List<int>? setbackTimeIntervalStages;

  List<int>? motivation;

  List<int>? relevance;

  List<String>? results;

  int? storyId;
}

enum TimeInterval { daily, weekly, monthly }
