import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Valet API Group Code

class ValetAPIGroup {
  static String baseUrl = 'https://valetapi.azurewebsites.net/api';
  static Map<String, String> headers = {
    'content-type': 'application/json; charset=utf-8; v=1.0',
  };
  static NewAreaCall newAreaCall = NewAreaCall();
  static NewSittingCall newSittingCall = NewSittingCall();
  static NewReservationCall newReservationCall = NewReservationCall();
  static GETSittingTypesByDateCall gETSittingTypesByDateCall =
      GETSittingTypesByDateCall();
  static GETAreasBySittingIDCall gETAreasBySittingIDCall =
      GETAreasBySittingIDCall();
  static GETSittingTypesCall gETSittingTypesCall = GETSittingTypesCall();
}

class NewAreaCall {
  Future<ApiCallResponse> call({
    String? areaName = '',
    String? areaDescription = '',
    int? areaNumTables,
    int? areaTableCap,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class NewSittingCall {
  Future<ApiCallResponse> call({
    String? sittingName = '',
    String? sittingStartTime = '',
    String? sittingEndTime = '',
    int? sittingCapacity,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
    int? venue = 1,
    int? resSittingId,
    String? resTime = '',
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
  "dateTime": "${resDate}T${resTime}",
  "duration": 90,
  "noGuests": ${resNumPeople},
  "notes": "${resNotes}",
  "venue": ${venue}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NewReservation',
      apiUrl: '${ValetAPIGroup.baseUrl}/reservations',
      callType: ApiCallType.POST,
      headers: {
        ...ValetAPIGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GETSittingTypesByDateCall {
  Future<ApiCallResponse> call({
    String? date = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Sitting Types by Date',
      apiUrl: '${ValetAPIGroup.baseUrl}/sittings',
      callType: ApiCallType.GET,
      headers: {
        ...ValetAPIGroup.headers,
      },
      params: {
        'date': date,
      },
      returnBody: true,
    );
  }

  dynamic sittings(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
  dynamic sittingId(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic sittingType(dynamic response) => getJsonField(
        response,
        r'''$[:].type''',
        true,
      );
  dynamic sittingStartTime(dynamic response) => getJsonField(
        response,
        r'''$[:].startTime''',
        true,
      );
  dynamic getAreas(dynamic response) => getJsonField(
        response,
        r'''$[*].areas''',
        true,
      );
  dynamic areaBySitting(dynamic response) => getJsonField(
        response,
        r'''$[:].areas''',
        true,
      );
}

class GETAreasBySittingIDCall {
  Future<ApiCallResponse> call({
    int? sittingId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Areas by Sitting ID',
      apiUrl: '${ValetAPIGroup.baseUrl}/areas',
      callType: ApiCallType.GET,
      headers: {
        ...ValetAPIGroup.headers,
      },
      params: {
        'sittingId': sittingId,
      },
      returnBody: true,
    );
  }

  dynamic areaName(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
  dynamic areaDescription(dynamic response) => getJsonField(
        response,
        r'''$[:].description''',
        true,
      );
  dynamic areaId(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic areaSittingsStartTime(dynamic response) => getJsonField(
        response,
        r'''$[:].sittings[:].startTime''',
        true,
      );
}

class GETSittingTypesCall {
  Future<ApiCallResponse> call({
    String? date = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Sitting Types',
      apiUrl: '${ValetAPIGroup.baseUrl}/sittings/types',
      callType: ApiCallType.GET,
      headers: {
        ...ValetAPIGroup.headers,
      },
      params: {
        'date': date,
      },
      returnBody: true,
    );
  }

  dynamic body(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

/// End Valet API Group Code

class GETReservationsCall {
  static Future<ApiCallResponse> call({
    String? minDate = '',
    String? maxDate = '',
    String? date = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Reservations',
      apiUrl: 'https://valetapi.azurewebsites.net/api/reservations',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json; charset=utf-8; v=1.0',
      },
      params: {
        'Date': date,
      },
      returnBody: true,
    );
  }

  static dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$[:].customer.firstName''',
        true,
      );
  static dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$[:].customer.lastName''',
        true,
      );
  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$[:].customer.phone''',
        true,
      );
  static dynamic notes(dynamic response) => getJsonField(
        response,
        r'''$[:].notes''',
        true,
      );
  static dynamic reservationStartDateTime(dynamic response) => getJsonField(
        response,
        r'''$[:].dateTime''',
        true,
      );
  static dynamic reservationDuration(dynamic response) => getJsonField(
        response,
        r'''$[:].duration''',
        true,
      );
  static dynamic source(dynamic response) => getJsonField(
        response,
        r'''$[:].source''',
        true,
      );
  static dynamic lastNameOrig(dynamic response) => getJsonField(
        response,
        r'''$..lastName''',
        true,
      );
  static dynamic reservation(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      );
  static dynamic byBreakfastSitting(dynamic response) => getJsonField(
        response,
        r'''$[?(@.sitting.type=="Breakfast")]''',
        true,
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$[:].customer.email''',
        true,
      );
  static dynamic numGuests(dynamic response) => getJsonField(
        response,
        r'''$[:].noGuests''',
        true,
      );
  static dynamic sittingType(dynamic response) => getJsonField(
        response,
        r'''$[:].sitting.type''',
        true,
      );
  static dynamic isVip(dynamic response) => getJsonField(
        response,
        r'''$[:].customer.isVip''',
      );
}

class GETTablesAvailableBySittingIDCall {
  static Future<ApiCallResponse> call({
    int? selectedSittingId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Tables Available By Sitting ID',
      apiUrl:
          'https://valetapi.azurewebsites.net/api/sittings/${selectedSittingId}/tables?Available=true',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json; charset=utf-8; v=1.0',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic sittingType(dynamic response) => getJsonField(
        response,
        r'''$[:].type''',
        true,
      );
  static dynamic tableId(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  static dynamic capacity(dynamic response) => getJsonField(
        response,
        r'''$[:].capacity''',
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
