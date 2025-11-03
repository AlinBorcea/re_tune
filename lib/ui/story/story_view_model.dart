import 'package:re_tune/data/repositories/story/story_repository_isar.dart';
import 'package:re_tune/data/services/story_data_validation.dart';
import 'package:re_tune/domain/models/metric/metric.dart';
import 'package:re_tune/domain/models/story/story.dart';

class StoryViewModel {
  final StoryRepositoryIsar storyRepository;
  final StoryDataValidation storyDataValidation;

  StoryViewModel(this.storyRepository, this.storyDataValidation);

  /// StorySchema
  Future<List<Story>> get stories => storyRepository.stories;

  Future<void> putStory(Story story) async =>
      await storyRepository.putStory(story);

  Future<void> deleteStory(Story story) async =>
      await storyRepository.deleteStory(story);

  bool isValidStoryName(String? name) =>
      storyDataValidation.isValidStoryName(name);

  bool isValidStoryDescription(String? description) =>
      storyDataValidation.isValidStoryDescription(description);

  bool isValidStoryDates(DateTime? startDate, DateTime? endDate) =>
      storyDataValidation.isValidStoryDates(startDate, endDate);

  ///MetricSchema
  Future<List<Metric>> getMetricsOfStory(int storyId) =>
      storyRepository.getMetricsOfStory(storyId);

  void pushMetric(Metric metric) => storyRepository.pushMetric(metric);
}
