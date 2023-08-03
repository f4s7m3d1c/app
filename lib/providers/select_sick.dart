import 'package:equatable/equatable.dart';
import 'package:fastmedic/models/Sick.dart';
import 'package:flutter/material.dart';

class SelectSickState extends Equatable{
  final List<Sick> selects;

  const SelectSickState({required this.selects});

  factory SelectSickState.initial() {
    return const SelectSickState(selects: []);
  }

  @override
  List<Object> get props => [selects];

  @override
  bool get stringify => true;

  SelectSickState copyWith({
    List<Sick>? selects,
  }) {
    return SelectSickState(
      selects: selects ?? this.selects,
    );
  }
}

class SelectSick with ChangeNotifier{
  SelectSickState _state = SelectSickState.initial();

  SelectSickState get state => _state;

  void addSelect(Sick sick) {
    final List<Sick> newSelects = [..._state.selects, sick];
    _state = _state.copyWith(selects: newSelects);
    notifyListeners();
  }

  void removeSelect(Sick sick) {
    final List<Sick> newSelects = _state.selects..remove(sick);
    _state = _state.copyWith(selects: newSelects);
    notifyListeners();
  }

  void clear() {
    _state = SelectSickState.initial();
    notifyListeners();
  }
}