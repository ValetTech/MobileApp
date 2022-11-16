import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EndDrawerContainerWidget extends StatefulWidget {
  const EndDrawerContainerWidget({Key? key}) : super(key: key);

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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          random_data.randomImageUrl(
                            60,
                            60,
                          ),
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                  child: AuthUserStreamWidget(
                    child: Text(
                      currentUserDisplayName,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle1Family),
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 0, 12),
                      child: Text(
                        currentUserEmail,
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Icon(
                        Icons.arrow_drop_down_rounded,
                        color: FlutterFlowTheme.of(context).iconGray,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 2,
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).grayLines,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('Dashboard');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                          child: Icon(
                            Icons.dashboard,
                            color: FlutterFlowTheme.of(context).iconGray,
                            size: 24,
                          ),
                        ),
                        Text(
                          'Dashboard',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).grayLines,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('NewReservation');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                          child: FaIcon(
                            FontAwesomeIcons.calendarPlus,
                            color: FlutterFlowTheme.of(context).iconGray,
                            size: 24,
                          ),
                        ),
                        Text(
                          'New Reservation',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 8),
                  child: InkWell(
                    onTap: () async {
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed('ViewReservation');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                          child: Icon(
                            Icons.calendar_today_rounded,
                            color: FlutterFlowTheme.of(context).iconGray,
                            size: 24,
                          ),
                        ),
                        Text(
                          'View/Modify Reservations',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                        child: Icon(
                          Icons.group_add,
                          color: FlutterFlowTheme.of(context).iconGray,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Allocate To Table',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).grayLines,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('Seating');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                          child: Icon(
                            Icons.table_chart,
                            color: FlutterFlowTheme.of(context).iconGray,
                            size: 24,
                          ),
                        ),
                        Text(
                          'View Seating',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).grayLines,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('NewOrder');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                          child: Icon(
                            Icons.post_add_rounded,
                            color: FlutterFlowTheme.of(context).iconGray,
                            size: 24,
                          ),
                        ),
                        Text(
                          'New Order',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 8),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('Orders');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                          child: Icon(
                            Icons.payment_rounded,
                            color: FlutterFlowTheme.of(context).iconGray,
                            size: 24,
                          ),
                        ),
                        Text(
                          'View/Modify Open Orders',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('Menu');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 32, 0),
                          child: Icon(
                            Icons.fastfood_rounded,
                            color: FlutterFlowTheme.of(context).iconGray,
                            size: 24,
                          ),
                        ),
                        Text(
                          'View Menu',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  color: FlutterFlowTheme.of(context).grayLines,
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1, 1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 60),
              child: InkWell(
                onTap: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await signOut();

                  context.goNamedAuth('Onboard', mounted);
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
                          color: FlutterFlowTheme.of(context).iconGray,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Logout',
                        style: FlutterFlowTheme.of(context).bodyText1,
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
