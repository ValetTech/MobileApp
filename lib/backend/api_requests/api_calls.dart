import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Valet API Group Code

class ValetAPIGroup {
  static String baseUrl = 'https://valetapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'X-Version': '2',
  };
  static NewAreaCall newAreaCall = NewAreaCall();
  static NewSittingCall newSittingCall = NewSittingCall();
  static NewReservationCall newReservationCall = NewReservationCall();
  static GETSittingTypesByDateCall gETSittingTypesByDateCall =
      GETSittingTypesByDateCall();
  static GETAreasBySittingIDCall gETAreasBySittingIDCall =
      GETAreasBySittingIDCall();
  static GETSittingTypesCall gETSittingTypesCall = GETSittingTypesCall();
  static GETTablesCall gETTablesCall = GETTablesCall();
  static UpdateReservationCall updateReservationCall = UpdateReservationCall();
  static UpdateReservationStatusCall updateReservationStatusCall =
      UpdateReservationStatusCall();
  static UpdateCustomerCall updateCustomerCall = UpdateCustomerCall();
  static LoginUserCall loginUserCall = LoginUserCall();
  static PatchReservationCall patchReservationCall = PatchReservationCall();
  static PatchCustomerCall patchCustomerCall = PatchCustomerCall();
}

class NewAreaCall {
  Future<ApiCallResponse> call({
    String? areaName = '',
    String? areaDescription = '',
    int? areaNumTables,
    int? areaTableCap,
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    final body = '''
{
  "name": "${areaName}",
  "description": "${areaDescription}",
  "venueId": 1,
  "NoTables": ${areaNumTables},
  "TableCapacity": ${areaTableCap}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NewArea',
      apiUrl: '${ValetAPIGroup.baseUrl}/areas',
      callType: ApiCallType.POST,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class NewSittingCall {
  Future<ApiCallResponse> call({
    String? sittingName = '',
    String? sittingStartTime = '',
    String? sittingEndTime = '',
    int? sittingCapacity,
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    final body = '''
{
  "capacity": ${sittingCapacity},
  "type": "${sittingName}",
  "startTime": "${sittingStartTime}",
  "endTime": "${sittingEndTime}",
  "venueId": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NewSitting',
      apiUrl: '${ValetAPIGroup.baseUrl}/sittings',
      callType: ApiCallType.POST,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class NewReservationCall {
  Future<ApiCallResponse> call({
    int? resNumPeople,
    String? resArea = '',
    String? resSitting = '',
    String? resFirstName = '',
    String? resLastName = '',
    String? resEmail = '',
    String? resPhone = '',
    String? resNotes = '',
    String? resDate = '',
    String? resMinDate = '',
    String? resMaxDate = '',
    int? venueId = 1,
    int? resSittingId,
    String? resTime = '',
    int? customerId,
    String? resDateTimeFormatted = '',
    String? source = '',
    int? resAreaId,
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    final body = '''
{
  "customer": {
    "firstName": "${resFirstName}",
    "lastName": "${resLastName}",
    "email": "${resEmail}",
    "phone": "${resPhone}"
  },
  "sittingId": ${resSittingId},
  "areaId": ${resAreaId},
  "dateTime": "${resDateTimeFormatted}",
  "duration": 90,
  "noGuests": ${resNumPeople},
  "notes": "${resNotes}",
  "venueId": 1,
  "source": "Website",
  "status": "Pending"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NewReservation',
      apiUrl: '${ValetAPIGroup.baseUrl}/reservations',
      callType: ApiCallType.POST,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class GETSittingTypesByDateCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? sittingType = '',
    List<String>? areaNameList,
    int? sittingId,
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    final areaName = _serializeList(areaNameList);

    return ApiManager.instance.makeApiCall(
      callName: 'GET Sitting Types by Date',
      apiUrl: '${ValetAPIGroup.baseUrl}/sittings',
      callType: ApiCallType.GET,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'Date': date,
      },
      returnBody: true,
      cache: false,
    );
  }

  dynamic sittings(dynamic response) => getJsonField(
        response,
        r'''$.sittings''',
        true,
      );
  dynamic sittingId(dynamic response) => getJsonField(
        response,
        r'''$.sittings[:].id''',
        true,
      );
  dynamic sittingType(dynamic response) => getJsonField(
        response,
        r'''$.sittings[:].type''',
        true,
      );
  dynamic sittingStartTime(dynamic response) => getJsonField(
        response,
        r'''$.sittings[:].startTime''',
        true,
      );
  dynamic getAllAreas(dynamic response) => getJsonField(
        response,
        r'''$.sittings[:].areas''',
        true,
      );
  dynamic areaNames(dynamic response) => getJsonField(
        response,
        r'''$.sittings[:].areas[:].name''',
        true,
      );
  dynamic areasId(dynamic response) => getJsonField(
        response,
        r'''$.sittings[:].areas[:].id''',
        true,
      );
  dynamic reservations(dynamic response) => getJsonField(
        response,
        r'''$.sittings[:].reservations''',
        true,
      );
}

class GETAreasBySittingIDCall {
  Future<ApiCallResponse> call({
    int? sittingId,
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Areas by Sitting ID',
      apiUrl: '${ValetAPIGroup.baseUrl}/areas',
      callType: ApiCallType.GET,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'sittingId': sittingId,
      },
      returnBody: true,
      cache: false,
    );
  }

  dynamic areaName(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].name''',
        true,
      );
  dynamic areaDescription(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].description''',
        true,
      );
  dynamic sittingId(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].sittings[:].id''',
        true,
      );
  dynamic areaSittingsStartTime(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].sittings[:].startTime''',
        true,
      );
  dynamic areas(dynamic response) => getJsonField(
        response,
        r'''$.areas''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].id''',
        true,
      );
}

class GETSittingTypesCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Sitting Types',
      apiUrl: '${ValetAPIGroup.baseUrl}/sittings/types',
      callType: ApiCallType.GET,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'date': date,
      },
      returnBody: true,
      cache: false,
    );
  }

  dynamic body(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class GETTablesCall {
  Future<ApiCallResponse> call({
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Tables',
      apiUrl: '${ValetAPIGroup.baseUrl}/tables',
      callType: ApiCallType.GET,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }

  dynamic tables(dynamic response) => getJsonField(
        response,
        r'''$.tables''',
        true,
      );
  dynamic tableId(dynamic response) => getJsonField(
        response,
        r'''$.tables[:].id''',
        true,
      );
  dynamic tableType(dynamic response) => getJsonField(
        response,
        r'''$.tables[:].type''',
        true,
      );
  dynamic tableCapacity(dynamic response) => getJsonField(
        response,
        r'''$.tables[:].capacity''',
        true,
      );
  dynamic tableAreaId(dynamic response) => getJsonField(
        response,
        r'''$.tables[:].areaId''',
        true,
      );
  dynamic xPosition(dynamic response) => getJsonField(
        response,
        r'''$.tables[:].xPosition''',
        true,
      );
  dynamic yPosition(dynamic response) => getJsonField(
        response,
        r'''$.tables[:].yPosition''',
        true,
      );
}

class UpdateReservationCall {
  Future<ApiCallResponse> call({
    int? reservationId,
    int? customerId,
    bool? isVip = false,
    int? sittingId,
    String? dateTime = '',
    int? duration,
    int? noGuests,
    String? source = '',
    String? status = '',
    String? notes = '',
    int? areaId,
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    final body = '''
{
  "id": ${reservationId},
  "customerId": ${customerId},
  "sittingId": ${sittingId},
  "areaId": ${areaId},
  "dateTime": "${dateTime}",
  "duration": ${duration},
  "noGuests": ${noGuests},
  "source": "${source}",
  "venueId": 1,
  "status": "${status}",
  "notes": "${notes}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Reservation',
      apiUrl: '${ValetAPIGroup.baseUrl}/reservations/${reservationId}',
      callType: ApiCallType.PUT,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class UpdateReservationStatusCall {
  Future<ApiCallResponse> call({
    int? reservationId,
    int? customerId,
    int? areaId,
    int? sittingId,
    String? dateTime = '',
    int? noGuests,
    String? status = '',
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    final body = '''
{
  "id": ${reservationId},
  "customerId": ${customerId},
  "sittingId": ${sittingId},
  "dateTime": "${dateTime}",
  "noGuests": ${noGuests},
  "venueId": 1,
  "areaId": ${areaId},
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Reservation Status',
      apiUrl: '${ValetAPIGroup.baseUrl}/reservations/${reservationId}',
      callType: ApiCallType.PUT,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class UpdateCustomerCall {
  Future<ApiCallResponse> call({
    int? customerId,
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? phone = '',
    bool? isVip,
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    final body = '''
{
  "id": ${customerId},
  "firstName": "${firstName}",
  "lastName": "${lastName}",
  "email": "${email}",
  "phone": "${phone}",
  "isVip": ${isVip}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Customer',
      apiUrl: '${ValetAPIGroup.baseUrl}/customers/${customerId}',
      callType: ApiCallType.PUT,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login user',
      apiUrl: '${ValetAPIGroup.baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {
        ...ValetAPIGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }

  dynamic jWTToken(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  dynamic jWTExpiration(dynamic response) => getJsonField(
        response,
        r'''$.expiration''',
      );
}

class PatchReservationCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
    String? value = '',
    String? path = '',
    String? operation = 'replace',
  }) {
    final body = '''
[
  {
    "value": "${value}",
    "path": "${path}",
    "op": "${operation}"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Patch Reservation',
      apiUrl: '${ValetAPIGroup.baseUrl}/reservations/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class PatchCustomerCall {
  Future<ApiCallResponse> call({
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
    String? value = '',
    String? path = '',
    String? operation = 'replace',
    int? id,
  }) {
    final body = '''
[
  {
    "value": "${value}",
    "path": "${path}",
    "op": "${operation}"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Patch Customer',
      apiUrl: '${ValetAPIGroup.baseUrl}/customers/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        ...ValetAPIGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

/// End Valet API Group Code

class GETReservationsCall {
  static Future<ApiCallResponse> call({
    String? date = '',
    int? page,
    int? size,
    String? area = '',
    String? sitting = '',
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Reservations',
      apiUrl: 'https://valetapi.azurewebsites.net/api/reservations',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json',
        'X-Version': '2',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'Date': date,
        'Areas': area,
        'Sittings': sitting,
      },
      returnBody: true,
      cache: false,
    );
  }

  static dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].customer.firstName''',
        true,
      );
  static dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].customer.lastName''',
        true,
      );
  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].customer.phone''',
        true,
      );
  static dynamic notes(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].notes''',
        true,
      );
  static dynamic reservationStartDateTime(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].dateTime''',
        true,
      );
  static dynamic reservationDuration(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].duration''',
        true,
      );
  static dynamic source(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].source''',
        true,
      );
  static dynamic lastNameOrig(dynamic response) => getJsonField(
        response,
        r'''$..lastName''',
        true,
      );
  static dynamic reservations(dynamic response) => getJsonField(
        response,
        r'''$.reservations''',
        true,
      );
  static dynamic byBreakfastSitting(dynamic response) => getJsonField(
        response,
        r'''$.reservations[?(@.sitting.type=="Breakfast")]''',
        true,
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].customer.email''',
        true,
      );
  static dynamic numGuests(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].noGuests''',
        true,
      );
  static dynamic sittingType(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].sitting.type''',
        true,
      );
  static dynamic isVip(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].customer.isVip''',
        true,
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].status''',
        true,
      );
  static dynamic reservation(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
        true,
      );
  static dynamic tables(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].tables''',
        true,
      );
  static dynamic reservationId(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].id''',
        true,
      );
  static dynamic customerId(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].customer.id''',
        true,
      );
  static dynamic sittingId(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].sittingId''',
        true,
      );
  static dynamic areaId(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].area.id''',
        true,
      );
  static dynamic resAreaName(dynamic response) => getJsonField(
        response,
        r'''$.reservations[:].area.name''',
        true,
      );
}

class GETTablesAvailableBySittingIDCall {
  static Future<ApiCallResponse> call({
    int? selectedSittingId,
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhQGEuY29tIiwianRpIjoiNDQxMzA4NTEtMGRhMi00YTdmLThmMzYtMTJlMTJlYWI4NzI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIkFkbWluIiwiVXNlciJdLCJleHAiOjE3MDAwMTc3NTgsImlzcyI6ImZpcmViYXNlLWFkbWluc2RrLXhxcmgxQG9uZS1idXR0b24tNjNmZjkuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCJ9._hDXDG7CNocdMoX8BvP7n2f92XiAGFJj_dbZMJzXSaU',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Tables Available By Sitting ID',
      apiUrl:
          'https://valetapi.azurewebsites.net/api/sittings/${selectedSittingId}/tables?Available=true',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json; charset=utf-8;',
        'X-Version': '2',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }

  static dynamic sittingType(dynamic response) => getJsonField(
        response,
        r'''$.tables[:].type''',
        true,
      );
  static dynamic tableId(dynamic response) => getJsonField(
        response,
        r'''$.tables[:].id''',
        true,
      );
  static dynamic capacity(dynamic response) => getJsonField(
        response,
        r'''$.tables[:].capacity''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}
