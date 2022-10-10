import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GETReservationsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Reservations',
      apiUrl: 'https://valetapi.azurewebsites.net/api/reservations',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json; charset=utf-8; v=1.0',
      },
      params: {},
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
}

class GETSittingsCall {
  static Future<ApiCallResponse> call({
    String? selectedDate = '',
    int? selectedSittingId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Sittings',
      apiUrl: 'https://valetapi.azurewebsites.net/api/sittings',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json; charset=utf-8; v=1.0',
      },
      params: {
        'selectedDate': selectedDate,
        'selectedSittingId': selectedSittingId,
      },
      returnBody: true,
    );
  }

  static dynamic byBreakfastSitting(dynamic response) => getJsonField(
        response,
        r'''$[?(@.sitting.type=="Breakfast")]''',
        true,
      );
  static dynamic sittingType(dynamic response) => getJsonField(
        response,
        r'''$[:].type''',
        true,
      );
  static dynamic sittingStart(dynamic response) => getJsonField(
        response,
        r'''$[:].startTime''',
        true,
      );
  static dynamic sittingId(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
}

class GETTablesAvailableBySittingIDCall {
  static Future<ApiCallResponse> call({
    int? selectedSittingId = 0,
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

  static dynamic byBreakfastSitting(dynamic response) => getJsonField(
        response,
        r'''$[?(@.sitting.type=="Breakfast")]''',
        true,
      );
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
