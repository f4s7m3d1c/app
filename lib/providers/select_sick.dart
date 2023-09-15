import 'package:equatable/equatable.dart';
import 'package:fastmedic/models/sick.dart';
import 'package:flutter/material.dart';

class SelectSickState extends Equatable {
  final List<Sick> selects;

  final String description;

  const SelectSickState({required this.selects, required this.description});

  factory SelectSickState.initial() {
    return const SelectSickState(selects: [], description: "");
  }

  @override
  List<Object> get props => [selects, description];

  @override
  bool get stringify => true;

  SelectSickState copyWith({
    List<Sick>? selects,
    String? description,
  }) {
    return SelectSickState(
        selects: selects ?? this.selects,
        description: description ?? this.description);
  }
}

class SelectSick with ChangeNotifier {
  SelectSickState _state = SelectSickState.initial();

  SelectSickState get state => _state;

  void onClick(Sick sick) {
    final List<Sick> newSelects;
    if (_state.selects.contains(sick)) {
      newSelects = _state.selects..remove(sick);
    } else {
      newSelects = [..._state.selects, sick];
    }
    _state = _state.copyWith(selects: newSelects);
    notifyListeners();
  }

  void setDescription(String desc) {
    _state = _state.copyWith(description: desc);
    notifyListeners();
  }

  void clear() {
    _state = SelectSickState.initial();
    notifyListeners();
  }
}
