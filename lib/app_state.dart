import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

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
    _currentPage = prefs.getString('ff_currentPage') ?? _currentPage;
  }

  late SharedPreferences prefs;

  DateTime? selectedResDate;

  List<String> selectedResArea = ['Main', 'Outside', 'Upstairs'];

  DateTime? resMinDate;

  DateTime? resMaxDate;

  String _currentPage = '';
  String get currentPage => _currentPage;
  set currentPage(String _value) {
    _currentPage = _value;
    prefs.setString('ff_currentPage', _value);
  }

  int selectedSittingId = 0;
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
