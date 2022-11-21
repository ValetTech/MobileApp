import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_container_widget.dart';
import '../components/page_name_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

class _NewOrderWidgetState extends State<NewOrderWidget> {
  CartRecord? newCart;
  String? tableSelectionValue;
  ValueNotifier<List<String>?> choiceChipsValues = ValueNotifier(null);
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final cartUpdateData = createCartRecordData(
        qty: 0,
      );
      await newCart!.reference.update(cartUpdateData);
    });

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
                    Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                                                  4, 0, 16, 0),
                                          child: Icon(
                                            Icons.library_add,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                        ),
                                        Expanded(
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: ValetAPIGroup.gETTablesCall
                                                .call(),
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
                                              final tableSelectionGETTablesResponse =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<
                                                  String>(
                                                initialOption:
                                                    tableSelectionValue ??=
                                                        widget.table != null &&
                                                                widget.table !=
                                                                    ''
                                                            ? widget.table
                                                            : '',
                                                options: (ValetAPIGroup
                                                        .gETTablesCall
                                                        .tableType(
                                                  tableSelectionGETTablesResponse
                                                      .jsonBody,
                                                ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()
                                                    .toList(),
                                                onChanged: (val) => setState(
                                                    () => tableSelectionValue =
                                                        val),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                                hintText:
                                                    'Please Select Table For The Order',
                                                elevation: 2,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0,
                                                borderRadius: 0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 12, 4),
                                                hidesUnderline: true,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                              ),
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
                                                      choiceChipsValues.value =
                                                          []);

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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 0, 0),
                                            child: Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.vertical,
                                              runAlignment: WrapAlignment.start,
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
                                                                .orderBy('id'),
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
                                                    List<CategoriesRecord>
                                                        choiceChipsCategoriesRecordList =
                                                        snapshot.data!;
                                                    return FlutterFlowChoiceChips(
                                                      options:
                                                          choiceChipsCategoriesRecordList
                                                              .map((e) =>
                                                                  e.title!)
                                                              .toList()
                                                              .map((label) =>
                                                                  ChipData(
                                                                      label))
                                                              .toList(),
                                                      onChanged: (val) async {
                                                        setState(() =>
                                                            choiceChipsValues
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
                                                          choiceChipsValues
                                                                  .value !=
                                                              null,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      selectedValuesVariable:
                                                          choiceChipsValues,
                                                    );
                                                  },
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
                          if (() {
                            if (widget.table != null && widget.table != '') {
                              return true;
                            } else if (tableSelectionValue != null &&
                                tableSelectionValue != '') {
                              return true;
                            } else {
                              return false;
                            }
                          }())
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 0),
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<CategoriesRecord>>(
                                                stream: queryCategoriesRecord(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          size: 40,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CategoriesRecord>
                                                      listViewCategoriesRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewCategoriesRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewCategoriesRecord =
                                                          listViewCategoriesRecordList[
                                                              listViewIndex];
                                                      return Stack(
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1,
                                                              ),
                                                            ),
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
                                                                          0,
                                                                          18,
                                                                          0,
                                                                          0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      MenuRecord>>(
                                                                future:
                                                                    queryMenuRecordOnce(
                                                                  queryBuilder: (menuRecord) => menuRecord
                                                                      .where(
                                                                          'category',
                                                                          isEqualTo: listViewCategoriesRecord
                                                                              .title)
                                                                      .whereIn(
                                                                          'category',
                                                                          choiceChipsValues
                                                                              .value)
                                                                      .orderBy(
                                                                          'price'),
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
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height: MediaQuery.of(context).size.height *
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12,
                                                                            4,
                                                                            0,
                                                                            4),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
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
                                                                                mainAxisSize: MainAxisSize.max,
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
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                            child: InkWell(
                                                                                              onTap: () async {
                                                                                                final cartCreateData = createCartRecordData(
                                                                                                  qty: 1,
                                                                                                  price: menuListViewMenuRecord.price,
                                                                                                  itemRef: menuListViewMenuRecord.reference,
                                                                                                );
                                                                                                var cartRecordReference = CartRecord.collection.doc();
                                                                                                await cartRecordReference.set(cartCreateData);
                                                                                                newCart = CartRecord.getDocumentFromData(cartCreateData, cartRecordReference);
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Added to Cart',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: Color(0x00000000),
                                                                                                  ),
                                                                                                );

                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.add_circle,
                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                size: 30,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                            child: InkWell(
                                                                                              onTap: () async {
                                                                                                final cartUpdateData = {
                                                                                                  ...createCartRecordData(
                                                                                                    itemRef: menuListViewMenuRecord.reference,
                                                                                                    price: menuListViewMenuRecord.price,
                                                                                                  ),
                                                                                                  'qty': FieldValue.increment(-(1)),
                                                                                                };
                                                                                                await newCart!.reference.update(cartUpdateData);
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Removed From Cart',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: Color(0x00000000),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.remove_circle_outlined,
                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                size: 30,
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
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 8, 0, 8),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                          ],
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
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Badge(
                        badgeContent: Text(
                          newCart!.qty!.toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                        showBadge: true,
                        shape: BadgeShape.circle,
                        badgeColor: FlutterFlowTheme.of(context).primaryColor,
                        elevation: 4,
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        position: BadgePosition.topEnd(),
                        animationType: BadgeAnimationType.scale,
                        toAnimate: true,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: StreamBuilder<List<MenuRecord>>(
                            stream: queryMenuRecord(
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      size: 40,
                                    ),
                                  ),
                                );
                              }
                              List<MenuRecord> cartButtonMenuRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final cartButtonMenuRecord =
                                  cartButtonMenuRecordList.isNotEmpty
                                      ? cartButtonMenuRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    'OrderSummary',
                                    queryParams: {
                                      'table': serializeParam(
                                        tableSelectionValue,
                                        ParamType.String,
                                      ),
                                      'items': serializeParam(
                                        newCart!.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: '',
                                icon: Icon(
                                  Icons.shopping_cart_rounded,
                                  size: 50,
                                ),
                                options: FFButtonOptions(
                                  width: 75,
                                  height: 75,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
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
                              );
                            },
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