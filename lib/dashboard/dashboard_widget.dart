import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_container_widget.dart';
import '../components/header_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  ApiCallResponse? allTables;
  ApiCallResponse? tokenAPICall;
  ApiCallResponse? vacantTables;
  ApiCallResponse? unallocatedReservations;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ApiCallResponse? allTablesChange;
  ApiCallResponse? vacantTablesChange;
  ApiCallResponse? unallocatedReservationsChange;
  DateTimeRange? calendarPickerSelectedDay;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DASHBOARD_PAGE_Dashboard_ON_PAGE_LOAD');
      logFirebaseEvent('Dashboard_backend_call');
      tokenAPICall = await ValetAPIGroup.loginUserCall.call(
        email: 'a@a.com',
        password: 'adminAdmin1!',
      );
      if ((tokenAPICall?.succeeded ?? true)) {
        logFirebaseEvent('Dashboard_update_local_state');
        setState(() => FFAppState().token = ValetAPIGroup.loginUserCall
            .jWTToken(
              (tokenAPICall?.jsonBody ?? ''),
            )
            .toString());
      } else {
        logFirebaseEvent('Dashboard_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (tokenAPICall?.statusCode ?? 200).toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );
      }

      logFirebaseEvent('Dashboard_update_local_state');
      setState(() => FFAppState().selectedDate = getCurrentTimestamp);
      logFirebaseEvent('Dashboard_backend_call');
      allTables = await WidgetsGroup.getTablesCall.call(
        date: functions.formatDateForPOST(FFAppState().selectedDate!),
        token: FFAppState().token,
      );
      logFirebaseEvent('Dashboard_backend_call');
      vacantTables = await WidgetsGroup.getTablesCall.call(
        date: functions.formatDateForPOST(FFAppState().selectedDate!),
        hasReservations: false.toString(),
        token: FFAppState().token,
      );
      logFirebaseEvent('Dashboard_backend_call');
      unallocatedReservations = await WidgetsGroup.getReservationsCall.call(
        date: functions.formatDateForPOST(FFAppState().selectedDate!),
        hasTables: false.toString(),
        token: FFAppState().token,
      );
      if ((allTables?.succeeded ?? true) &&
          (vacantTables?.succeeded ?? true) &&
          (unallocatedReservations?.succeeded ?? true)) {
        logFirebaseEvent('Dashboard_update_local_state');
        setState(() => FFAppState().UnallocatedReservations =
                functions.arrayCount(valueOrDefault<dynamic>(
              WidgetsGroup.getReservationsCall.allReservations(
                (unallocatedReservationsChange?.jsonBody ?? ''),
              ),
              0,
            ).toList()));
        logFirebaseEvent('Dashboard_update_local_state');
        setState(() => FFAppState().AvaliableTables =
                functions.arrayCount(valueOrDefault<dynamic>(
              WidgetsGroup.getTablesCall.allTables(
                (vacantTablesChange?.jsonBody ?? ''),
              ),
              0,
            )));
      } else {
        logFirebaseEvent('Dashboard_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Something went wrong.',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );
        return;
      }

      logFirebaseEvent('Dashboard_update_local_state');
      setState(() => FFAppState().VacancyRate = valueOrDefault<double>(
            functions.getPercentage(
                functions.arrayCount(WidgetsGroup.getTablesCall.allTables(
                  (vacantTablesChange?.jsonBody ?? ''),
                )),
                functions.arrayCount(WidgetsGroup.getTablesCall.allTables(
                  (allTablesChange?.jsonBody ?? ''),
                ))),
            0.0,
          ));
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    calendarPickerSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Dashboard',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          endDrawer: Container(
            width: 250,
            child: Drawer(
              elevation: 16,
              child: EndDrawerContainerWidget(
                pageName: 'Dashboard',
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: HeaderWidget(),
                    ),
                  ],
                ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.menu,
                    color: FlutterFlowTheme.of(context).iconGray,
                    size: 30,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('DASHBOARD_PAGE_menu_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_drawer');
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ],
              centerTitle: false,
              toolbarHeight: 60,
              elevation: 6,
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x230E151B),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                          child: FlutterFlowCalendar(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            weekFormat: true,
                            weekStartsMonday: true,
                            initialDate: getCurrentTimestamp,
                            onChange: (DateTimeRange? newSelectedDate) async {
                              calendarPickerSelectedDay = newSelectedDate;
                              logFirebaseEvent(
                                  'DASHBOARD_CalendarPicker_ON_DATE_SELECTE');
                              logFirebaseEvent(
                                  'CalendarPicker_update_local_state');
                              setState(() => FFAppState().selectedDate =
                                  calendarPickerSelectedDay?.start);
                              logFirebaseEvent('CalendarPicker_backend_call');
                              allTablesChange =
                                  await WidgetsGroup.getTablesCall.call(
                                date: functions.formatDateForPOST(
                                    FFAppState().selectedDate!),
                                token: FFAppState().token,
                              );
                              logFirebaseEvent('CalendarPicker_backend_call');
                              vacantTablesChange =
                                  await WidgetsGroup.getTablesCall.call(
                                date: functions.formatDateForPOST(
                                    FFAppState().selectedDate!),
                                hasReservations: false.toString(),
                                token: FFAppState().token,
                              );
                              logFirebaseEvent('CalendarPicker_backend_call');
                              unallocatedReservationsChange =
                                  await WidgetsGroup.getReservationsCall.call(
                                date: functions.formatDateForPOST(
                                    FFAppState().selectedDate!),
                                hasTables: false.toString(),
                                token: FFAppState().token,
                              );
                              if ((allTablesChange?.succeeded ?? true) &&
                                  (vacantTablesChange?.succeeded ?? true) &&
                                  (unallocatedReservationsChange?.succeeded ??
                                      true)) {
                                logFirebaseEvent(
                                    'CalendarPicker_update_local_state');
                                setState(() =>
                                    FFAppState().UnallocatedReservations =
                                        functions
                                            .arrayCount(valueOrDefault<dynamic>(
                                      WidgetsGroup.getReservationsCall
                                          .allReservations(
                                        (unallocatedReservationsChange
                                                ?.jsonBody ??
                                            ''),
                                      ),
                                      0,
                                    ).toList()));
                                logFirebaseEvent(
                                    'CalendarPicker_update_local_state');
                                setState(() => FFAppState().AvaliableTables =
                                        functions
                                            .arrayCount(valueOrDefault<dynamic>(
                                      WidgetsGroup.getTablesCall.allTables(
                                        (vacantTablesChange?.jsonBody ?? ''),
                                      ),
                                      0,
                                    )));
                              } else {
                                logFirebaseEvent(
                                    'CalendarPicker_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Something went wrong.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                                return;
                              }

                              logFirebaseEvent(
                                  'CalendarPicker_update_local_state');
                              setState(() => FFAppState().VacancyRate =
                                      valueOrDefault<double>(
                                    functions.getPercentage(
                                        functions.arrayCount(WidgetsGroup
                                            .getTablesCall
                                            .allTables(
                                          (vacantTablesChange?.jsonBody ?? ''),
                                        )),
                                        functions.arrayCount(WidgetsGroup
                                            .getTablesCall
                                            .allTables(
                                          (allTablesChange?.jsonBody ?? ''),
                                        ))),
                                    0.0,
                                  ));
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
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                            inactiveDateStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText2Family,
                                  color: FlutterFlowTheme.of(context).iconGray,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText2Family),
                                ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 16, 12),
                      child: Stack(
                        alignment: AlignmentDirectional(-1, 0),
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x44111417),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                                child: Wrap(
                                  spacing: 0,
                                  runSpacing: 0,
                                  alignment: WrapAlignment.spaceEvenly,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.center,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Text(
                                        'Current Vacancy Rate',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_NEW_RESERVATION_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context
                                                  .pushNamed('NewReservation');
                                            },
                                            text: 'New Reservation',
                                            icon: FaIcon(
                                              FontAwesomeIcons.calendarPlus,
                                              size: 20,
                                            ),
                                            options: FFButtonOptions(
                                              width: 175,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              elevation: 2,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 95,
                            height: 95,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x44111417),
                                  offset: Offset(0, 2),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: CircularPercentIndicator(
                              percent: FFAppState().VacancyRate,
                              radius: 37.5,
                              lineWidth: 12,
                              animation: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).iconGray,
                              center: Text(
                                formatNumber(
                                  FFAppState().VacancyRate,
                                  formatType: FormatType.custom,
                                  format: '##%',
                                  locale: '',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle2Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family),
                                    ),
                              ),
                              startAngle: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 8, 8),
                                    child: StreamBuilder<List<OrdersRecord>>(
                                      stream: queryOrdersRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                size: 40,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrdersRecord>
                                            openOrdersOrdersRecordList =
                                            snapshot.data!;
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Color(0x44111417),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.restaurant_menu,
                                                      color: Color(0xFF101213),
                                                      size: 44,
                                                    ),
                                                    if (openOrdersOrdersRecordList
                                                            .length >=
                                                        1)
                                                      Text(
                                                        openOrdersOrdersRecordList
                                                            .length
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3,
                                                      ),
                                                  ],
                                                ),
                                                if (openOrdersOrdersRecordList
                                                        .length <
                                                    1)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Text(
                                                      'Currently No',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: Text(
                                                    'Open Orders',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'DASHBOARD_PAGE_NEW_ORDER_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context
                                                        .pushNamed('NewOrder');
                                                  },
                                                  text: 'New Order',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .calendarPlus,
                                                    size: 20,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 175,
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1,
                                                    elevation: 2,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'DASHBOARD_PAGE_VIEW_SETTLE_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context
                                                          .pushNamed('Orders');
                                                    },
                                                    text: 'View/Settle',
                                                    icon: FaIcon(
                                                      FontAwesomeIcons
                                                          .calendarPlus,
                                                      size: 20,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 175,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                      elevation: 2,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 8, 16),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color: Color(0x44111417),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .supervisor_account_rounded,
                                                  color: Color(0xFF101213),
                                                  size: 44,
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .UnallocatedReservations
                                                        .toString(),
                                                    'Loading',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 8),
                                              child: AutoSizeText(
                                                'Reservations Unallocated',
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'DASHBOARD_PAGE_ALLOCATE_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed('Allocate');
                                              },
                                              text: 'Allocate',
                                              icon: Icon(
                                                Icons.group_add,
                                                size: 20,
                                              ),
                                              options: FFButtonOptions(
                                                width: 175,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                elevation: 2,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 16, 8),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0x44111417),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.view_module_rounded,
                                                color: Color(0xFF101213),
                                                size: 44,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  FFAppState()
                                                      .AvaliableTables
                                                      .toString(),
                                                  'Loading',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Text(
                                              'Tables Available',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_PAGE_SEATING_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed('Seating');
                                            },
                                            text: 'Seating',
                                            icon: Icon(
                                              Icons.image_search,
                                              size: 20,
                                            ),
                                            options: FFButtonOptions(
                                              width: 175,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              elevation: 2,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 16, 16),
                                  child: FutureBuilder<List<MenuRecord>>(
                                    future: queryMenuRecordOnce(
                                      queryBuilder: (menuRecord) =>
                                          menuRecord.where('name',
                                              isEqualTo:
                                                  'Aburi Salmon Chef Sampler'),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: SpinKitRipple(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<MenuRecord>
                                          chefsSpecialMenuRecordList =
                                          snapshot.data!;
                                      final chefsSpecialMenuRecord =
                                          chefsSpecialMenuRecordList.isNotEmpty
                                              ? chefsSpecialMenuRecordList.first
                                              : null;
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5,
                                              color: Color(0x44111417),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Text(
                                                  'Today\'s Chef\'s Special',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2,
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  chefsSpecialMenuRecord!
                                                      .image!,
                                                  width: double.infinity,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        chefsSpecialMenuRecord!
                                                            .name!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
