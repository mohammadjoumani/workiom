import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String getFormatTime() {
    return DateFormat('hh:mm a').format(this);
  }

  String getFormatDash() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String getFormatSlash() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String getUtcDate() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(toUtc());
  }

  String filterFromDate() {
    final date = DateTime.utc(year, month, day);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }

  String filterToDate() {
    final now = DateTime.now();
    "Mohammad Joumani $now";
    final date = DateTime.utc(year, month, day, 23, 59, 59);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }

  bool isSameMonth() {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  bool isBeforeMonth() {
    final now = DateTime.now();
    return year < now.year || (year == now.year && month < now.month);
  }

  bool isAfterMonth() {
    final now = DateTime.now();
    return year > now.year || (year == now.year && month > now.month);
  }
}

extension NonNullDateExtension on DateTime? {
  String getFormatDash() {
    if (this != null) {
      return DateFormat('yyyy-MM-dd').format(this!);
    }
    return '_';
  }

  String getFormatSlash() {
    if (this != null) {
      return DateFormat('dd/MM/yyyy').format(this!);
    }
    return '_';
  }

  bool isSameMonth() {
    final now = DateTime.now();
    if (this == null) return false;
    return this!.year == now.year && this!.month == now.month;
  }

  bool isBeforeMonth() {
    final now = DateTime.now();
    if (this == null) return false;
    return this!.year < now.year || (this!.year == now.year && this!.month < now.month);
  }

  bool isAfterMonth() {
    final now = DateTime.now();
    if (this == null) return false;
    return this!.year > now.year || (this!.year == now.year && this!.month > now.month);
  }
}
