import 'package:fastmedic/extensions/sick2str.dart';
import 'package:fastmedic/models/sick.dart';
import 'package:fastmedic/utils/date.dart';
import 'package:uuid/uuid.dart';

class Log {
  final String id;
  final String date;
  final String keywords;
  final String description;
  final String result;

  const Log({
    required this.id,
    required this.date,
    required this.keywords,
    required this.description,
    required this.result,
  });

  factory Log.create({
    required List<Sick> keywords,
    required String description,
    required String result,
  }) {
    DateTime dateTime = DateTime.now();
    final String id = const Uuid().v5(
      Uuid.NAMESPACE_NIL,
      "${dateTime.millisecondsSinceEpoch}-$keywords",
    );
    final String date = dateFormat(dateTime);
    return Log(
      id: id,
      date: date,
      keywords: keywords.parse(),
      description: description,
      result: result,
    );
  }
}
