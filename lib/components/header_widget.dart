import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
          child: Text(
            'Hey',
            style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Overpass',
                  color: FlutterFlowTheme.of(context).primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.normal,
                  useGoogleFonts: GoogleFonts.asMap()
                      .containsKey(FlutterFlowTheme.of(context).title1Family),
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 16, 0),
          child: Text(
            random_data.randomName(true, false),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Overpass',
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap()
                      .containsKey(FlutterFlowTheme.of(context).title1Family),
                ),
          ),
        ),
      ],
    );
  }
}
