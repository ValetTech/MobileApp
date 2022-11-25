import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/end_drawer_container_widget.dart';
import '../components/page_name_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({
    Key? key,
    this.table,
  }) : super(key: key);

  final String? table;

  @override
  _OrderSummaryWidgetState createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  CartRecord? addItemQty;
  OrdersRecord? newOrder;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ORDER_SUMMARY_OrderSummary_ON_LOAD');
      logFirebaseEvent('OrderSummary_backend_call');

      final ordersCreateData = createOrdersRecordData(
        table: widget.table,
        dateCreated: getCurrentTimestamp,
        isOpen: true,
      );
      var ordersRecordReference = OrdersRecord.collection.doc();
      await ordersRecordReference.set(ordersCreateData);
      newOrder = OrdersRecord.getDocumentFromData(
          ordersCreateData, ordersRecordReference);
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OrderSummary'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'OrderSummary',
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
                          pageName: 'Order Summary',
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
                    logFirebaseEvent('ORDER_SUMMARY_PAGE_menu_ICN_ON_TAP');
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
                height: double.infinity,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 8, 4, 8),
                                        child: SelectionArea(
                                            child: Text(
                                          'Order Details for Table ${widget.table}:',
                                          style: FlutterFlowTheme.of(context)
                                              .title3,
                                        )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
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
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StreamBuilder<List<MenuRecord>>(
                                      stream: queryMenuRecord(),
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
                                            listViewMenuRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewMenuRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewMenuRecord =
                                                listViewMenuRecordList[
                                                    listViewIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 8, 0, 8),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 4),
                                                          child: AutoSizeText(
                                                            FFAppState()
                                                                .usercart
                                                                .where((e) =>
                                                                    e ==
                                                                    listViewMenuRecord
                                                                        .reference)
                                                                .toList()
                                                                .contains(
                                                                    listViewMenuRecord
                                                                        .reference)
                                                                .toString(),
                                                            maxLines: 3,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2,
                                                          ),
                                                        ),
                                                        Text(
                                                          FFAppState()
                                                              .itemqty
                                                              .contains(
                                                                  listViewIndex)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .iconGray,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText2Family),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'ORDER_SUMMARY_PAGE_Icon_7rxhk8lo_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_update_local_state');
                                                      setState(() => FFAppState()
                                                          .removeFromItemqty(
                                                              -1));
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_left_rounded,
                                                      color: Colors.black,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFAppState()
                                                      .itemqty
                                                      .contains(listViewIndex)
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'ORDER_SUMMARY_PAGE_Icon_pdxa2x6k_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_update_local_state');
                                                      setState(() =>
                                                          FFAppState()
                                                              .addToItemqty(1));
                                                      logFirebaseEvent(
                                                          'Icon_update_local_state');
                                                      setState(() => FFAppState()
                                                          .cartsum = FFAppState()
                                                              .cartsum +
                                                          functions.returncartprice(
                                                              listViewMenuRecord
                                                                  .price!));
                                                      logFirebaseEvent(
                                                          'Icon_update_local_state');
                                                      setState(() => FFAppState()
                                                              .itemcount =
                                                          FFAppState()
                                                                  .itemcount +
                                                              1);
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right_rounded,
                                                      color: Colors.black,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'ORDER_SUMMARY_PAGE_Icon_8azg7u7a_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_update_local_state');
                                                      setState(() {
                                                        FFAppState()
                                                            .deleteUsercart();
                                                        FFAppState().usercart =
                                                            [];
                                                      });
                                                      logFirebaseEvent(
                                                          'Icon_update_local_state');
                                                      setState(() {
                                                        FFAppState()
                                                            .deleteItemqty();
                                                        FFAppState().itemqty =
                                                            [];
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.delete_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 30,
                                                    ),
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
                        ],
                      ),
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
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                            currency: '\$ ',
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
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 24, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ORDER_SUMMARY_PAGE_CartButton_ON_TAP');
                            logFirebaseEvent('CartButton_backend_call');

                            final cartCreateData = {
                              'item_ref': [newOrder!.itemRef],
                              'qty': [newOrder!.qty],
                            };
                            var cartRecordReference =
                                CartRecord.collection.doc();
                            await cartRecordReference.set(cartCreateData);
                            addItemQty = CartRecord.getDocumentFromData(
                                cartCreateData, cartRecordReference);
                            logFirebaseEvent('CartButton_backend_call');

                            final ordersUpdateData = {
                              ...createOrdersRecordData(
                                itemRef: newOrder!.itemRef,
                              ),
                              'qty': FieldValue.increment(
                                  FFAppState().itemqty.length),
                            };
                            await newOrder!.reference.update(ordersUpdateData);
                            logFirebaseEvent('CartButton_navigate_to');

                            context.goNamed('Orders');

                            setState(() {});
                          },
                          text: ' ',
                          icon: Icon(
                            Icons.send_rounded,
                            size: 50,
                          ),
                          options: FFButtonOptions(
                            width: 75,
                            height: 75,
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
                          showLoadingIndicator: false,
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
