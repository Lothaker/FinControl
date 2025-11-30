import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _saldoAtual = prefs.getDouble('ff_saldoAtual') ?? _saldoAtual;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _saldoInical = 0.0;
  double get saldoInical => _saldoInical;
  set saldoInical(double value) {
    _saldoInical = value;
  }

  double _saldoAtual = 0.0;
  double get saldoAtual => _saldoAtual;
  set saldoAtual(double value) {
    _saldoAtual = value;
    prefs.setDouble('ff_saldoAtual', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
