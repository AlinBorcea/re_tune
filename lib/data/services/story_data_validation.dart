class StoryDataValidation {
  bool isValidStoryName(String? name) => name != null && name.isNotEmpty;

  bool isValidStoryDescription(String? description) =>
      description != null && description.length > 5;

  bool isValidStoryDates(DateTime? startDate, DateTime? endDate) =>
      startDate != null && endDate != null && startDate.compareTo(endDate) < 0;
}
