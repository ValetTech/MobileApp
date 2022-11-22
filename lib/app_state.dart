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
    _cart = (await secureStorage.getStringList('ff_cart'))
            ?.map((path) => path.ref)
            .toList() ??
        _cart;
    _token = await secureStorage.getString('ff_token') ?? _token;
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

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> _value) {
    _cart = _value;
    secureStorage.setStringList('ff_cart', _value.map((x) => x.path).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_cart');
  }

  void addToCart(DocumentReference _value) {
    _cart.add(_value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference _value) {
    _cart.remove(_value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    secureStorage.setString('ff_token', _value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
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
