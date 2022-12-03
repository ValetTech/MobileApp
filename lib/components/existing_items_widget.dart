import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/order_summary_column_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ExistingItemsWidget extends StatefulWidget {
  const ExistingItemsWidget({
    Key? key,
    this.table,
  }) : super(key: key);

  final String? table;

  @override
  _ExistingItemsWidgetState createState() => _ExistingItemsWidgetState();
}

class _ExistingItemsWidgetState extends State<ExistingItemsWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x25090F13),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'Continue With Cart?',
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Text(
                  'Review the items already in the cart below before continuing.',
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
              ),
              Divider(
                height: 24,
                thickness: 2,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              OrderSummaryColumnWidget(
                table: widget.table,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                        child: StreamBuilder<List<MenuRecord>>(
                          stream: queryMenuRecord(
                            queryBuilder: (menuRecord) => menuRecord
                                .where('cart_qty', isGreaterThanOrEqualTo: 1),
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
                            List<MenuRecord> buttonMenuRecordList =
                                snapshot.data!;
                            final buttonMenuRecord =
                                buttonMenuRecordList.isNotEmpty
                                    ? buttonMenuRecordList.first
                                    : null;
                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'EXISTING_ITEMS_CLEAR_CART_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                final menuUpdateData = {
                                  'cart_qty': FieldValue.delete(),
                                };
                                await buttonMenuRecord!.reference
                                    .update(menuUpdateData);
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'NewOrder',
                                  queryParams: {
                                    'table': serializeParam(
                                      widget.table,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Clear Cart',
                              icon: Icon(
                                Icons.clear_rounded,
                                size: 20,
                              ),
                              options: FFButtonOptions(
                                width: 175,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'EXISTING_ITEMS_COMP_CONTINUE_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'NewOrder',
                              queryParams: {
                                'table': serializeParam(
                                  widget.table,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Continue',
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 20,
                          ),
                          options: FFButtonOptions(
                            width: 175,
                            height: 40,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
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
    );
  }
}
