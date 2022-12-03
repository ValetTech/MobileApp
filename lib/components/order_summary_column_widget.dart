import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummaryColumnWidget extends StatefulWidget {
  const OrderSummaryColumnWidget({
    Key? key,
    this.table,
  }) : super(key: key);

  final String? table;

  @override
  _OrderSummaryColumnWidgetState createState() =>
      _OrderSummaryColumnWidgetState();
}

class _OrderSummaryColumnWidgetState extends State<OrderSummaryColumnWidget> {
  @override
  void initState() {
    super.initState();

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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primaryBackground,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 8, 4, 8),
                        child: SelectionArea(
                            child: Text(
                          'Order Details for Table ${widget.table}:',
                          style: FlutterFlowTheme.of(context).title3,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<List<MenuRecord>>(
                    stream: queryMenuRecord(
                      queryBuilder: (menuRecord) => menuRecord.where('cart_qty',
                          isGreaterThanOrEqualTo: 1),
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
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 40,
                            ),
                          ),
                        );
                      }
                      List<MenuRecord> listViewMenuRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewMenuRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewMenuRecord =
                              listViewMenuRecordList[listViewIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 8, 0, 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: AutoSizeText(
                                          listViewMenuRecord.name!,
                                          maxLines: 3,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                      ),
                                      Text(
                                        '${listViewMenuRecord.cartQty?.toString()} x ${listViewMenuRecord.price?.toString()} = ${formatNumber(
                                          functions.pricexqty(
                                              listViewMenuRecord.price!,
                                              listViewMenuRecord.cartQty!),
                                          formatType: FormatType.decimal,
                                          decimalType:
                                              DecimalType.periodDecimal,
                                          currency: '\$ ',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .iconGray,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ORDER_SUMMARY_COLUMN_Icon_ym0qfucb_ON_TA');
                                    logFirebaseEvent('Icon_update_local_state');
                                    setState(() =>
                                        FFAppState().removeFromItemqty(-1));
                                    logFirebaseEvent('Icon_update_local_state');
                                    setState(() => FFAppState().cartsum =
                                        FFAppState().cartsum +
                                            functions.returncartprice(
                                                listViewMenuRecord.price!));
                                    logFirebaseEvent('Icon_backend_call');

                                    final menuUpdateData = {
                                      'cart_qty': FieldValue.increment(-(1)),
                                    };
                                    await listViewMenuRecord.reference
                                        .update(menuUpdateData);
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_left_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Text(
                                listViewMenuRecord.cartQty!.toString(),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ORDER_SUMMARY_COLUMN_Icon_iylce63x_ON_TA');
                                    logFirebaseEvent('Icon_update_local_state');
                                    setState(
                                        () => FFAppState().addToItemqty(1));
                                    logFirebaseEvent('Icon_update_local_state');
                                    setState(() => FFAppState().cartsum =
                                        FFAppState().cartsum +
                                            functions.returncartprice(
                                                listViewMenuRecord.price!));
                                    logFirebaseEvent('Icon_update_local_state');
                                    setState(() => FFAppState().itemcount =
                                        FFAppState().itemcount + 1);
                                    logFirebaseEvent('Icon_backend_call');

                                    final menuUpdateData = {
                                      'cart_qty': FieldValue.increment(1),
                                    };
                                    await listViewMenuRecord.reference
                                        .update(menuUpdateData);
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_right_rounded,
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
                                        'ORDER_SUMMARY_COLUMN_Icon_x053cvs9_ON_TA');
                                    logFirebaseEvent('Icon_update_local_state');
                                    setState(() {
                                      FFAppState().deleteUsercart();
                                      FFAppState().usercart = [];
                                    });
                                    logFirebaseEvent('Icon_update_local_state');
                                    setState(() {
                                      FFAppState().deleteItemqty();
                                      FFAppState().itemqty = [];
                                    });
                                    logFirebaseEvent('Icon_backend_call');

                                    final menuUpdateData = createMenuRecordData(
                                      cartQty: 0,
                                    );
                                    await listViewMenuRecord.reference
                                        .update(menuUpdateData);
                                  },
                                  child: Icon(
                                    Icons.delete_rounded,
                                    color: FlutterFlowTheme.of(context)
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
        ],
      ),
    );
  }
}
