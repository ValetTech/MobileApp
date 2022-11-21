import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
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
    _selectedDate = prefs.containsKey('ff_selectedDate')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_selectedDate')!)
        : null;
    _resDate = prefs.containsKey('ff_resDate')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_resDate')!)
        : null;
    _currentUserToken =
        prefs.getString('ff_currentUserToken') ?? _currentUserToken;
    _currentUserEmail =
        prefs.getString('ff_currentUserEmail') ?? _currentUserEmail;
    _currentUserName =
        prefs.getString('ff_currentUserName') ?? _currentUserName;
    _currentUserRoles =
        prefs.getStringList('ff_currentUserRoles') ?? _currentUserRoles;
    _apiToken = prefs.getString('ff_apiToken') ?? _apiToken;
    _cartsum = prefs.getDouble('ff_cartsum') ?? _cartsum;
    _cart = prefs.getStringList('ff_cart')?.map((path) => path.ref).toList() ??
        _cart;
  }

  late SharedPreferences prefs;

  int selectedSittingId = 0;

  String newAreaName = '';

  String newAreaDescription = '';

  int NewAreaNumTables = 0;

  int newAreaTableCap = 0;

  int resNumPeople = 0;

  String resArea = '';

  String resSitting = '';

  String resFirstName = '';

  String resLastName = '';

  String resEmail = '';

  String resNotes = '';

  List<String> sittingTypes = ['Breakfast', 'Lunch', 'Dinner', 'Custom'];

  int resSittingId = 0;

  bool filtersOn = false;

  String resPhone = '';

  String resTime = '';

  dynamic selectedSittingJSON;

  String defaultSittingValue = 'No Sittings Available';

  bool isNull = false;

  List<dynamic> EmptyReservation = [
    jsonDecode(
        '{\"id\":1,\"customerId\":1,\"customer\":{\"id\":1,\"firstName\":\"FUCK\",\"lastName\":\"FUCK\",\"email\":\"FUCK.FUCK@FUCK.FUCK\",\"phone\":\"FUCK\",\"isVip\":false,\"fullName\":\"FUCK FUCK\"},\"sittingId\":111,\"sitting\":{\"id\":111,\"capacity\":12,\"type\":\"Breakfast\",\"startTime\":\"2022-12-25T10:30:00\",\"endTime\":\"2022-12-25T12:30:00\",\"venueId\":1},\"dateTime\":\"2022-10-15T14:00:00\",\"duration\":90,\"noGuests\":2,\"source\":\"Website\",\"status\":\"Pending\",\"notes\":\"FUCK FUCK FUCK\",\"tables\":[]}')
  ];

  String pendingString = 'Pending';

  dynamic emptArray = jsonDecode('[]');

  bool isVIP = false;

  int resDuration = 0;

  List<String> sourceOptions = ['Website', 'In-person', 'Email', 'Phone'];

  String resStatus = '';

  DateTime? _selectedDate = DateTime.fromMillisecondsSinceEpoch(1667567100000);
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    if (_value == null) {
      return;
    }
    _selectedDate = _value;
    prefs.setInt('ff_selectedDate', _value.millisecondsSinceEpoch);
  }

  int resAreaId = 0;

  String selectedChipString = '';

  DateTime? _resDate = DateTime.fromMillisecondsSinceEpoch(1667871540000);
  DateTime? get resDate => _resDate;
  set resDate(DateTime? _value) {
    if (_value == null) {
      return;
    }
    _resDate = _value;
    prefs.setInt('ff_resDate', _value.millisecondsSinceEpoch);
  }

  int resCustomerId = 0;

  dynamic editReservation;

  dynamic editCustomer;

  String _currentUserToken = '';
  String get currentUserToken => _currentUserToken;
  set currentUserToken(String _value) {
    _currentUserToken = _value;
    prefs.setString('ff_currentUserToken', _value);
  }

  String _currentUserEmail = '';
  String get currentUserEmail => _currentUserEmail;
  set currentUserEmail(String _value) {
    _currentUserEmail = _value;
    prefs.setString('ff_currentUserEmail', _value);
  }

  String _currentUserName = '';
  String get currentUserName => _currentUserName;
  set currentUserName(String _value) {
    _currentUserName = _value;
    prefs.setString('ff_currentUserName', _value);
  }

  List<String> _currentUserRoles = [];
  List<String> get currentUserRoles => _currentUserRoles;
  set currentUserRoles(List<String> _value) {
    _currentUserRoles = _value;
    prefs.setStringList('ff_currentUserRoles', _value);
  }

  void addToCurrentUserRoles(String _value) {
    _currentUserRoles.add(_value);
    prefs.setStringList('ff_currentUserRoles', _currentUserRoles);
  }

  void removeFromCurrentUserRoles(String _value) {
    _currentUserRoles.remove(_value);
    prefs.setStringList('ff_currentUserRoles', _currentUserRoles);
  }

  int selectedOrderTable = 0;

  String _apiToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU';
  String get apiToken => _apiToken;
  set apiToken(String _value) {
    _apiToken = _value;
    prefs.setString('ff_apiToken', _value);
  }

  double VacancyRate = 0;

  int UnallocatedReservations = 0;

  int AvaliableTables = 0;

  double _cartsum = 0.0;
  double get cartsum => _cartsum;
  set cartsum(double _value) {
    _cartsum = _value;
    prefs.setDouble('ff_cartsum', _value);
  }

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> _value) {
    _cart = _value;
    prefs.setStringList('ff_cart', _value.map((x) => x.path).toList());
  }

  void addToCart(DocumentReference _value) {
    _cart.add(_value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference _value) {
    _cart.remove(_value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
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
