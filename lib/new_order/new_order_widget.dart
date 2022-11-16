import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_container_widget.dart';
import '../components/page_name_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NewOrderWidget extends StatefulWidget {
  const NewOrderWidget({Key? key}) : super(key: key);

  @override
  _NewOrderWidgetState createState() => _NewOrderWidgetState();
}

class _NewOrderWidgetState extends State<NewOrderWidget> {
  OrdersRecord? currentTableOrder;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? dropDownValue;
  ValueNotifier<List<String>?> choiceChipsValues = ValueNotifier(null);
  int? countControllerValue;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final ordersCreateData = createOrdersRecordData(
        status: 'Open',
        date: getCurrentTimestamp,
      );
      var ordersRecordReference = OrdersRecord.collection.doc();
      await ordersRecordReference.set(ordersCreateData);
      currentTableOrder = OrdersRecord.getDocumentFromData(
          ordersCreateData, ordersRecordReference);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoriesRecord>>(
      future: queryCategoriesRecordOnce(
        queryBuilder: (categoriesRecord) => categoriesRecord.orderBy('id'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).secondaryColor,
                size: 40,
              ),
            ),
          );
        }
        List<CategoriesRecord> newOrderCategoriesRecordList = snapshot.data!;
        return Title(
            title: 'NewOrder',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: EndDrawerContainerWidget(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
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
                        scaffoldKey.currentState!.openDrawer();
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
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
                                      FutureBuilder<ApiCallResponse>(
                                        future:
                                            ValetAPIGroup.gETTablesCall.call(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: SpinKitRipple(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  size: 40,
                                                ),
                                              ),
                                            );
                                          }
                                          final dropDownGETTablesResponse =
                                              snapshot.data!;
                                          return FlutterFlowDropDown(
                                            options: (ValetAPIGroup
                                                    .gETTablesCall
                                                    .tableType(
                                              dropDownGETTablesResponse
                                                  .jsonBody,
                                            ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList()
                                                .toList(),
                                            onChanged: (val) async {
                                              setState(
                                                  () => dropDownValue = val);
                                              final ordersUpdateData =
                                                  createOrdersRecordData(
                                                tableId:
                                                    functions.getTableIdByType(
                                                        dropDownValue,
                                                        ValetAPIGroup
                                                            .gETTablesCall
                                                            .tables(
                                                              dropDownGETTablesResponse
                                                                  .jsonBody,
                                                            )
                                                            .toList()),
                                              );
                                              await currentTableOrder!.reference
                                                  .update(ordersUpdateData);
                                            },
                                            width: double.infinity,
                                            height: 50,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family,
                                                      color: Colors.black,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family),
                                                    ),
                                            hintText: 'Please select table...',
                                            elevation: 2,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0,
                                            borderRadius: 0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 4, 12, 4),
                                            hidesUnderline: true,
                                          );
                                        },
                                      ),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                        choiceChipsValues
                                                            .value = []);
                                                  },
                                                  child: Icon(
                                                    Icons.cancel,
                                                    color: Color(0xFFDF3F3F),
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 0, 0),
                                              child: Wrap(
                                                spacing: 8,
                                                runSpacing: 8,
                                                alignment: WrapAlignment.start,
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
                                          Builder(
                                            builder: (context) {
                                              final categoryListView =
                                                  newOrderCategoriesRecordList
                                                      .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    categoryListView.length,
                                                itemBuilder: (context,
                                                    categoryListViewIndex) {
                                                  final categoryListViewItem =
                                                      categoryListView[
                                                          categoryListViewIndex];
                                                  return Stack(
                                                    children: [
                                                      if (choiceChipsValues
                                                              .value
                                                              ?.contains(
                                                                  categoryListViewItem
                                                                      .title) ??
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            categoryListViewItem
                                                                .title!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1,
                                                          ),
                                                        ),
                                                      if (choiceChipsValues
                                                              .value
                                                              ?.contains(
                                                                  categoryListViewItem
                                                                      .title) ??
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      18, 0, 0),
                                                          child: StreamBuilder<
                                                              List<MenuRecord>>(
                                                            stream:
                                                                queryMenuRecord(
                                                              queryBuilder: (menuRecord) => menuRecord
                                                                  .where(
                                                                      'category',
                                                                      isEqualTo:
                                                                          categoryListViewItem
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
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 50,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Colors.white,
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                              shape: BoxShape.rectangle,
                                                                                              border: Border.all(
                                                                                                color: Color(0xFF9E9E9E),
                                                                                                width: 2,
                                                                                              ),
                                                                                            ),
                                                                                            child: FlutterFlowCountController(
                                                                                              decrementIconBuilder: (enabled) => FaIcon(
                                                                                                FontAwesomeIcons.minus,
                                                                                                color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                                                                                                size: 20,
                                                                                              ),
                                                                                              incrementIconBuilder: (enabled) => FaIcon(
                                                                                                FontAwesomeIcons.plus,
                                                                                                color: enabled ? FlutterFlowTheme.of(context).secondaryColor : Color(0xFFEEEEEE),
                                                                                                size: 20,
                                                                                              ),
                                                                                              countBuilder: (count) => Text(
                                                                                                count.toString(),
                                                                                                style: GoogleFonts.getFont(
                                                                                                  'Roboto',
                                                                                                  color: Colors.black,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontSize: 16,
                                                                                                ),
                                                                                              ),
                                                                                              count: countControllerValue ??= 0,
                                                                                              updateCount: (count) async {
                                                                                                setState(() => countControllerValue = count);
                                                                                                final ordersUpdateData = {
                                                                                                  'items': FieldValue.arrayUnion([
                                                                                                    getOrderItemFirestoreData(
                                                                                                      createOrderItemStruct(
                                                                                                        itemId: categoryListViewIndex,
                                                                                                        unitPrice: menuListViewMenuRecord.price,
                                                                                                        fieldValues: {
                                                                                                          'quantity': FieldValue.increment(countControllerValue!),
                                                                                                        },
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                      true,
                                                                                                    )
                                                                                                  ]),
                                                                                                };
                                                                                                await currentTableOrder!.reference.update(ordersUpdateData);
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Item added: ${menuListViewMenuRecord.name}',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: Color(0x00000000),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              stepSize: 1,
                                                                                              minimum: 0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
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
                          alignment: AlignmentDirectional(1, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('NewOrder');
                              },
                              text: 'New Order',
                              icon: Icon(
                                Icons.post_add_rounded,
                                size: 30,
                              ),
                              options: FFButtonOptions(
                                width: 175,
                                height: 50,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
