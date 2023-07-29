import 'package:equatable/equatable.dart';
import 'package:fastmedic/models/Sick.dart';
import 'package:flutter/material.dart';

class _SelectSickState extends Equatable{
  final List<Sick> selects;

  const _SelectSickState({required this.selects});

  factory _SelectSickState.initial() {
    return const _SelectSickState(selects: []);
  }

  @override
  List<Object?> get props => [selects];

  @override
  bool? get stringify => true;

  String get selects2str {
    String str = "";
    int count = selects.length;
    for(int i = 0; i < count; i++){
      str += selects[i].toKorean();
      if(i == count - 1) {
        str += ", ";
      }
    }
    return str;
  }

  _SelectSickState copyWith({
    List<Sick>? selects,
  }) {
    return _SelectSickState(
      selects: selects ?? this.selects,
    );
  }
}

class SelectSick with ChangeNotifier{
  _SelectSickState _state = _SelectSickState.initial();

  _SelectSickState get state => _state;

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
    _state = _SelectSickState.initial();
    notifyListeners();
  }
}