import 'package:isar/isar.dart';
import 'package:re_tune/data/repositories/story/story_repository.dart';
import 'package:re_tune/domain/models/metric/metric.dart';
import 'package:re_tune/domain/models/story/story.dart';

class StoryRepositoryIsar implements StoryRepository {
  final Isar _isar;

  StoryRepositoryIsar(String dirPath)
    : _isar = Isar.openSync([StorySchema, MetricSchema], directory: dirPath);

  /// StorySchema
  @override
  Future<List<Story>> get stories => _isar.storys.where().findAll();

  @override
  Future<void> putStory(Story story) async {
    await _isar.writeTxn(() async {
      await _isar.storys.put(story);
    });
  }

  @override
  Future<void> deleteStory(Story story) async {
    await _isar.writeTxn(() async {
      await _isar.storys.delete(story.id);
    });
  }

  ///MetricSchema
  @override
  Future<List<Metric>> getMetricsOfStory(int storyId) =>
      _isar.metrics.where().storyIdEqualTo(storyId).findAll();

  @override
  void pushMetric(Metric metric) {
    _isar.writeTxn(() async {
      _isar.metrics.put(metric);
    });
  }
}
