import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String formatReservationTime(String? dateTime) {
  // Add your function code here!
  return DateFormat.jm()
      .format(DateTime.parse(dateTime ?? DateTime.now().toString()));
}

String formatReservationDate(String? dateTime) {
  // Add your function code here!
  return DateFormat('dd MMM • hh:mm aaa')
      .format(DateTime.parse(dateTime ?? DateTime.now().toString()));
}

String formatDateTimeForPOST(DateTime dateTime) {
  // take a timestamp and return a string in the format 2022-12-25T10:30:00
  String formatForPOST = DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTime);
  return formatForPOST;
}

String formatDateForPOST(DateTime dateTime) {
  // take a timestamp and return a string in the format 2022-12-25T10:30:00
  String formatForPOST = DateFormat('yyyy-MM-dd').format(dateTime);
  return formatForPOST;
}

String formatTimeForPOST(DateTime resTime) {
  // take a timestamp and return a string in the format 2022-12-25T10:30:00
  String formatForPOST = DateFormat('HH:MM').format(resTime);
  return formatForPOST;
}

List<String> getSittingTypes(List<String>? sittingTypes) {
  // Add your function code here!
  if (sittingTypes == null || sittingTypes.isEmpty) {
    return ["No Sittings Avaliable"];
  }
  return sittingTypes;
}

String resSittingIdToString(int resSittingId) {
  // convert the int to string
  String resSittingIdString = resSittingId.toString();
  return resSittingIdString;
}

List<dynamic> getAreasBySittingId(
  List<dynamic> allAreas,
  int? sittingId,
) {
  // Add your function code here!

  List<dynamic>? areas = allAreas; //.map((x)=>jsonDecode(x));
  if (allAreas.isEmpty || allAreas[0] == null) {
    return [];
  }
  if (sittingId != null && sittingId != 0) {
    try {
      areas = areas
          .where((i) => i['sittings']?.map((s) => s['id'])?.contains(sittingId))
          .toList();
    } catch (err) {
      return [];
    }
  }
  if (areas.isEmpty) {
    return [];
  }

  return areas;
}

List<String> mapListToString(List<int>? listNumbers) {
  // Add your function code here!
  listNumbers ??= [];
  return listNumbers.map((e) => e.toString()).toList();
}

String formatDateTimestampsforNewResPOST(
  DateTime? resDate,
  String? resTime,
) {
  // convert the dateTime variable resDate into a string in the format  'yyyy-MM-dd'
  String resDateStr = DateFormat('yyyy-MM-dd').format(resDate!);
  // convert the string variable resTime from the format 'h:mm a' into a string in the format  'HH:mm:ss'
  String resTimeStr =
      DateFormat('HH:mm:ss').format(DateFormat('h:mm a').parse(resTime!));
  // concatenate the two strings into one string in the format 'yyyy-MM-ddTHH:mm:ss'
  String resDateTimeStr = resDateStr + 'T' + resTimeStr + 'Z';
  return resDateTimeStr;
}

int stringToInt(String? value) {
  // Add your function code here!
  return int.tryParse(value ?? "-1") ?? -1;
}

int getSittingIdByType(
  String? type,
  List<dynamic> sittings,
) {
  // Add your function code here!
  var sitting =
      sittings.firstWhere((s) => s["type"] == type, orElse: () => null);
  return sitting["id"] ?? -1;
}

int getAreaIdByName(
  String? name,
  List<dynamic> areas,
) {
  // Add your function code here!
  var area = areas.firstWhere((s) => s["name"] == name, orElse: () => null);
  return area["id"] ?? -1;
}

String listJoin(List<String>? values) {
  // Add your function code here!
  return values?.join(',') ?? "";
}

dynamic updateJson(
  String? path,
  String? value,
  dynamic json,
) {
  // Add your function code here!
  var newJson = json;
  newJson[path ?? ""] = value ?? "";
  return newJson;
}

int getTableIdByType(
  String? type,
  List<dynamic> tables,
) {
  // Add your function code here!
  return tables.where((table) => table["type"] == (type ?? "")).first["id"] ??
      0;
}

double getPercentage(
  int? numerator,
  int? denominator,
) {
  // Add your function code here!
  var result = (numerator ?? 0) / (denominator ?? 0);
  return result > 1 ? 0 : result;
}

int arrayCount(List<dynamic> array) {
  // Add your function code here!

  if (array == null) return 0;
  return array.length;
}

double returncartprice(double value) {
  return value * -1;
}

List<DateTime>? sessionTimes() {
  var times = <DateTime>[];
  var time = DateTime(2019, 1, 1, 9);
  while (time.hour < 23) {
    times.add(time);
    time = time.add(Duration(minutes: 30));
  }
  return times;
}

double pricexqty(
  double price,
  int qty,
) {
  return price * qty;
}
