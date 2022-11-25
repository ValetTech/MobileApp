import '../components/end_drawer_container_widget.dart';
import '../components/page_name_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditReservationWidget extends StatefulWidget {
  const EditReservationWidget({
    Key? key,
    this.resDetailsEdit,
  }) : super(key: key);

  final dynamic resDetailsEdit;

  @override
  _EditReservationWidgetState createState() => _EditReservationWidgetState();
}

class _EditReservationWidgetState extends State<EditReservationWidget> {
  DateTime? datePicked;
  TextEditingController? durationController;
  String? sittingsValue;
  TextEditingController? noGuestsController;
  TextEditingController? notesController;
  String? sourceValue;
  TextEditingController? emailController;
  TextEditingController? firstController;
  TextEditingController? lastController;
  TextEditingController? phoneController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_RESERVATION_EditReservation_ON_LOAD');
      logFirebaseEvent('EditReservation_update_local_state');
      setState(() => FFAppState().resFirstName = getJsonField(
            widget.resDetailsEdit,
            r'''$.customer.firstName''',
          ).toString());
      logFirebaseEvent('EditReservation_update_local_state');
      setState(() => FFAppState().resLastName = getJsonField(
            widget.resDetailsEdit,
            r'''$.customer.lastName''',
          ).toString());
      logFirebaseEvent('EditReservation_update_local_state');
      setState(() => FFAppState().resPhone = getJsonField(
            widget.resDetailsEdit,
            r'''$.customer.phone''',
          ).toString());
      logFirebaseEvent('EditReservation_update_local_state');
      setState(() => FFAppState().resEmail = getJsonField(
            widget.resDetailsEdit,
            r'''$.customer.email''',
          ).toString());
      logFirebaseEvent('EditReservation_update_local_state');
      setState(() => FFAppState().isVIP = getJsonField(
            widget.resDetailsEdit,
            r'''$.isVip''',
          ));
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EditReservation'});
    durationController = TextEditingController(
        text: getJsonField(
      widget.resDetailsEdit,
      r'''$.duration''',
    ).toString());
    noGuestsController = TextEditingController(
        text: getJsonField(
      widget.resDetailsEdit,
      r'''$.noGuests''',
    ).toString());
    notesController = TextEditingController(
        text: getJsonField(
      widget.resDetailsEdit,
      r'''$.notes''',
    ).toString());
    emailController = TextEditingController(
        text: getJsonField(
      widget.resDetailsEdit,
      r'''$.customer.email''',
    ).toString());
    firstController = TextEditingController(
        text: getJsonField(
      widget.resDetailsEdit,
      r'''$.customer.firstName''',
    ).toString());
    lastController = TextEditingController(
        text: getJsonField(
      widget.resDetailsEdit,
      r'''$.customer.lastName''',
    ).toString());
    phoneController = TextEditingController(
        text: getJsonField(
      widget.resDetailsEdit,
      r'''$.customer.phone''',
    ).toString());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    durationController?.dispose();
    noGuestsController?.dispose();
    notesController?.dispose();
    emailController?.dispose();
    firstController?.dispose();
    lastController?.dispose();
    phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'EditReservation',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          endDrawer: Container(
            width: 250,
            child: Drawer(
              elevation: 16,
              child: EndDrawerContainerWidget(
                pageName: 'Edit Reservation',
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: PageNameWidget(
                        pageName: 'Edit Reservation',
                      ),
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
                    logFirebaseEvent('EDIT_RESERVATION_PAGE_menu_ICN_ON_TAP');
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
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 16, 16, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 2, 0),
                                                  child: TextFormField(
                                                    controller: firstController,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      'firstController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () async {
                                                        logFirebaseEvent(
                                                            'EDIT_RESERVATION_First_ON_TEXTFIELD_CHAN');
                                                        logFirebaseEvent(
                                                            'First_update_local_state');
                                                        setState(() => FFAppState()
                                                                .resFirstName =
                                                            firstController!
                                                                .text);
                                                      },
                                                    ),
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText: 'First',
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .iconGray,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .iconGray,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      filled: true,
                                                      suffixIcon:
                                                          firstController!.text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    firstController
                                                                        ?.clear();
                                                                    logFirebaseEvent(
                                                                        'EDIT_RESERVATION_First_ON_TEXTFIELD_CHAN');
                                                                    logFirebaseEvent(
                                                                        'First_update_local_state');
                                                                    setState(() => FFAppState()
                                                                            .resFirstName =
                                                                        firstController!
                                                                            .text);
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22,
                                                                  ),
                                                                )
                                                              : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 0, 2, 0),
                                                  child: TextFormField(
                                                    controller: lastController,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      'lastController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () async {
                                                        logFirebaseEvent(
                                                            'EDIT_RESERVATION_Last_ON_TEXTFIELD_CHANG');
                                                        logFirebaseEvent(
                                                            'Last_update_local_state');
                                                        setState(() =>
                                                            FFAppState()
                                                                    .resLastName =
                                                                lastController!
                                                                    .text);
                                                      },
                                                    ),
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText: 'Last',
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .iconGray,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .iconGray,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      filled: true,
                                                      suffixIcon:
                                                          lastController!.text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    lastController
                                                                        ?.clear();
                                                                    logFirebaseEvent(
                                                                        'EDIT_RESERVATION_Last_ON_TEXTFIELD_CHANG');
                                                                    logFirebaseEvent(
                                                                        'Last_update_local_state');
                                                                    setState(() => FFAppState()
                                                                            .resLastName =
                                                                        lastController!
                                                                            .text);
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22,
                                                                  ),
                                                                )
                                                              : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'EDIT_RESERVATION_Icon_u2pyylgt_ON_TAP');
                                                    if (FFAppState().isVIP) {
                                                      logFirebaseEvent(
                                                          'Icon_update_local_state');
                                                      setState(() =>
                                                          FFAppState().isVIP =
                                                              false);
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Icon_update_local_state');
                                                      setState(() =>
                                                          FFAppState().isVIP =
                                                              true);
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.stars_rounded,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().isVIP == true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .iconGray,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .iconGray,
                                                    ),
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: phoneController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    'phoneController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      logFirebaseEvent(
                                                          'EDIT_RESERVATION_Phone_ON_TEXTFIELD_CHAN');
                                                      logFirebaseEvent(
                                                          'Phone_update_local_state');
                                                      setState(() =>
                                                          FFAppState()
                                                                  .resPhone =
                                                              phoneController!
                                                                  .text);
                                                    },
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Phone',
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .iconGray,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .iconGray,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    filled: true,
                                                    suffixIcon: phoneController!
                                                            .text.isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              phoneController
                                                                  ?.clear();
                                                              logFirebaseEvent(
                                                                  'EDIT_RESERVATION_Phone_ON_TEXTFIELD_CHAN');
                                                              logFirebaseEvent(
                                                                  'Phone_update_local_state');
                                                              setState(() => FFAppState()
                                                                      .resPhone =
                                                                  phoneController!
                                                                      .text);
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: Color(
                                                                  0xFF757575),
                                                              size: 22,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 16),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: emailController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    'emailController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      logFirebaseEvent(
                                                          'EDIT_RESERVATION_Email_ON_TEXTFIELD_CHAN');
                                                      logFirebaseEvent(
                                                          'Email_update_local_state');
                                                      setState(() =>
                                                          FFAppState()
                                                                  .resEmail =
                                                              emailController!
                                                                  .text);
                                                    },
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'E-mail',
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .iconGray,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .iconGray,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    filled: true,
                                                    suffixIcon: emailController!
                                                            .text.isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              emailController
                                                                  ?.clear();
                                                              logFirebaseEvent(
                                                                  'EDIT_RESERVATION_Email_ON_TEXTFIELD_CHAN');
                                                              logFirebaseEvent(
                                                                  'Email_update_local_state');
                                                              setState(() => FFAppState()
                                                                      .resEmail =
                                                                  emailController!
                                                                      .text);
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: Color(
                                                                  0xFF757575),
                                                              size: 22,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
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
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Booking Details',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 2,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 12,
                                                                    0, 4),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          2,
                                                                          0),
                                                              child: Icon(
                                                                Icons
                                                                    .calendar_today_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .iconGray,
                                                                size: 24,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  height: 40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFF5F5F5),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .iconGray,
                                                                      width: 2,
                                                                    ),
                                                                  ),
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('EDIT_RESERVATION_Text_mdvcioec_ON_TAP');
                                                                            logFirebaseEvent('Text_date_time_picker');
                                                                            if (kIsWeb) {
                                                                              final _datePickedDate = await showDatePicker(
                                                                                context: context,
                                                                                initialDate: getCurrentTimestamp,
                                                                                firstDate: DateTime(1900),
                                                                                lastDate: DateTime(2050),
                                                                              );

                                                                              TimeOfDay? _datePickedTime;
                                                                              if (_datePickedDate != null) {
                                                                                _datePickedTime = await showTimePicker(
                                                                                  context: context,
                                                                                  initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                );
                                                                              }

                                                                              if (_datePickedDate != null && _datePickedTime != null) {
                                                                                setState(
                                                                                  () => datePicked = DateTime(
                                                                                    _datePickedDate.year,
                                                                                    _datePickedDate.month,
                                                                                    _datePickedDate.day,
                                                                                    _datePickedTime!.hour,
                                                                                    _datePickedTime.minute,
                                                                                  ),
                                                                                );
                                                                              }
                                                                            } else {
                                                                              await DatePicker.showDateTimePicker(
                                                                                context,
                                                                                showTitleActions: true,
                                                                                onConfirm: (date) {
                                                                                  setState(() => datePicked = date);
                                                                                },
                                                                                currentTime: getCurrentTimestamp,
                                                                                minTime: DateTime(0, 0, 0),
                                                                              );
                                                                            }

                                                                            logFirebaseEvent('Text_update_local_state');
                                                                            setState(() =>
                                                                                FFAppState().resDate = datePicked);
                                                                            logFirebaseEvent('Text_update_local_state');
                                                                            setState(() =>
                                                                                FFAppState().resTime = dateTimeFormat('jm', datePicked));
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            FFAppState().resDate == null
                                                                                ? functions.formatReservationDate(getJsonField(
                                                                                    widget.resDetailsEdit,
                                                                                    r'''$.dateTime''',
                                                                                  ).toString())
                                                                                : functions.formatReservationDate(datePicked?.toString()),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Overpass',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
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
                                                              flex: 2,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      durationController,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    'durationController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      logFirebaseEvent(
                                                                          'EDIT_RESERVATION_Duration_ON_TEXTFIELD_C');
                                                                      logFirebaseEvent(
                                                                          'Duration_update_local_state');
                                                                      setState(() => FFAppState()
                                                                              .resDuration =
                                                                          int.parse(
                                                                              durationController!.text));
                                                                    },
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText:
                                                                        'Duration (mins)',
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .iconGray,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .iconGray,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    suffixIcon: durationController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              durationController?.clear();
                                                                              logFirebaseEvent('EDIT_RESERVATION_Duration_ON_TEXTFIELD_C');
                                                                              logFirebaseEvent('Duration_update_local_state');
                                                                              setState(() => FFAppState().resDuration = int.parse(durationController!.text));
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              color: Color(0xFF757575),
                                                                              size: 22,
                                                                            ),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 12,
                                                                    0, 4),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          2,
                                                                          0),
                                                              child: Icon(
                                                                Icons
                                                                    .fastfood_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .iconGray,
                                                                size: 24,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2,
                                                                          0,
                                                                          2,
                                                                          0),
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                initialOption:
                                                                    sittingsValue ??=
                                                                        getJsonField(
                                                                  widget
                                                                      .resDetailsEdit,
                                                                  r'''$.sitting.type''',
                                                                ).toString(),
                                                                options: [
                                                                  'Option 1'
                                                                ],
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      sittingsValue =
                                                                          val);
                                                                  logFirebaseEvent(
                                                                      'EDIT_RESERVATION_Sittings_ON_FORM_WIDGET');
                                                                  logFirebaseEvent(
                                                                      'Sittings_update_local_state');
                                                                  setState(() =>
                                                                      FFAppState()
                                                                              .resSitting =
                                                                          sittingsValue!);
                                                                  logFirebaseEvent(
                                                                      'Sittings_update_local_state');
                                                                  setState(() =>
                                                                      FFAppState()
                                                                              .selectedSittingId =
                                                                          getJsonField(
                                                                        widget
                                                                            .resDetailsEdit,
                                                                        r'''$.sittingId''',
                                                                      ));
                                                                },
                                                                width: 130,
                                                                height: 40,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
                                                                    ),
                                                                fillColor: Color(
                                                                    0xFFF5F5F5),
                                                                elevation: 2,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .iconGray,
                                                                borderWidth: 2,
                                                                borderRadius:
                                                                    12,
                                                                margin:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            4,
                                                                            12,
                                                                            4),
                                                                hidesUnderline:
                                                                    true,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2,
                                                                          0,
                                                                          2,
                                                                          0),
                                                              child: Icon(
                                                                Icons.people,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .iconGray,
                                                                size: 24,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    noGuestsController,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  'noGuestsController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () async {
                                                                    logFirebaseEvent(
                                                                        'EDIT_RESERVATION_noGuests_ON_TEXTFIELD_C');
                                                                    logFirebaseEvent(
                                                                        'noGuests_update_local_state');
                                                                    setState(() => FFAppState()
                                                                            .resNumPeople =
                                                                        int.parse(
                                                                            noGuestsController!.text));
                                                                  },
                                                                ),
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelText:
                                                                      'Pax',
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .iconGray,
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .iconGray,
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                  filled: true,
                                                                  suffixIcon: noGuestsController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            noGuestsController?.clear();
                                                                            logFirebaseEvent('EDIT_RESERVATION_noGuests_ON_TEXTFIELD_C');
                                                                            logFirebaseEvent('noGuests_update_local_state');
                                                                            setState(() =>
                                                                                FFAppState().resNumPeople = int.parse(noGuestsController!.text));
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                Color(0xFF757575),
                                                                            size:
                                                                                22,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 12,
                                                                    0, 4),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .sticky_note_2_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .iconGray,
                                                              size: 24,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Notes',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText2Family),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 4),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .iconGray,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      notesController,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    'notesController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      logFirebaseEvent(
                                                                          'EDIT_RESERVATION_Notes_ON_TEXTFIELD_CHAN');
                                                                      logFirebaseEvent(
                                                                          'Notes_update_local_state');
                                                                      setState(() => FFAppState()
                                                                              .resNotes =
                                                                          notesController!
                                                                              .text);
                                                                    },
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    errorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedErrorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    filled:
                                                                        true,
                                                                    suffixIcon: notesController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              notesController?.clear();
                                                                              logFirebaseEvent('EDIT_RESERVATION_Notes_ON_TEXTFIELD_CHAN');
                                                                              logFirebaseEvent('Notes_update_local_state');
                                                                              setState(() => FFAppState().resNotes = notesController!.text);
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              color: Color(0xFF757575),
                                                                              size: 22,
                                                                            ),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                  maxLines:
                                                                      null,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .multiline,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 12,
                                                                    0, 4),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          2,
                                                                          0),
                                                              child: Icon(
                                                                Icons.input,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .iconGray,
                                                                size: 24,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                  initialOption:
                                                                      sourceValue ??=
                                                                          getJsonField(
                                                                    widget
                                                                        .resDetailsEdit,
                                                                    r'''$.source''',
                                                                  ).toString(),
                                                                  options: FFAppState()
                                                                      .sourceOptions
                                                                      .toList(),
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          sourceValue =
                                                                              val),
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 40,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                  fillColor: Color(
                                                                      0xFFF5F5F5),
                                                                  elevation: 2,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .iconGray,
                                                                  borderWidth:
                                                                      2,
                                                                  borderRadius:
                                                                      12,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          4,
                                                                          12,
                                                                          4),
                                                                  hidesUnderline:
                                                                      true,
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
                                          ],
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Container(
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
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'EDIT_RESERVATION_PAGE_BACK_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_navigate_back');
                                                      context.pop();
                                                    },
                                                    text: 'Back',
                                                    icon: Icon(
                                                      Icons
                                                          .chevron_left_rounded,
                                                      size: 20,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 126,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
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
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'Save',
                                                    icon: Icon(
                                                      Icons.save_rounded,
                                                      size: 20,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 126,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
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
                                                ],
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
