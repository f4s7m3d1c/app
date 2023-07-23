import 'dart:math';

import 'package:equatable/equatable.dart';

class Vector2 extends Equatable{
  final double x;
  final double y;

  const Vector2({
    required this.x,
    required this.y
  });

  @override
  List<Object?> get props => [this.x, this.y];

  double distance(Vector2 vector) => sqrt(
      pow(x - vector.x, 2) + pow(y - vector.y, 2)
  );

  double distanceByNum(double x, double y) => distance(Vector2(x: x, y: y));
}