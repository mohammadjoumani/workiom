import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:workiom/core/util/constants.dart';

extension StringExtension on String {
  String createMask(int visibleLength) {
    if (isEmpty) return '';
    int maskLength = length - visibleLength;
    return substring(maskLength) + '*' * maskLength;
  }

  String getFormatNumber() {
    final numberFormatter = NumberFormat.decimalPattern('en_US');
    return numberFormatter.format(num.parse(this));
  }

  void log() {
    if (kDebugMode) {
      print(this);
    }
  }

  String getDate() {
    final date = DateTime.parse(this);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }
}

extension NonNullStringExtension on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }

  String getPlaceHolderImage() {
    if (this == null) return '';
    return this!.split(' ').map((e) => e[0]).join('').toUpperCase();
  }

  String getLocalDate() {
    if (this != null) {
      final date = DateTime.parse('${this}Z').toLocal();
      return DateFormat('yyyy-MM-dd').format(date);
    }
    return '_';
  }

  // String getFormatSlash() {
  //   if (this != null) {
  //     final date = DateTime.parse(this!);
  //     return DateFormat('dd/MM/yyyy').format(date);
  //   }
  //   return '_';
  // }

  String? getUtcDate() {
    if (this != null) {
      final date = DateTime.parse(this!).toUtc();
      return DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
    }
    return null;
  }

  String getLocalTime() {
    if (this != null) {
      final date = DateTime.parse('${this}Z').toLocal();
      return DateFormat('hh:mm a').format(date);
    }
    return '_';
  }

  DateTime? convertToDate() {
    if (this != null) {
      return DateTime.parse(this!);
    }
    return null;
  }

  bool isSameMonth() {
    final now = DateTime.now();
    if (this == null) return false;
    final date = DateTime.parse(this!);
    return date.year == now.year && date.month == now.month;
  }

  bool isBeforeMonth() {
    final now = DateTime.now();
    if (this == null) return false;
    final date = DateTime.parse(this!);

    return date.year < now.year || (date.year == now.year && date.month < now.month);
  }

  bool isAfterMonth() {
    final now = DateTime.now();
    if (this == null) return false;
    final date = DateTime.parse(this!);
    return date.year > now.year || (date.year == now.year && date.month > now.month);
  }
}
