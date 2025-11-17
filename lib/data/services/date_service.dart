class DateService {
  late final int firstDayOnCalendar;
  late final int lastDayOnCalendar;

  DateService(DateTime currentDate) {
    final firstDayOfMonth = DateTime.utc(
      currentDate.year,
      currentDate.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      firstDayOfMonth.year,
      firstDayOfMonth.month + 1,
      0,
    );

    final lastDayOfFirstWeek = firstDayOfMonth.add(
      Duration(days: (7 - firstDayOfMonth.weekday)),
    );


    firstDayOnCalendar = lastDayOfFirstWeek.day - 6;
    lastDayOnCalendar = lastDayOfMonth.day + (7 - lastDayOfMonth.weekday);
  }
}
