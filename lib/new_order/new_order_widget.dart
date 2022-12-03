import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_container_widget.dart';
import '../components/page_name_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NewOrderWidget extends StatefulWidget {
  const NewOrderWidget({
    Key? key,
    this.table,
  }) : super(key: key);

  final String? table;

  @override
  _NewOrderWidgetState createState() => _NewOrderWidgetState();
}

class _NewOrderWidgetState extends State<NewOrderWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1250.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1250.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  String? tableSelectionValue;
  ValueNotifier<List<String>?> choiceChipsValues = ValueNotifier(null);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEW_ORDER_PAGE_NewOrder_ON_PAGE_LOAD');
      logFirebaseEvent('NewOrder_update_local_state');
      setState(() {
        FFAppState().deleteItemqty();
        FFAppState().itemqty = [];
      });
      logFirebaseEvent('NewOrder_update_local_state');
      setState(() {
        FFAppState().deleteItemcount();
        FFAppState().itemcount = 0;
      });
      logFirebaseEvent('NewOrder_update_local_state');
      setState(() {
        FFAppState().deleteCartsum();
        FFAppState().cartsum = 0.0;
      });
      logFirebaseEvent('NewOrder_update_local_state');
      setState(() {
        FFAppState().deleteUsercart();
        FFAppState().usercart = [];
      });
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'NewOrder'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'NewOrder',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          endDrawer: Container(
            width: 250,
            child: Drawer(
              elevation: 16,
              child: EndDrawerContainerWidget(
                pageName: 'New Order',
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: PageNameWidget(
                          pageName: 'New Order',
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
                    logFirebaseEvent('NEW_ORDER_PAGE_menu_ICN_ON_TAP');
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                            child: FutureBuilder<ApiCallResponse>(
                              future: ValetAPIGroup.gETTablesCall.call(
                                token: FFAppState().token,
                              ),
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
                                final columnGETTablesResponse = snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 6),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 8, 0),
                                            child: Icon(
                                              Icons.library_add,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                          ),
                                          Expanded(
                                            child: FlutterFlowDropDown<String>(
                                              initialOption:
                                                  tableSelectionValue ??=
                                                      widget.table != null &&
                                                              widget.table != ''
                                                          ? widget.table
                                                          : '',
                                              options: (ValetAPIGroup
                                                      .gETTablesCall
                                                      .tableType(
                                                columnGETTablesResponse
                                                    .jsonBody,
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()
                                                  .toList(),
                                              onChanged: (val) => setState(() =>
                                                  tableSelectionValue = val),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                              hintText: 'Please Select A Table',
                                              elevation: 2,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0,
                                              borderRadius: 0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(12, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (() {
                                if (widget.table != null &&
                                    widget.table != '') {
                                  return true;
                                } else if (tableSelectionValue != null &&
                                    tableSelectionValue != '') {
                                  return true;
                                } else {
                                  return false;
                                }
                              }())
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 0),
                                  child: Container(
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
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (FFAppState().filtersOn == true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 4, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NEW_ORDER_PAGE_Icon_10z2b0ra_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_update_local_state');
                                                setState(() => FFAppState()
                                                    .filtersOn = false);
                                                logFirebaseEvent(
                                                    'Icon_clear_all_select_all');
                                                setState(() => choiceChipsValues
                                                    .value = []);
                                                logFirebaseEvent(
                                                    'Icon_navigate_to');

                                                context.pushNamed(
                                                  'NewOrder',
                                                  queryParams: {
                                                    'table': serializeParam(
                                                      tableSelectionValue,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Icon(
                                                Icons.cancel,
                                                color: Color(0xFFDF3F3F),
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().filtersOn == false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 4, 0),
                                            child: Icon(
                                              Icons.filter_alt_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .iconGray,
                                              size: 24,
                                            ),
                                          ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Wrap(
                                                  spacing: 0,
                                                  runSpacing: 0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.vertical,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.antiAlias,
                                                  children: [
                                                    FutureBuilder<
                                                        List<CategoriesRecord>>(
                                                      future:
                                                          queryCategoriesRecordOnce(
                                                        queryBuilder:
                                                            (categoriesRecord) =>
                                                                categoriesRecord
                                                                    .orderBy(
                                                                        'id'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<CategoriesRecord>
                                                            choiceChipsCategoriesRecordList =
                                                            snapshot.data!;
                                                        return FlutterFlowChoiceChips(
                                                          options: choiceChipsCategoriesRecordList
                                                              .map((e) =>
                                                                  e.title!)
                                                              .toList()
                                                              .where((e) =>
                                                                  e != null &&
                                                                  e != '')
                                                              .toList()
                                                              .map((label) =>
                                                                  ChipData(
                                                                      label))
                                                              .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            setState(() =>
                                                                choiceChipsValues
                                                                        .value =
                                                                    val);
                                                            logFirebaseEvent(
                                                                'NEW_ORDER_ChoiceChips_cnfhv9vl_ON_FORM_W');
                                                            logFirebaseEvent(
                                                                'ChoiceChips_update_local_state');
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
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
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
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .iconGray,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText2Family),
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
                                                              choiceChipsValues
                                                                      .value !=
                                                                  null,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          selectedValuesVariable:
                                                              choiceChipsValues,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (() {
                                      if (widget.table != null &&
                                          widget.table != '') {
                                        return true;
                                      } else if (tableSelectionValue != null &&
                                          tableSelectionValue != '') {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    }())
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 16, 0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: FutureBuilder<
                                              List<CategoriesRecord>>(
                                            future: queryCategoriesRecordOnce(
                                              queryBuilder:
                                                  (categoriesRecord) =>
                                                      categoriesRecord
                                                          .orderBy('id'),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      size: 40,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CategoriesRecord>
                                                  listViewCategoriesRecordList =
                                                  snapshot.data!;
                                              if (listViewCategoriesRecordList
                                                  .isEmpty) {
                                                return Center(
                                                  child: Image.asset(
                                                    'assets/images/Screenshot_2022-10-21_at_10.24.55_pm.png',
                                                  ),
                                                );
                                              }
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewCategoriesRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewCategoriesRecord =
                                                      listViewCategoriesRecordList[
                                                          listViewIndex];
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (choiceChipsValues
                                                                .value
                                                                ?.contains(
                                                                    listViewCategoriesRecord
                                                                        .title) ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              listViewCategoriesRecord
                                                                  .title!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1,
                                                            ),
                                                          ),
                                                        if (choiceChipsValues
                                                                .value
                                                                ?.contains(
                                                                    listViewCategoriesRecord
                                                                        .title) ??
                                                            true)
                                                          FutureBuilder<
                                                              List<MenuRecord>>(
                                                            future:
                                                                queryMenuRecordOnce(
                                                              queryBuilder: (menuRecord) =>
                                                                  menuRecord.where(
                                                                      'category',
                                                                      isEqualTo:
                                                                          listViewCategoriesRecord
                                                                              .title),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 40,
                                                                    height: 40,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      size: 40,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<MenuRecord>
                                                                  menuListViewMenuRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              if (menuListViewMenuRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/Screenshot_2022-10-21_at_10.24.55_pm.png',
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.5,
                                                                  ),
                                                                );
                                                              }
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    menuListViewMenuRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        menuListViewIndex) {
                                                                  final menuListViewMenuRecord =
                                                                      menuListViewMenuRecordList[
                                                                          menuListViewIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            4,
                                                                            0,
                                                                            4),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                    child: Image.network(
                                                                                      menuListViewMenuRecord.image!,
                                                                                      width: 100,
                                                                                      height: 66,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12, 8, 0, 8),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                                                            child: Text(
                                                                                              menuListViewMenuRecord.name!,
                                                                                              style: FlutterFlowTheme.of(context).subtitle2,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.attach_money_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).iconGray,
                                                                                                  size: 16,
                                                                                                ),
                                                                                                Text(
                                                                                                  menuListViewMenuRecord.price!.toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        color: FlutterFlowTheme.of(context).iconGray,
                                                                                                        fontSize: 14,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                  child: Text(
                                                                                                    menuListViewMenuRecord.description!,
                                                                                                    maxLines: 3,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: FlutterFlowTheme.of(context).iconGray,
                                                                                                          fontSize: 12,
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          if (FFAppState().usercart.contains(menuListViewMenuRecord.reference))
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                              child: InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('NEW_ORDER_PAGE_Icon_603uujuj_ON_TAP');
                                                                                                  logFirebaseEvent('Icon_update_local_state');
                                                                                                  setState(() => FFAppState().removeFromUsercart(menuListViewMenuRecord.reference));
                                                                                                  logFirebaseEvent('Icon_update_local_state');
                                                                                                  setState(() => FFAppState().cartsum = FFAppState().cartsum + functions.returncartprice(menuListViewMenuRecord.price!));
                                                                                                  logFirebaseEvent('Icon_update_local_state');
                                                                                                  setState(() => FFAppState().itemcount = FFAppState().itemcount + -1);
                                                                                                  logFirebaseEvent('Icon_backend_call');

                                                                                                  final menuUpdateData = {
                                                                                                    'cart_qty': FieldValue.increment(-(1)),
                                                                                                  };
                                                                                                  await menuListViewMenuRecord.reference.update(menuUpdateData);
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.remove_circle,
                                                                                                  color: FlutterFlowTheme.of(context).iconGray,
                                                                                                  size: 40,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                            child: InkWell(
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('NEW_ORDER_PAGE_Icon_60b1qbdu_ON_TAP');
                                                                                                logFirebaseEvent('Icon_update_local_state');
                                                                                                setState(() => FFAppState().addToUsercart(menuListViewMenuRecord.reference));
                                                                                                logFirebaseEvent('Icon_update_local_state');
                                                                                                setState(() => FFAppState().cartsum = FFAppState().cartsum + menuListViewMenuRecord.price!);
                                                                                                if (FFAppState().usercart.contains(menuListViewMenuRecord.reference)) {
                                                                                                  logFirebaseEvent('Icon_update_local_state');
                                                                                                  setState(() => FFAppState().itemcount = FFAppState().itemcount + 1);
                                                                                                } else {
                                                                                                  logFirebaseEvent('Icon_widget_animation');
                                                                                                  if (animationsMap['containerOnActionTriggerAnimation'] != null) {
                                                                                                    animationsMap['containerOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                                                  }
                                                                                                  logFirebaseEvent('Icon_update_local_state');
                                                                                                  setState(() => FFAppState().itemcount = FFAppState().itemcount + 1);
                                                                                                }

                                                                                                logFirebaseEvent('Icon_update_local_state');
                                                                                                setState(() => FFAppState().addToItemqty(1));
                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                final menuUpdateData = {
                                                                                                  'cart_qty': FieldValue.increment(1),
                                                                                                };
                                                                                                await menuListViewMenuRecord.reference.update(menuUpdateData);
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.add_circle,
                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                size: 40,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                      ],
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
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).secondaryColor,
                                Color(0xA9FFB703)
                              ],
                              stops: [0, 0.6],
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
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 6),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: Text(
                                          'Total: ',
                                          style: FlutterFlowTheme.of(context)
                                              .title2,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Text(
                                          formatNumber(
                                            FFAppState().cartsum,
                                            formatType: FormatType.custom,
                                            currency: '\$ ',
                                            format: '#####0.00',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title3
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .title3Family,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3Family),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation']!,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                        child: Badge(
                          badgeContent: Text(
                            valueOrDefault<String>(
                              FFAppState().itemcount.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                          showBadge: FFAppState().itemcount >= 1 ? true : false,
                          shape: BadgeShape.circle,
                          badgeColor: FlutterFlowTheme.of(context).primaryColor,
                          elevation: 4,
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          position: BadgePosition.topEnd(),
                          animationType: BadgeAnimationType.scale,
                          toAnimate: true,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NEW_ORDER_PAGE_CartButton_ON_TAP');
                                logFirebaseEvent('CartButton_navigate_to');

                                context.pushNamed(
                                  'OrderSummary',
                                  queryParams: {
                                    'table': serializeParam(
                                      tableSelectionValue,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: ' ',
                              icon: Icon(
                                Icons.shopping_cart_rounded,
                                size: 50,
                              ),
                              options: FFButtonOptions(
                                width: 75,
                                height: 75,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
                                      letterSpacing: 1,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family),
                                    ),
                                elevation: 6,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              showLoadingIndicator: false,
                            ),
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
}
