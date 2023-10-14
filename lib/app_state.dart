import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
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

  String _verificationPhoneNumber = '';
  String get verificationPhoneNumber => _verificationPhoneNumber;
  set verificationPhoneNumber(String _value) {
    _verificationPhoneNumber = _value;
  }

  DocumentReference? _verifiedUser;
  DocumentReference? get verifiedUser => _verifiedUser;
  set verifiedUser(DocumentReference? _value) {
    _verifiedUser = _value;
  }

  DocumentReference? _cart;
  DocumentReference? get cart => _cart;
  set cart(DocumentReference? _value) {
    _cart = _value;
  }

  int _numCartItems = 0;
  int get numCartItems => _numCartItems;
  set numCartItems(int _value) {
    _numCartItems = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
