import 'package:isar/isar.dart';
import 'package:re_tune/domain/models/metric/metric.dart';
import 'package:re_tune/domain/models/story/story.dart';

class StoryViewModel {
  final Isar _isar;
  final String appDocPath;

  StoryViewModel(this.appDocPath)
    : _isar = Isar.openSync([StorySchema, MetricSchema], directory: appDocPath);

  /// StorySchema
  Future<List<Story>> get stories => _isar.storys.where().findAll();

  void putStory(Story story) {
    _isar.writeTxn(() async {
      await _isar.storys.put(story);
    });
  }

  void deleteStory(Story story) {
    _isar.writeTxn(() async {
      _isar.storys.delete(story.id);
    });
  }

  bool isValidStoryName(String? name) => name != null && name.isNotEmpty;

  bool isValidStoryDescription(String? description) =>
      description != null && description.length > 5;

  bool isValidStoryDates(DateTime? startDate, DateTime? endDate) =>
      startDate != null && endDate != null && startDate.compareTo(endDate) < 0;

  ///MetricSchema
}
