import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

durationToHms(Duration duration) {
  int totalHours = duration.inHours;
  int totalMinutes = duration.inMinutes;
  int totalSeconds = duration.inSeconds;

  int minutes = totalMinutes % 60;
  int seconds = totalSeconds % 60;

  return "${totalHours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
}



TimeOfDay stringToTimeOfDay(String tod) {
  final format = DateFormat.jm(); //"6:00 AM"
  return TimeOfDay.fromDateTime(format.parse(tod));
}


durationToHoursDouble(Duration duration) {
  int totalMinutes = duration.inMinutes;
  double hours = 0;
  hours = totalMinutes / 60;
  return hours;
}

durationToMs(Duration duration) {
  if (duration == Duration.zero) return "00:00";

  int totalMinutes = duration.inMinutes;
  int totalSeconds = duration.inSeconds;

  int minutes = totalMinutes % 60;
  int seconds = totalSeconds % 60;

  return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
}


timeStringToDateTime(String time) {
  String hour = time.split(':').first;
  String minutes = time.split(":").last;
  DateTime now = DateTime.now();
  DateTime dateTime = DateTime(
      now.year, now.month, now.day, int.parse(hour), int.parse(minutes));
  return dateTime;
}

obscurePhoneNumber(String phoneNumber) {
  return phoneNumber.replaceRange(0, 6, "******");
}

String dateTimeToString(DateTime dateTime) {
  return DateFormat("dd-MM-yyyy").format(dateTime);
}

String dateRangeToString(DateTimeRange dateTime) {
  final startDate = DateFormat("dd-MM-yyyy").format(dateTime.start);
  final endDate = DateFormat("dd-MM-yyyy").format(dateTime.end);
  return startDate + " - " + endDate;
}

String dateTimeToDateTimeString(DateTime dateTime) {
  return DateFormat("dd-MM-yyyy  hh:mm aa").format(dateTime);
}

DateTime ddmmyyyToDateTime(String date) {
  final String day = date.split("-")[0];
  final String month = date.split("-")[1];
  final String year = date.split("-")[2];

  return DateTime(int.parse(year), int.parse(month), int.parse(day));
}

String dateFieldFromDateTime(DateTime dateTime) {
  return DateFormat("yyyy-MM-DD").format(dateTime);
}

Duration parseDuration(String s) {
  int hours = 0;
  int minutes = 0;
  int micros;
  List<String> parts = s.split(':');
  if (parts.length > 2) {
    hours = int.parse(parts[parts.length - 3]);
  }
  if (parts.length > 1) {
    minutes = int.parse(parts[parts.length - 2]);
  }
  micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
  return Duration(hours: hours, minutes: minutes, microseconds: micros);
}
