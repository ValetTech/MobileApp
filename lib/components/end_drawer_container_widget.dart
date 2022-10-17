import '../auth/auth_util.dart';
import '../components/new_reservation_page_view_widget.dart';
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Text(
                    random_data.randomName(true, true),
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
              ],
            ),
            Divider(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('Dashboard');
              },
              child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                ),
                title: Text(
                  'Dashboard',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            ListTile(
              title: Text(
                'Reservations',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText2Family),
                    ),
              ),
              dense: false,
              contentPadding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('Reservations');

                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: NewReservationPageViewWidget(),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.calendarPlus,
                ),
                title: Text(
                  'New Reservation',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('ViewReservation');
              },
              child: ListTile(
                leading: Icon(
                  Icons.calendar_today,
                ),
                title: Text(
                  'View/Modify Reservations',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.group_add,
              ),
              title: Text(
                'Allocate To Table',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              tileColor: Color(0xFFF5F5F5),
              dense: false,
            ),
            ListTile(
              title: Text(
                'Seating',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText2Family),
                    ),
              ),
              dense: false,
              contentPadding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            ),
            ListTile(
              leading: Icon(
                Icons.read_more,
              ),
              title: Text(
                'List View',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              tileColor: Color(0xFFF5F5F5),
              dense: false,
            ),
            ListTile(
              leading: Icon(
                Icons.image_search,
              ),
              title: Text(
                'Table View',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              tileColor: Color(0xFFF5F5F5),
              dense: false,
            ),
            ListTile(
              title: Text(
                'Orders',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText2Family),
                    ),
              ),
              dense: false,
              contentPadding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            ),
            ListTile(
              leading: Icon(
                Icons.post_add,
              ),
              title: Text(
                'New Order',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              tileColor: Color(0xFFF5F5F5),
              dense: false,
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('Orders');
              },
              child: ListTile(
                leading: Icon(
                  Icons.payment,
                ),
                title: Text(
                  'View/Modify Open Orders',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            ListTile(
              title: Text(
                'Menu',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText2Family),
                    ),
              ),
              dense: false,
              contentPadding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed('menu');
              },
              child: ListTile(
                leading: Icon(
                  Icons.fastfood_sharp,
                ),
                title: Text(
                  'View Menu',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            InkWell(
              onTap: () async {
                GoRouter.of(context).prepareAuthEvent();
                await signOut();

                context.goNamedAuth('Onboard', mounted);
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: Text(
                  'Logout',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
