import '../backend/api_requests/api_calls.dart';
import '../components/end_drawer_container_widget.dart';
import '../components/page_name_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  ApiCallResponse? aPIUpdateCustomer;
  ApiCallResponse? aPIUpdateReservationResult;
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
          endDrawer: Drawer(
            elevation: 16,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: EndDrawerContainerWidget(),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title3Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3Family),
                                                        ),
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
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title3Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3Family),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    if (FFAppState().isVIP) {
                                                      setState(() =>
                                                          FFAppState().isVIP =
                                                              false);
                                                    } else {
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

                                                                            setState(() =>
                                                                                FFAppState().resDate = datePicked);
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
                                                                        'Duration in mins',
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
                                                              child: FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: ValetAPIGroup
                                                                    .gETSittingTypesByDateCall
                                                                    .call(
                                                                  date: functions
                                                                      .formatDateForPOST(
                                                                          FFAppState()
                                                                              .resDate!),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        child:
                                                                            SpinKitRipple(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryColor,
                                                                          size:
                                                                              40,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final sittingsGETSittingTypesByDateResponse =
                                                                      snapshot
                                                                          .data!;
                                                                  return FlutterFlowDropDown(
                                                                    initialOption:
                                                                        sittingsValue ??=
                                                                            getJsonField(
                                                                      widget
                                                                          .resDetailsEdit,
                                                                      r'''$.sitting.type''',
                                                                    ).toString(),
                                                                    options: ValetAPIGroup
                                                                                .gETSittingTypesByDateCall
                                                                                .sittings(
                                                                                  sittingsGETSittingTypesByDateResponse.jsonBody,
                                                                                )
                                                                                .length >
                                                                            0
                                                                        ? (ValetAPIGroup.gETSittingTypesByDateCall
                                                                                    .sittingType(
                                                                            sittingsGETSittingTypesByDateResponse.jsonBody,
                                                                          )
                                                                                as List)
                                                                            .map<String>((s) => s
                                                                                .toString())
                                                                            .toList()
                                                                            .where((e) =>
                                                                                datePicked ==
                                                                                FFAppState()
                                                                                    .selectedDate)
                                                                            .toList()
                                                                        : [
                                                                            "No Sittings"
                                                                          ].toList(),
                                                                    onChanged:
                                                                        (val) async {
                                                                      setState(() =>
                                                                          sittingsValue =
                                                                              val);
                                                                      setState(() =>
                                                                          FFAppState().resSitting =
                                                                              sittingsValue!);
                                                                    },
                                                                    width: 130,
                                                                    height: 40,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFF5F5F5),
                                                                    elevation:
                                                                        2,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
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
                                                                  );
                                                                },
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
                                                                      'People',
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
                                                                    FlutterFlowDropDown(
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 16,
                                                                    0, 0),
                                                        child: Text(
                                                          'Status',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              height: 2,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 12,
                                                                    0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            if (getJsonField(
                                                                  widget
                                                                      .resDetailsEdit,
                                                                  r'''$.status''',
                                                                ) !=
                                                                FFAppState()
                                                                    .pendingString)
                                                              Icon(
                                                                Icons
                                                                    .check_circle_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 30,
                                                              ),
                                                            if (getJsonField(
                                                                  widget
                                                                      .resDetailsEdit,
                                                                  r'''$.status''',
                                                                ) ==
                                                                FFAppState()
                                                                    .pendingString)
                                                              Icon(
                                                                Icons
                                                                    .info_outline_rounded,
                                                                color: Color(
                                                                    0xFFDF3F3F),
                                                                size: 30,
                                                              ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            0,
                                                                            8),
                                                                    child:
                                                                        AutoSizeText(
                                                                      getJsonField(
                                                                        widget
                                                                            .resDetailsEdit,
                                                                        r'''$.status''',
                                                                      ).toString(),
                                                                      maxLines:
                                                                          4,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).subtitle2Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).iconGray,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                setState(() =>
                                                                    FFAppState()
                                                                            .resStatus =
                                                                        'Confirmed');
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .check_circle_outlined,
                                                                color: Color(
                                                                    0xFF005F73),
                                                                size: 30,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 12,
                                                                    0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_circle_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 30,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .info_outline_rounded,
                                                              color: Color(
                                                                  0xFFDF3F3F),
                                                              size: 30,
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            0,
                                                                            8),
                                                                    child:
                                                                        AutoSizeText(
                                                                      getJsonField(
                                                                                widget.resDetailsEdit,
                                                                                r'''$.tables''',
                                                                              ) ==
                                                                              FFAppState().emptArray
                                                                          ? '\"Not allocated to a table\"'
                                                                          : getJsonField(
                                                                              widget.resDetailsEdit,
                                                                              r'''$.tables''',
                                                                            ).toString(),
                                                                      maxLines:
                                                                          4,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).subtitle2Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).iconGray,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                          ),
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
                                            16, 12, 16, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Available Actions',
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
                                            16, 0, 16, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 40,
                                                    icon: Icon(
                                                      Icons.group_add,
                                                      color: Color(0xFF57636C),
                                                      size: 30,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  AutoSizeText(
                                                    'Allocate to Table',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      if ((FFAppState().resFirstName != null && FFAppState().resFirstName != '') ||
                                                          (FFAppState().isVIP !=
                                                              null) ||
                                                          (FFAppState()
                                                                      .resEmail !=
                                                                  null &&
                                                              FFAppState()
                                                                      .resEmail !=
                                                                  '') ||
                                                          (FFAppState()
                                                                      .resPhone !=
                                                                  null &&
                                                              FFAppState()
                                                                      .resPhone !=
                                                                  '') ||
                                                          (FFAppState()
                                                                      .resLastName !=
                                                                  null &&
                                                              FFAppState()
                                                                      .resLastName !=
                                                                  '')) {
                                                        aPIUpdateCustomer =
                                                            await ValetAPIGroup
                                                                .updateCustomerCall
                                                                .call(
                                                          customerId:
                                                              getJsonField(
                                                            widget
                                                                .resDetailsEdit,
                                                            r'''$.customer.id''',
                                                          ),
                                                          firstName:
                                                              FFAppState()
                                                                  .resFirstName,
                                                          lastName: FFAppState()
                                                              .resLastName,
                                                          email: FFAppState()
                                                              .resEmail,
                                                          phone: FFAppState()
                                                              .resPhone,
                                                          isVip: FFAppState()
                                                              .isVIP,
                                                        );
                                                        if ((aPIUpdateCustomer
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Customer Successfully Updated',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                            ),
                                                          );
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                content: Text(
                                                                    getJsonField(
                                                                  (aPIUpdateCustomer
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.detail''',
                                                                ).toString()),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }
                                                      } else {
                                                        setState(() =>
                                                            FFAppState()
                                                                    .resCustomerId =
                                                                getJsonField(
                                                              widget
                                                                  .resDetailsEdit,
                                                              r'''$.customer.id''',
                                                            ));
                                                        aPIUpdateReservationResult =
                                                            await ValetAPIGroup
                                                                .updateReservationCall
                                                                .call(
                                                          reservationId:
                                                              getJsonField(
                                                            widget
                                                                .resDetailsEdit,
                                                            r'''$.id''',
                                                          ),
                                                          customerId:
                                                              FFAppState()
                                                                  .resCustomerId,
                                                          sittingId:
                                                              getJsonField(
                                                            widget
                                                                .resDetailsEdit,
                                                            r'''$.sittingId''',
                                                          ),
                                                          duration: int.parse(
                                                              durationController!
                                                                  .text),
                                                          noGuests: int.parse(
                                                              noGuestsController!
                                                                  .text),
                                                          source: sourceValue,
                                                          status: sourceValue,
                                                          notes:
                                                              notesController!
                                                                  .text,
                                                          areaId: getJsonField(
                                                            widget
                                                                .resDetailsEdit,
                                                            r'''$.area.id''',
                                                          ),
                                                          dateTime: functions
                                                              .formatDateTimeForPOST(
                                                                  datePicked!),
                                                        );
                                                        if ((aPIUpdateReservationResult
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Reservation Updated Successfully',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                            ),
                                                          );
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                content: Text(
                                                                    getJsonField(
                                                                  (aPIUpdateReservationResult
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.detail''',
                                                                ).toString()),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }
                                                      }

                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.save_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Save',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0,
                                                    buttonSize: 40,
                                                    icon: Icon(
                                                      Icons.delete_rounded,
                                                      color: Color(0xFFDF3F3F),
                                                      size: 30,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Text(
                                                    'Delete',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
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
