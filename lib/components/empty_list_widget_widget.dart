import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyListWidgetWidget extends StatefulWidget {
  const EmptyListWidgetWidget({Key? key}) : super(key: key);

  @override
  _EmptyListWidgetWidgetState createState() => _EmptyListWidgetWidgetState();
}

class _EmptyListWidgetWidgetState extends State<EmptyListWidgetWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FFIcons.kvaletIcon,
              color: FlutterFlowTheme.of(context).iconGray,
              size: 90,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nothing to display',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: FlutterFlowTheme.of(context).title3Family,
                          color: FlutterFlowTheme.of(context).iconGray,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).title3Family),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
