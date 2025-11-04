import 'package:re_tune/data/repositories/story/story_repository.dart';
import 'package:re_tune/domain/models/story/story.dart';

class CalendarViewModel {
  final StoryRepository storyRepository;

  CalendarViewModel(this.storyRepository);

  Future<List<Story>> getByStartDateInRange(DateTime start, DateTime end) =>
      storyRepository.getByStartDateInRange(start, end);
}
