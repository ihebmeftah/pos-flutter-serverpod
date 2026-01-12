import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get toShortDateString => DateFormat('yyyy-MM-dd').format(toLocal());
  String get toTimeOnly => DateFormat('HH:mm').format(toLocal());
}
