import 'package:fastmedic/extensions/to_int.dart';

String twoDigits(int n) => n >= 10 ? "$n" : "0$n";

String dateFormat(DateTime date) =>
    "${date.year}.${twoDigits(date.month)}.${twoDigits(date.day)}.${twoDigits(date.hour)}.${twoDigits(date.minute)}";

String dot2kor(String date) {
  List<String> words = date.split(".");
  final int year = words[0].toInt % 100;
  final int month = words[1].toInt;
  final int day = words[2].toInt;
  int hour = words[3].toInt;
  late final String hourParser;
  if (hour != 24 && hour > 11) {
    hour -= 12;
    if (hour == 0) {
      hour = 12;
    }
    hourParser = "오후 $hour";
  } else {
    if (hour == 24) {
      hour = 12;
    }
    hourParser = "오전 $hour";
  }
  final int minute = words[4].toInt;
  return "$year년 $month월 $day일 $hourParser시 $minute분";
}
