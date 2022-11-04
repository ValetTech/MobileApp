import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_container_widget.dart';
import '../components/page_name_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class ReservationsWidget extends StatefulWidget {
  const ReservationsWidget({Key? key}) : super(key: key);

  @override
  _ReservationsWidgetState createState() => _ReservationsWidgetState();
}

class _ReservationsWidgetState extends State<ReservationsWidget>
    with TickerProviderStateMixin {
  Completer<ApiCallResponse>? _apiRequestCompleter;
  DateTimeRange? calendarPickerReservationsMainSelectedDay;
  List<String> simpleSearchResults = [];
  ValueNotifier<List<String>?> sittingChipsValues = ValueNotifier(null);
  ValueNotifier<List<String>?> areaChipsValues = ValueNotifier(null);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasIconTriggered = false;
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    calendarPickerReservationsMainSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Reservations',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          endDrawer: Drawer(
            elevation: 16,
            child: EndDrawerContainerWidget(),
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: PageNameWidget(
                          pageName: 'Reservations',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 0,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.menu,
                    color: FlutterFlowTheme.of(context).iconGray,
                    size: 30,
                  ),
                  onPressed: () async {
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 6),
                                          child: FlutterFlowCalendar(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            weekFormat: true,
                                            weekStartsMonday: true,
                                            initialDate:
                                                FFAppState().selectedDate,
                                            onChange: (DateTimeRange?
                                                newSelectedDate) async {
                                              calendarPickerReservationsMainSelectedDay =
                                                  newSelectedDate;
                                              setState(() => FFAppState()
                                                      .selectedDate =
                                                  calendarPickerReservationsMainSelectedDay
                                                      ?.start);
                                              setState(() =>
                                                  _apiRequestCompleter = null);
                                              setState(() => sittingChipsValues
                                                  .value = []);
                                              setState(() =>
                                                  areaChipsValues.value = []);
                                              setState(() => FFAppState()
                                                  .filtersOn = false);
                                              setState(() {});
                                            },
                                            titleStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2,
                                            dayOfWeekStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            dateStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            selectedDateStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family),
                                                    ),
                                            inactiveDateStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .iconGray,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2Family),
                                                    ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    FlutterFlowTheme.of(context).grayLines
                                  ],
                                  stops: [0, 1],
                                  begin: AlignmentDirectional(0, -1),
                                  end: AlignmentDirectional(0, 1),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (FFAppState().filtersOn == false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 0),
                                              child: Icon(
                                                Icons.filter_alt_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .iconGray,
                                                size: 24,
                                              ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'iconOnActionTriggerAnimation']!,
                                                  hasBeenTriggered:
                                                      hasIconTriggered),
                                            ),
                                          if (FFAppState().filtersOn == true)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  setState(() => FFAppState()
                                                      .filtersOn = false);
                                                  setState(() =>
                                                      sittingChipsValues.value =
                                                          []);
                                                  setState(() => areaChipsValues
                                                      .value = []);
                                                },
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: Color(0xFFDF3F3F),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 8,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Visibility(
                                                visible:
                                                    true /* Warning: Trying to access variable not yet defined. */,
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: ValetAPIGroup
                                                      .gETSittingTypesByDateCall
                                                      .call(
                                                    date: functions
                                                        .formatDateForPOST(
                                                            FFAppState()
                                                                .selectedDate!),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 40,
                                                          height: 40,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Color(
                                                                0x00023047),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final sittingChipsGETSittingTypesByDateResponse =
                                                        snapshot.data!;
                                                    return FlutterFlowChoiceChips(
                                                      options: (ValetAPIGroup
                                                                      .gETSittingTypesByDateCall
                                                                      .sittings(
                                                                        sittingChipsGETSittingTypesByDateResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .length >
                                                                  0
                                                              ? (ValetAPIGroup
                                                                      .gETSittingTypesByDateCall
                                                                      .sittingType(
                                                                  sittingChipsGETSittingTypesByDateResponse
                                                                      .jsonBody,
                                                                ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()
                                                                  .where((e) =>
                                                                      calendarPickerReservationsMainSelectedDay
                                                                          ?.start ==
                                                                      FFAppState()
                                                                          .selectedDate)
                                                                  .toList()
                                                              : ["No Sittings"])
                                                          .map((label) =>
                                                              ChipData(label))
                                                          .toList(),
                                                      onChanged: (val) async {
                                                        setState(() =>
                                                            sittingChipsValues
                                                                .value = val);
                                                        setState(() =>
                                                            FFAppState()
                                                                    .filtersOn =
                                                                true);
                                                        setState(() {
                                                          simpleSearchResults = TextSearch(ValetAPIGroup
                                                                  .gETSittingTypesByDateCall
                                                                  .sittingType(
                                                                    sittingChipsGETSittingTypesByDateResponse
                                                                        .jsonBody,
                                                                  )
                                                                  .toString()
                                                                  .map((str) =>
                                                                      TextSearchItem(
                                                                          str, [
                                                                        str
                                                                      ]))
                                                                  .toList())
                                                              .search(FFAppState()
                                                                  .resSitting)
                                                              .map((r) =>
                                                                  r.object)
                                                              .toList();
                                                        });
                                                      },
                                                      selectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        iconSize: 14,
                                                        elevation: 4,
                                                      ),
                                                      unselectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            Colors.white,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .iconGray,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2Family),
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .iconGray,
                                                        iconSize: 14,
                                                        elevation: 4,
                                                      ),
                                                      chipSpacing: 8,
                                                      multiselect: true,
                                                      initialized:
                                                          sittingChipsValues
                                                                  .value !=
                                                              null,
                                                      alignment: WrapAlignment
                                                          .spaceEvenly,
                                                      selectedValuesVariable:
                                                          sittingChipsValues,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Visibility(
                                                visible:
                                                    true /* Warning: Trying to access variable not yet defined. */,
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: ValetAPIGroup
                                                      .gETAreasBySittingIDCall
                                                      .call(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 40,
                                                          height: 40,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Color(
                                                                0x00023047),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final areaChipsGETAreasBySittingIDResponse =
                                                        snapshot.data!;
                                                    return FlutterFlowChoiceChips(
                                                      options: (ValetAPIGroup
                                                                      .gETAreasBySittingIDCall
                                                                      .areas(
                                                                        areaChipsGETAreasBySittingIDResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .length >
                                                                  0
                                                              ? (ValetAPIGroup
                                                                      .gETAreasBySittingIDCall
                                                                      .areaName(
                                                                  areaChipsGETAreasBySittingIDResponse
                                                                      .jsonBody,
                                                                ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()
                                                              : ["No areas"])
                                                          .map((label) =>
                                                              ChipData(label))
                                                          .toList(),
                                                      onChanged: (val) async {
                                                        setState(() =>
                                                            areaChipsValues
                                                                .value = val);
                                                        setState(() =>
                                                            FFAppState()
                                                                    .filtersOn =
                                                                true);
                                                      },
                                                      selectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        iconSize: 14,
                                                        elevation: 4,
                                                      ),
                                                      unselectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            Colors.white,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .iconGray,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2Family),
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .iconGray,
                                                        iconSize: 14,
                                                        elevation: 4,
                                                      ),
                                                      chipSpacing: 8,
                                                      multiselect: true,
                                                      initialized:
                                                          areaChipsValues
                                                                  .value !=
                                                              null,
                                                      alignment: WrapAlignment
                                                          .spaceEvenly,
                                                      selectedValuesVariable:
                                                          areaChipsValues,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (FFAppState().filtersOn == false)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Color(0x230E151B),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: (_apiRequestCompleter ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(GETReservationsCall.call(
                                              date: functions.formatDateForPOST(
                                                  FFAppState().selectedDate!),
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRipple(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewMainGETReservationsResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final resList =
                                            GETReservationsCall.reservations(
                                          listViewMainGETReservationsResponse
                                              .jsonBody,
                                        ).toList();
                                        if (resList.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/Screenshot_2022-10-21_at_10.24.55_pm.png',
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                            ),
                                          );
                                        }
                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            setState(() =>
                                                _apiRequestCompleter = null);
                                          },
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: resList.length,
                                            itemBuilder:
                                                (context, resListIndex) {
                                              final resListItem =
                                                  resList[resListIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 0, 4),
                                                child: InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'ViewReservation',
                                                      queryParams: {
                                                        'resDetails':
                                                            serializeParam(
                                                          resListItem,
                                                          ParamType.JSON,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        8,
                                                                        0,
                                                                        8),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      resListItem,
                                                                      r'''$.customer.fullName''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Overpass',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .iconGray,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          '${functions.formatReservationTime(getJsonField(
                                                                            resListItem,
                                                                            r'''$.dateTime''',
                                                                          ).toString())} · ${getJsonField(
                                                                            resListItem,
                                                                            r'''$.duration''',
                                                                          ).toString()} mins',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).iconGray,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .phone,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .iconGray,
                                                                      size: 16,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          resListItem,
                                                                          r'''$.customer.phone''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).iconGray,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 60,
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_right,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'ViewReservation',
                                                                    queryParams:
                                                                        {
                                                                      'resDetails':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          resListItem,
                                                                          r'''$''',
                                                                        ),
                                                                        ParamType
                                                                            .JSON,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('NewReservation');
                          },
                          text: 'New Reservation',
                          icon: Icon(
                            Icons.add,
                            size: 30,
                          ),
                          options: FFButtonOptions(
                            width: 175,
                            height: 50,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText2Family,
                                  letterSpacing: 1,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText2Family),
                                ),
                            elevation: 6,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
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
