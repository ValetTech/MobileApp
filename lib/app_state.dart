import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _NullValue = prefs.getString('ff_NullValue') ?? _NullValue;
    if (prefs.containsKey('ff_empty204JSON')) {
      try {
        _empty204JSON = jsonDecode(prefs.getString('ff_empty204JSON') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }
  }

  late SharedPreferences prefs;

  DateTime? resMinDate;

  DateTime? resMaxDate;

  int selectedSittingId = 0;

  String newAreaName = '';

  String newAreaDescription = '';

  int NewAreaNumTables = 0;

  int newAreaTableCap = 0;

  int resNumPeople = 0;

  DateTime? resDate = DateTime.fromMillisecondsSinceEpoch(1666224960000);

  String resArea = '';

  String resSitting = '';

  String resFirstName = '';

  String resLastName = '';

  String resEmail = '';

  String resNotes = '';

  DateTime? selectedDate;

  List<String> sittingTypes = ['Breakfast', 'Lunch', 'Dinner', 'Custom'];

  int resSittingId = 0;

  bool filtersOn = false;

  String resPhone = '';

  String resTime = '';

  dynamic selectedSittingJSON;

  String defaultSittingValue = 'No Sittings Available';

  String _NullValue = '';
  String get NullValue => _NullValue;
  set NullValue(String _value) {
    _NullValue = _value;
    prefs.setString('ff_NullValue', _value);
  }

  dynamic _empty204JSON = jsonDecode('{}');
  dynamic get empty204JSON => _empty204JSON;
  set empty204JSON(dynamic _value) {
    _empty204JSON = _value;
    prefs.setString('ff_empty204JSON', jsonEncode(_value));
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
