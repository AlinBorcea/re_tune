import '../../../domain/models/metric/metric.dart';
import '../../../domain/models/story/story.dart';

abstract class StoryRepository {
  /// StorySchema
  Future<List<Story>> get stories;

  Future<void> putStory(Story story);

  Future<void> deleteStory(Story story);

  ///MetricSchema
  Future<List<Metric>> getMetricsOfStory(int storyId);

  void pushMetric(Metric metric);
}
