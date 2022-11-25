import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
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
    secureStorage = FlutterSecureStorage();
    _selectedDate = await secureStorage.read(key: 'ff_selectedDate') != null
        ? DateTime.fromMillisecondsSinceEpoch(
            (await secureStorage.getInt('ff_selectedDate'))!)
        : null;
    _resDate = await secureStorage.read(key: 'ff_resDate') != null
        ? DateTime.fromMillisecondsSinceEpoch(
            (await secureStorage.getInt('ff_resDate'))!)
        : null;
    _currentUserToken = await secureStorage.getString('ff_currentUserToken') ??
        _currentUserToken;
    _currentUserEmail = await secureStorage.getString('ff_currentUserEmail') ??
        _currentUserEmail;
    _currentUserName =
        await secureStorage.getString('ff_currentUserName') ?? _currentUserName;
    _currentUserRoles =
        await secureStorage.getStringList('ff_currentUserRoles') ??
            _currentUserRoles;
    _cartsum = await secureStorage.getDouble('ff_cartsum') ?? _cartsum;
    _token = await secureStorage.getString('ff_token') ?? _token;
    _usercart = (await secureStorage.getStringList('ff_usercart'))
            ?.map((path) => path.ref)
            .toList() ??
        _usercart;
    _itemcount = await secureStorage.getInt('ff_itemcount') ?? _itemcount;
    _itemqty = (await secureStorage.getStringList('ff_itemqty'))
            ?.map(int.parse)
            .toList() ??
        _itemqty;
  }

  late FlutterSecureStorage secureStorage;

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
    secureStorage.setInt('ff_selectedDate', _value.millisecondsSinceEpoch);
  }

  void deleteSelectedDate() {
    secureStorage.delete(key: 'ff_selectedDate');
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
    secureStorage.setInt('ff_resDate', _value.millisecondsSinceEpoch);
  }

  void deleteResDate() {
    secureStorage.delete(key: 'ff_resDate');
  }

  int resCustomerId = 0;

  dynamic editReservation;

  dynamic editCustomer;

  String _currentUserToken = '';
  String get currentUserToken => _currentUserToken;
  set currentUserToken(String _value) {
    _currentUserToken = _value;
    secureStorage.setString('ff_currentUserToken', _value);
  }

  void deleteCurrentUserToken() {
    secureStorage.delete(key: 'ff_currentUserToken');
  }

  String _currentUserEmail = '';
  String get currentUserEmail => _currentUserEmail;
  set currentUserEmail(String _value) {
    _currentUserEmail = _value;
    secureStorage.setString('ff_currentUserEmail', _value);
  }

  void deleteCurrentUserEmail() {
    secureStorage.delete(key: 'ff_currentUserEmail');
  }

  String _currentUserName = '';
  String get currentUserName => _currentUserName;
  set currentUserName(String _value) {
    _currentUserName = _value;
    secureStorage.setString('ff_currentUserName', _value);
  }

  void deleteCurrentUserName() {
    secureStorage.delete(key: 'ff_currentUserName');
  }

  List<String> _currentUserRoles = [];
  List<String> get currentUserRoles => _currentUserRoles;
  set currentUserRoles(List<String> _value) {
    _currentUserRoles = _value;
    secureStorage.setStringList('ff_currentUserRoles', _value);
  }

  void deleteCurrentUserRoles() {
    secureStorage.delete(key: 'ff_currentUserRoles');
  }

  void addToCurrentUserRoles(String _value) {
    _currentUserRoles.add(_value);
    secureStorage.setStringList('ff_currentUserRoles', _currentUserRoles);
  }

  void removeFromCurrentUserRoles(String _value) {
    _currentUserRoles.remove(_value);
    secureStorage.setStringList('ff_currentUserRoles', _currentUserRoles);
  }

  int selectedOrderTable = 0;

  double VacancyRate = 0;

  int UnallocatedReservations = 0;

  int AvaliableTables = 0;

  double _cartsum = 0.0;
  double get cartsum => _cartsum;
  set cartsum(double _value) {
    _cartsum = _value;
    secureStorage.setDouble('ff_cartsum', _value);
  }

  void deleteCartsum() {
    secureStorage.delete(key: 'ff_cartsum');
  }

  String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay14cXJoMUBvbmUtYnV0dG9uLTYzZmY5LmlhbS5nc2VydmljZWFjY291bnQuY29tIiwianRpIjoiNWYyYjM1YWEtZDgxNC00MTRjLTkyYjctZDVmY2Q4ZTRiODY1IiwiaWF0Ijo2MzgwNDgwMjU5NzQwNDI4OTMsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJhZG1pbiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6ImFAYS5jb20iLCJlbWFpbCI6ImFAYS5jb20iLCJkaXNwbGF5X25hbWUiOiJhZG1pbiIsInVpZCI6Ijc2YzMwODQ3LWY2NGUtNGFlMS1iNDY1LWZhOTMyYmYxOWFjNCIsImNyZWF0ZWRfdGltZSI6IjExLzIzLzIwMjIgMTI6MTY6MzcgUE0iLCJwaG90b191cmwiOiIiLCJwaG9uZV9udW1iZXIiOiIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOlsiQWRtaW4iLCJVc2VyIl0sImV4cCI6MTY2OTI5MjE5NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MDAwIiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo0MjAwIn0.VNUjEKxWCcAnizkEDowNmnXOyh5II-UXrjDljHLbNIc';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    secureStorage.setString('ff_token', _value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  List<DocumentReference> _usercart = [];
  List<DocumentReference> get usercart => _usercart;
  set usercart(List<DocumentReference> _value) {
    _usercart = _value;
    secureStorage.setStringList(
        'ff_usercart', _value.map((x) => x.path).toList());
  }

  void deleteUsercart() {
    secureStorage.delete(key: 'ff_usercart');
  }

  void addToUsercart(DocumentReference _value) {
    _usercart.add(_value);
    secureStorage.setStringList(
        'ff_usercart', _usercart.map((x) => x.path).toList());
  }

  void removeFromUsercart(DocumentReference _value) {
    _usercart.remove(_value);
    secureStorage.setStringList(
        'ff_usercart', _usercart.map((x) => x.path).toList());
  }

  int _itemcount = 0;
  int get itemcount => _itemcount;
  set itemcount(int _value) {
    _itemcount = _value;
    secureStorage.setInt('ff_itemcount', _value);
  }

  void deleteItemcount() {
    secureStorage.delete(key: 'ff_itemcount');
  }

  List<int> _itemqty = [];
  List<int> get itemqty => _itemqty;
  set itemqty(List<int> _value) {
    _itemqty = _value;
    secureStorage.setStringList(
        'ff_itemqty', _value.map((x) => x.toString()).toList());
  }

  void deleteItemqty() {
    secureStorage.delete(key: 'ff_itemqty');
  }

  void addToItemqty(int _value) {
    _itemqty.add(_value);
    secureStorage.setStringList(
        'ff_itemqty', _itemqty.map((x) => x.toString()).toList());
  }

  void removeFromItemqty(int _value) {
    _itemqty.remove(_value);
    secureStorage.setStringList(
        'ff_itemqty', _itemqty.map((x) => x.toString()).toList());
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
