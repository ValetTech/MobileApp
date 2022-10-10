import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeaderWidget extends StatefulWidget {
  const SectionHeaderWidget({Key? key}) : super(key: key);

  @override
  _SectionHeaderWidgetState createState() => _SectionHeaderWidgetState();
}

class _SectionHeaderWidgetState extends State<SectionHeaderWidget> {
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
        Text(
          FFAppState().currentPage,
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
      ],
    );
  }
}
