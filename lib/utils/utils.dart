import 'package:intl/intl.dart';

String formattedDate(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
