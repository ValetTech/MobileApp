import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarWithMiddleButtonWidget extends StatefulWidget {
  const NavBarWithMiddleButtonWidget({Key? key}) : super(key: key);

  @override
  _NavBarWithMiddleButtonWidgetState createState() =>
      _NavBarWithMiddleButtonWidgetState();
}

class _NavBarWithMiddleButtonWidgetState
    extends State<NavBarWithMiddleButtonWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x1A57636C),
                        offset: Offset(0, -10),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  FFIcons.kvaletIcon,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  print('Dashboar pressed ...');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  Icons.people_alt,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8,
                      borderWidth: 1,
                      buttonSize: 60,
                      fillColor: FlutterFlowTheme.of(context).primaryColor,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        print('MiddleButton pressed ...');
                      },
                    ),
                  ),
                ],
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  Icons.table_chart,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
