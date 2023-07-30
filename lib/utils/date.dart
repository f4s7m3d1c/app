String twoDigits(int n) => n >= 10 ? "$n" : "0$n";

String dateFormat(DateTime date)
  => "${date.year}.${twoDigits(date.month)}.${twoDigits(date.day)}.${twoDigits(date.hour)}.${twoDigits(date.minute)}";