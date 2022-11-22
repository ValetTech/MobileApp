import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarPickerValetExpandedWidget extends StatefulWidget {
  const CalendarPickerValetExpandedWidget({Key? key}) : super(key: key);

  @override
  _CalendarPickerValetExpandedWidgetState createState() =>
      _CalendarPickerValetExpandedWidgetState();
}

class _CalendarPickerValetExpandedWidgetState
    extends State<CalendarPickerValetExpandedWidget> {
  DateTimeRange? calendarPickerReservationsSelectedDay;

  @override
  void initState() {
    super.initState();
    calendarPickerReservationsSelectedDay = DateTimeRange(
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
        weekFormat: false,
        weekStartsMonday: true,
        initialDate: getCurrentTimestamp,
        rowHeight: 35,
        onChange: (DateTimeRange? newSelectedDate) async {
          calendarPickerReservationsSelectedDay = newSelectedDate;
          logFirebaseEvent('CALENDAR_PICKER_VALET_EXPANDED_CalendarP');
          logFirebaseEvent('CalendarPickerReservations_update_local_');
          setState(() => FFAppState().selectedDate =
              calendarPickerReservationsSelectedDay?.start);
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
