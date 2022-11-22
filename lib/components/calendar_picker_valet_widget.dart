import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarPickerValetWidget extends StatefulWidget {
  const CalendarPickerValetWidget({Key? key}) : super(key: key);

  @override
  _CalendarPickerValetWidgetState createState() =>
      _CalendarPickerValetWidgetState();
}

class _CalendarPickerValetWidgetState extends State<CalendarPickerValetWidget> {
  DateTimeRange? calendarPickerSelectedDay;

  @override
  void initState() {
    super.initState();
    calendarPickerSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
      child: FlutterFlowCalendar(
        color: FlutterFlowTheme.of(context).secondaryColor,
        iconColor: FlutterFlowTheme.of(context).secondaryText,
        weekFormat: true,
        weekStartsMonday: true,
        initialDate: getCurrentTimestamp,
        onChange: (DateTimeRange? newSelectedDate) async {
          calendarPickerSelectedDay = newSelectedDate;
          logFirebaseEvent('CALENDAR_PICKER_VALET_CalendarPicker_ON_');
          logFirebaseEvent('CalendarPicker_update_local_state');
          setState(() =>
              FFAppState().selectedDate = calendarPickerSelectedDay?.start);
          setState(() {});
        },
        titleStyle: FlutterFlowTheme.of(context).subtitle2,
        dayOfWeekStyle: FlutterFlowTheme.of(context).bodyText2,
        dateStyle: FlutterFlowTheme.of(context).bodyText1,
        selectedDateStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
              color: FlutterFlowTheme.of(context).primaryColor,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).subtitle2Family),
            ),
        inactiveDateStyle: FlutterFlowTheme.of(context).bodyText2.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
              color: FlutterFlowTheme.of(context).iconGray,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyText2Family),
            ),
      ),
    );
  }
}
