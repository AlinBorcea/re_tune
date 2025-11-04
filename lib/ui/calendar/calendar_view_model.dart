import 'package:re_tune/data/repositories/story/story_repository.dart';
import 'package:re_tune/domain/models/story/story.dart';

class CalendarViewModel {
  final StoryRepository storyRepository;

  CalendarViewModel(this.storyRepository);

  Future<List<Story>> getByStartDateInRange(DateTime start, DateTime end) =>
      storyRepository.getByStartDateInRange(start, end);

  Story? storyListContainsDay(List<Story> stories, int day) {

    for (final story in stories) {
      if (story.startDate == null) continue;
      if (story.startDate!.day == day) return story;
    }

    return null;
  }
}
