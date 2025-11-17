import 'package:flutter_test/flutter_test.dart';
import 'package:re_tune/data/services/date_service.dart';

void main() {
  final dateService = DateService(DateTime.now().subtract(Duration(days: 20)));

  test('Date service days', () {
    expect(dateService.firstDayOnCalendar, -1);
    expect(dateService.lastDayOnCalendar, 33);
  });
}
