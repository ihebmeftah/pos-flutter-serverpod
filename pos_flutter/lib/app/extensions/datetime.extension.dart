import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get toShortDateString => DateFormat('yyyy-MM-dd').format(toLocal());
  String get toShortDateTimeString =>
      DateFormat('yyyy-MM-dd HH:mm').format(toLocal());
  String get toLongDateString {
    return DateFormat('MMM dd, yyyy HH:mm').format(toLocal());
  }

  String get toTimeOnly => DateFormat('HH:mm').format(toLocal());
}
