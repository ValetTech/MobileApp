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

  bool isNull = false;

  List<dynamic> EmptyReservation = [
    jsonDecode(
        '{\"id\":1,\"customerId\":1,\"customer\":{\"id\":1,\"firstName\":\"FUCK\",\"lastName\":\"FUCK\",\"email\":\"FUCK.FUCK@FUCK.FUCK\",\"phone\":\"FUCK\",\"isVip\":false,\"fullName\":\"FUCK FUCK\"},\"sittingId\":111,\"sitting\":{\"id\":111,\"capacity\":12,\"type\":\"Breakfast\",\"startTime\":\"2022-12-25T10:30:00\",\"endTime\":\"2022-12-25T12:30:00\",\"venueId\":1},\"dateTime\":\"2022-10-15T14:00:00\",\"duration\":90,\"noGuests\":2,\"source\":\"Website\",\"status\":\"Pending\",\"notes\":\"FUCK FUCK FUCK\",\"tables\":[]}')
  ];

  String pendingString = 'Pending';

  dynamic emptArray = jsonDecode('[]');

  bool isVIP = false;
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
