import '../components/app_bar_with_search_widget.dart';
import '../components/calendar_picker_valet_widget.dart';
import '../components/end_drawer_container_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SeatingWidget extends StatefulWidget {
  const SeatingWidget({Key? key}) : super(key: key);

  @override
  _SeatingWidgetState createState() => _SeatingWidgetState();
}

class _SeatingWidgetState extends State<SeatingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Seating',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              flexibleSpace: AppBarWithSearchWidget(),
              actions: [],
              elevation: 6,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
            icon: Icon(
              Icons.group_add,
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
            elevation: 8,
            label: Text(
              'Allocate Table',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            ),
          ),
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: EndDrawerContainerWidget(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x230E151B),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: CalendarPickerValetWidget(),
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
