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
