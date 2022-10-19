import '../backend/api_requests/api_calls.dart';
import '../components/end_drawer_container_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewReservationWidget extends StatefulWidget {
  const ViewReservationWidget({
    Key? key,
    this.resDetails,
  }) : super(key: key);

  final dynamic resDetails;

  @override
  _ViewReservationWidgetState createState() => _ViewReservationWidgetState();
}

class _ViewReservationWidgetState extends State<ViewReservationWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GETReservationsCall.call(),
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
        final viewReservationGETReservationsResponse = snapshot.data!;
        return Title(
            title: 'ViewReservation',
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
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).iconGray,
                      size: 30,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
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
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Details',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.getFont(
                        'Overpass',
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                  ),
                  toolbarHeight: 60,
                  elevation: 6,
                ),
              ),
            ));
      },
    );
  }
}
