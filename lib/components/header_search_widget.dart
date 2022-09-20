import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSearchWidget extends StatefulWidget {
  const HeaderSearchWidget({Key? key}) : super(key: key);

  @override
  _HeaderSearchWidgetState createState() => _HeaderSearchWidgetState();
}

class _HeaderSearchWidgetState extends State<HeaderSearchWidget> {
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: false,
      decoration: InputDecoration(
        isDense: true,
        labelText: 'search',
        labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              fontWeight: FontWeight.w300,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyText1Family),
            ),
        hintStyle: FlutterFlowTheme.of(context).bodyText2,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).iconGray,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).iconGray,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).white,
        contentPadding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        prefixIcon: Icon(
          Icons.search,
          color: FlutterFlowTheme.of(context).secondaryColor,
        ),
      ),
      style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
            fontWeight: FontWeight.w300,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyText1Family),
          ),
    );
  }
}
