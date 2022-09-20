import '../components/header_search_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWithSearchWidget extends StatefulWidget {
  const AppBarWithSearchWidget({Key? key}) : super(key: key);

  @override
  _AppBarWithSearchWidgetState createState() => _AppBarWithSearchWidgetState();
}

class _AppBarWithSearchWidgetState extends State<AppBarWithSearchWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: HeaderSearchWidget(),
              ),
            ),
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
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
