import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewReservationWidget extends StatefulWidget {
  const NewReservationWidget({Key? key}) : super(key: key);

  @override
  _NewReservationWidgetState createState() => _NewReservationWidgetState();
}

class _NewReservationWidgetState extends State<NewReservationWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter;
  DateTimeRange? newResCalendarSelectedDay;
  String? choiceChipsValue1;
  String? choiceChipsValue2;

  @override
  void initState() {
    super.initState();
    newResCalendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 20,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, -6),
                  spreadRadius: 2,
                )
              ],
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).background,
                  FlutterFlowTheme.of(context).white
                ],
                stops: [1, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 16),
            child: Text(
              'New Reservation',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Overpass',
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(FlutterFlowTheme.of(context).title1Family),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Container(
              width: double.infinity,
              color: Color(0x00000000),
              child: ExpandableNotifier(
                initialExpanded: true,
                child: ExpandablePanel(
                  header: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: Icon(
                          Icons.calendar_today_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Date',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                    ],
                  ),
                  collapsed: Container(
                    width: double.infinity,
                    height: 2,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                  ),
                  expanded: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                        child: FlutterFlowCalendar(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          weekFormat: false,
                          weekStartsMonday: true,
                          initialDate: getCurrentTimestamp,
                          rowHeight: 35,
                          onChange: (DateTimeRange? newSelectedDate) async {
                            newResCalendarSelectedDay = newSelectedDate;
                            setState(() => _apiRequestCompleter = null);
                            await waitForApiRequestCompleter();
                            setState(() => FFAppState().selectedResDate =
                                newResCalendarSelectedDay?.start);
                            setState(() {});
                          },
                          titleStyle: FlutterFlowTheme.of(context).subtitle2,
                          dayOfWeekStyle:
                              FlutterFlowTheme.of(context).bodyText2,
                          dateStyle: FlutterFlowTheme.of(context).bodyText1,
                          selectedDateStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2Family),
                              ),
                          inactiveDateStyle: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText2Family,
                                color: FlutterFlowTheme.of(context).iconGray,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText2Family),
                              ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).iconGray,
                        ),
                      ),
                    ],
                  ),
                  theme: ExpandableThemeData(
                    tapHeaderToExpand: true,
                    tapBodyToExpand: false,
                    tapBodyToCollapse: true,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    hasIcon: true,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Container(
              width: double.infinity,
              color: Color(0x00000000),
              child: ExpandableNotifier(
                initialExpanded: false,
                child: ExpandablePanel(
                  header: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: Icon(
                          Icons.fastfood_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Sitting',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                    ],
                  ),
                  collapsed: Container(
                    width: double.infinity,
                    height: 2,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                  ),
                  expanded: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 0,
                        runSpacing: 0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FutureBuilder<ApiCallResponse>(
                            future: (_apiRequestCompleter ??=
                                    Completer<ApiCallResponse>()
                                      ..complete(GETSittingsCall.call(
                                        selectedDate: newResCalendarSelectedDay
                                            ?.start
                                            ?.toString(),
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final choiceChipsGETSittingsResponse =
                                  snapshot.data!;
                              return FlutterFlowChoiceChips(
                                options: (GETSittingsCall.sittingType(
                                  choiceChipsGETSittingsResponse.jsonBody,
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) async {
                                  setState(
                                      () => choiceChipsValue1 = val?.first);
                                  setState(() => FFAppState()
                                          .selectedSittingId = getJsonField(
                                        choiceChipsGETSittingsResponse.jsonBody,
                                        r'''$.id''',
                                      ));
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFE3E7ED),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  iconColor: Colors.white,
                                  iconSize: 18,
                                  elevation: 4,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText2Family,
                                        color: Color(0xFFE3E7ED),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2Family),
                                      ),
                                  iconColor: Color(0xFFE3E7ED),
                                  iconSize: 18,
                                  elevation: 4,
                                ),
                                chipSpacing: 6,
                                multiselect: false,
                                alignment: WrapAlignment.start,
                              );
                            },
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).iconGray,
                        ),
                      ),
                    ],
                  ),
                  theme: ExpandableThemeData(
                    tapHeaderToExpand: true,
                    tapBodyToExpand: false,
                    tapBodyToCollapse: false,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    hasIcon: true,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Container(
              width: double.infinity,
              color: Color(0x00000000),
              child: ExpandableNotifier(
                initialExpanded: false,
                child: ExpandablePanel(
                  header: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Time',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                    ],
                  ),
                  collapsed: Container(
                    width: double.infinity,
                    height: 2,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                  ),
                  expanded: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 0,
                        runSpacing: 0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FutureBuilder<ApiCallResponse>(
                            future: GETTablesAvailableBySittingIDCall.call(
                              selectedSittingId: FFAppState().selectedSittingId,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final choiceChipsGETTablesAvailableBySittingIDResponse =
                                  snapshot.data!;
                              return FlutterFlowChoiceChips(
                                options: (getJsonField(
                                  choiceChipsGETTablesAvailableBySittingIDResponse
                                      .jsonBody,
                                  r'''$''',
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) => setState(
                                    () => choiceChipsValue2 = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFE3E7ED),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  iconColor: Colors.white,
                                  iconSize: 18,
                                  elevation: 4,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText2Family,
                                        color: Color(0xFFE3E7ED),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2Family),
                                      ),
                                  iconColor: Color(0xFFE3E7ED),
                                  iconSize: 18,
                                  elevation: 4,
                                ),
                                chipSpacing: 20,
                                multiselect: false,
                                alignment: WrapAlignment.start,
                              );
                            },
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).iconGray,
                        ),
                      ),
                    ],
                  ),
                  theme: ExpandableThemeData(
                    tapHeaderToExpand: true,
                    tapBodyToExpand: false,
                    tapBodyToCollapse: false,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    hasIcon: true,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Container(
              width: double.infinity,
              color: Color(0x00000000),
              child: ExpandableNotifier(
                initialExpanded: false,
                child: ExpandablePanel(
                  header: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: Icon(
                          Icons.perm_contact_cal,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Contact Details',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                    ],
                  ),
                  collapsed: Container(
                    width: double.infinity,
                    height: 2,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                  ),
                  expanded: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  theme: ExpandableThemeData(
                    tapHeaderToExpand: true,
                    tapBodyToExpand: false,
                    tapBodyToCollapse: false,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    hasIcon: true,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Submit',
                  icon: Icon(
                    Icons.check_rounded,
                    size: 20,
                  ),
                  options: FFButtonOptions(
                    width: 175,
                    height: 40,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText1,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                  icon: Icon(
                    Icons.cancel,
                    size: 20,
                  ),
                  options: FFButtonOptions(
                    width: 175,
                    height: 40,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText1,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
