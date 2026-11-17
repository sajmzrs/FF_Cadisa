import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// DSL app state borradorAgenda
  BorradorAgendaStruct _borradorAgenda = BorradorAgendaStruct();
  BorradorAgendaStruct get borradorAgenda => _borradorAgenda;
  set borradorAgenda(BorradorAgendaStruct value) {
    _borradorAgenda = value;
  }

  void updateBorradorAgendaStruct(Function(BorradorAgendaStruct) updateFn) {
    updateFn(_borradorAgenda);
  }
}
