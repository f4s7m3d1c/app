import 'package:equatable/equatable.dart';
import 'package:fastmedic/database/log_database.dart';
import 'package:flutter/material.dart';

import '../models/log.dart';

class LogListState extends Equatable {
  final List<Log> logs;
  final bool isLoaded;

  const LogListState({required this.logs, required this.isLoaded});

  factory LogListState.initial() {
    return const LogListState(logs: [], isLoaded: false);
  }

  @override
  List<Object> get props => [logs, isLoaded];

  @override
  bool get stringify => true;

  LogListState copyWith({
    List<Log>? logs,
    bool? isLoaded,
  }) {
    return LogListState(
      logs: logs ?? this.logs,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

class LogList with ChangeNotifier {
  LogListState _state = LogListState.initial();

  LogListState get state => _state;

  void setLogs(List<Log> logs) {
    if (_state.isLoaded) return;
    _state = _state.copyWith(
      logs: logs,
      isLoaded: true,
    );
    notifyListeners();
  }

  void addLog(Log log) {
    LogDB.instance.addLog(log);
    _state = _state.copyWith(
      logs: [log, ..._state.logs],
    );
    notifyListeners();
  }

  void removeLog(Log log) {
    LogDB.instance.removeLog(log.id);
    _state = _state.copyWith(
      logs: _state.logs.where((lg) => lg.id != log.id).toList(),
    );
    notifyListeners();
  }
}
