import '../backend/api_requests/api_calls.dart';
import '../components/calendar_picker_valet_widget.dart';
import '../components/end_drawer_container_widget.dart';
import '../components/header_search_widget.dart';
import '../components/new_reservation_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../view_reservation/view_reservation_widget.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ReservationsWidget extends StatefulWidget {
  const ReservationsWidget({Key? key}) : super(key: key);

  @override
  _ReservationsWidgetState createState() => _ReservationsWidgetState();
}

class _ReservationsWidgetState extends State<ReservationsWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter;
  List<String>? choiceChipsValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().resMinDate = getCurrentTimestamp);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Reservations',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).white,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 50, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderSearchWidget(),
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
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ],
              elevation: 6,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: 400,
                      child: NewReservationWidget(),
                    ),
                  );
                },
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
            icon: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
            elevation: 8,
            label: Text(
              'New Reservation',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            ),
          ),
          endDrawer: Drawer(
            elevation: 16,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: EndDrawerContainerWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 135, 16, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
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
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Filter by seating area',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Wrap(
                                    spacing: 0,
                                    runSpacing: 0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.vertical,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.antiAlias,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                        child: FlutterFlowChoiceChips(
                                          initiallySelected:
                                              choiceChipsValues != null
                                                  ? choiceChipsValues
                                                  : [],
                                          options: FFAppState()
                                              .selectedResArea
                                              .map((label) => ChipData(label))
                                              .toList(),
                                          onChanged: (val) => setState(
                                              () => choiceChipsValues = val),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family),
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            iconSize: 14,
                                            elevation: 4,
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor: Colors.white,
                                            textStyle:
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
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .iconGray,
                                            iconSize: 14,
                                            elevation: 4,
                                          ),
                                          chipSpacing: 8,
                                          multiselect: true,
                                          initialized:
                                              choiceChipsValues != null,
                                          alignment: WrapAlignment.spaceEvenly,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                      child: CalendarPickerValetWidget(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
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
                                future: (_apiRequestCompleter ??= Completer<
                                        ApiCallResponse>()
                                      ..complete(GETReservationsCall.call()))
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
                                  final listViewGETReservationsResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final reservation = GETReservationsCall
                                          .byBreakfastSitting(
                                        listViewGETReservationsResponse
                                            .jsonBody,
                                      ).toList();
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() =>
                                              _apiRequestCompleter = null);
                                          await waitForApiRequestCompleter();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: reservation.length,
                                          itemBuilder:
                                              (context, reservationIndex) {
                                            final reservationItem =
                                                reservation[reservationIndex];
                                            return InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child:
                                                        ViewReservationWidget(
                                                      resFullName: getJsonField(
                                                        listViewGETReservationsResponse
                                                            .jsonBody,
                                                        r'''$.customer.fullName''',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Slidable(
                                                actionPane:
                                                    const SlidableScrollActionPane(),
                                                secondaryActions: [
                                                  IconSlideAction(
                                                    caption: 'Allocate',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .iconGray,
                                                    icon: Icons.group_add,
                                                    onTap: () {
                                                      print(
                                                          'SlidableActionWidget pressed ...');
                                                    },
                                                  ),
                                                  IconSlideAction(
                                                    caption: 'Edit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .iconGray,
                                                    icon: Icons.edit_rounded,
                                                    onTap: () {
                                                      print(
                                                          'SlidableActionWidget pressed ...');
                                                    },
                                                  ),
                                                ],
                                                child: ListTile(
                                                  title: Text(
                                                    getJsonField(
                                                      reservationItem,
                                                      r'''$.customer.fullName''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title3Family,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3Family),
                                                        ),
                                                  ),
                                                  subtitle: Text(
                                                    getJsonField(
                                                      reservationItem,
                                                      r'''$.customer.phone''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .iconGray,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family),
                                                        ),
                                                  ),
                                                  trailing: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF303030),
                                                    size: 20,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  dense: false,
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
