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
