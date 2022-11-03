import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNameWidget extends StatefulWidget {
  const PageNameWidget({
    Key? key,
    this.pageName,
  }) : super(key: key);

  final String? pageName;

  @override
  _PageNameWidgetState createState() => _PageNameWidgetState();
}

class _PageNameWidgetState extends State<PageNameWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.pageName!,
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).title1.override(
            fontFamily: 'Overpass',
            color: FlutterFlowTheme.of(context).secondaryColor,
            fontSize: 32,
            fontWeight: FontWeight.w600,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).title1Family),
          ),
    );
  }
}
