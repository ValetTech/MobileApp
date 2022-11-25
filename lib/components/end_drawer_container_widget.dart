import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EndDrawerContainerWidget extends StatefulWidget {
  const EndDrawerContainerWidget({
    Key? key,
    this.pageName,
  }) : super(key: key);

  final String? pageName;

  @override
  _EndDrawerContainerWidgetState createState() =>
      _EndDrawerContainerWidgetState();
}

class _EndDrawerContainerWidgetState extends State<EndDrawerContainerWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Material(
            color: Colors.transparent,
            elevation: 6,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: Image.asset(
                    'assets/images/Picture_1.png',
                  ).image,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(-2, -2),
                    spreadRadius: 4,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/images/FB_IMG_1609522257085_2.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                        child: AuthUserStreamWidget(
                          child: Text(
                            '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                            style: FlutterFlowTheme.of(context)
                                .subtitle1
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle1Family),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).iconGray,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget.pageName == 'Dashboard'
                            ? Color(0x7FFFFFFF)
                            : Colors.transparent,
                        Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'END_DRAWER_CONTAINER_DashboardRow_ON_TAP');
                        logFirebaseEvent('DashboardRow_navigate_to');

                        context.pushNamed('Dashboard');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                            child: Icon(
                              Icons.dashboard,
                              color: valueOrDefault<Color>(
                                widget.pageName == 'Dashboard'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryColor
                                    : FlutterFlowTheme.of(context).white,
                                FlutterFlowTheme.of(context).white,
                              ),
                              size: 24,
                            ),
                          ),
                          Text(
                            'Dashboard',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: FlutterFlowTheme.of(context).white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).iconGray,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget.pageName == 'Reservations'
                            ? Color(0x7FFFFFFF)
                            : Colors.transparent,
                        Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'END_DRAWER_CONTAINER_ViewEditResRow_ON_T');
                        logFirebaseEvent('ViewEditResRow_navigate_to');

                        context.pushNamed('Reservations');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                            child: Icon(
                              Icons.calendar_today_rounded,
                              color: valueOrDefault<Color>(
                                widget.pageName == 'Reservations'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryColor
                                    : FlutterFlowTheme.of(context).white,
                                FlutterFlowTheme.of(context).white,
                              ),
                              size: 24,
                            ),
                          ),
                          Text(
                            'View Reservations',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: FlutterFlowTheme.of(context).white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'END_DRAWER_CONTAINER_Container_fccmm6xt_');
                      logFirebaseEvent('Container_navigate_to');

                      context.pushNamed('Allocate');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          widget.pageName == 'Allocate'
                              ? Color(0x7FFFFFFF)
                              : Colors.transparent,
                          Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                            child: Icon(
                              Icons.group_add,
                              color: valueOrDefault<Color>(
                                widget.pageName == 'Allocate'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryColor
                                    : FlutterFlowTheme.of(context).white,
                                FlutterFlowTheme.of(context).white,
                              ),
                              size: 24,
                            ),
                          ),
                          Text(
                            'Allocate To Table',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: FlutterFlowTheme.of(context).white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).iconGray,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget.pageName == 'Seating'
                            ? Color(0x7FFFFFFF)
                            : Colors.transparent,
                        Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'END_DRAWER_CONTAINER_SeatingRow_ON_TAP');
                        logFirebaseEvent('SeatingRow_navigate_to');

                        context.pushNamed('Seating');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                            child: Icon(
                              Icons.table_chart,
                              color: valueOrDefault<Color>(
                                widget.pageName == 'Seating'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryColor
                                    : FlutterFlowTheme.of(context).white,
                                FlutterFlowTheme.of(context).white,
                              ),
                              size: 24,
                            ),
                          ),
                          Text(
                            'View Seating',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: FlutterFlowTheme.of(context).white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).iconGray,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget.pageName == 'New Order'
                            ? Color(0x7FFFFFFF)
                            : Colors.transparent,
                        Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'END_DRAWER_CONTAINER_NewOrderRow_ON_TAP');
                        logFirebaseEvent('NewOrderRow_navigate_to');

                        context.pushNamed('NewOrder');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                            child: Icon(
                              Icons.post_add_rounded,
                              color: valueOrDefault<Color>(
                                widget.pageName == 'New Order'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryColor
                                    : FlutterFlowTheme.of(context).white,
                                FlutterFlowTheme.of(context).white,
                              ),
                              size: 24,
                            ),
                          ),
                          Text(
                            'New Order',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: FlutterFlowTheme.of(context).white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.pageName == 'Orders'
                          ? Color(0x7FFFFFFF)
                          : Colors.transparent,
                      Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'END_DRAWER_CONTAINER_ViewOrderRow_ON_TAP');
                      logFirebaseEvent('ViewOrderRow_navigate_to');

                      context.pushNamed('Orders');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                          child: Icon(
                            Icons.payment_rounded,
                            color: valueOrDefault<Color>(
                              widget.pageName == 'View Orders'
                                  ? FlutterFlowTheme.of(context).secondaryColor
                                  : FlutterFlowTheme.of(context).white,
                              FlutterFlowTheme.of(context).white,
                            ),
                            size: 24,
                          ),
                        ),
                        Text(
                          'View Orders',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                color: FlutterFlowTheme.of(context).white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2Family),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget.pageName == 'Menu'
                            ? Color(0x7FFFFFFF)
                            : Colors.transparent,
                        Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'END_DRAWER_CONTAINER_COMP_MenuRow_ON_TAP');
                        logFirebaseEvent('MenuRow_navigate_to');

                        context.pushNamed('Menu');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                            child: Icon(
                              Icons.fastfood_rounded,
                              color: valueOrDefault<Color>(
                                widget.pageName == 'Menu'
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryColor
                                    : FlutterFlowTheme.of(context).white,
                                FlutterFlowTheme.of(context).white,
                              ),
                              size: 24,
                            ),
                          ),
                          Text(
                            'View Menu',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .subtitle2Family,
                                  color: FlutterFlowTheme.of(context).white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .subtitle2Family),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).iconGray,
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1, 1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 80),
              child: InkWell(
                onTap: () async {
                  logFirebaseEvent('END_DRAWER_CONTAINER_LogoutRow_ON_TAP');
                  logFirebaseEvent('LogoutRow_auth');
                  GoRouter.of(context).prepareAuthEvent();
                  await signOut();

                  context.goNamedAuth('mainLogin', mounted);
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                        child: Icon(
                          Icons.logout,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Logout',
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).subtitle1Family,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).subtitle1Family),
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
    );
  }
}
