import '../backend/api_requests/api_calls.dart';
import '../components/menu_scaf_widget.dart';
import '../components/new_reservation_page_view_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ConsumerEntryWidget extends StatefulWidget {
  const ConsumerEntryWidget({Key? key}) : super(key: key);

  @override
  _ConsumerEntryWidgetState createState() => _ConsumerEntryWidgetState();
}

class _ConsumerEntryWidgetState extends State<ConsumerEntryWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(300, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(300, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  ApiCallResponse? apiResultConsumer;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONSUMER_ENTRY_consumerEntry_ON_LOAD');
      logFirebaseEvent('consumerEntry_backend_call');
      apiResultConsumer = await ValetAPIGroup.loginUserCall.call();
      if ((apiResultConsumer?.succeeded ?? true)) {
        logFirebaseEvent('consumerEntry_update_local_state');
        setState(() => FFAppState().token = ValetAPIGroup.loginUserCall
            .jWTToken(
              (apiResultConsumer?.jsonBody ?? ''),
            )
            .toString());
      } else {
        logFirebaseEvent('consumerEntry_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (apiResultConsumer?.jsonBody ?? ''),
                r'''$.detail''',
              ).toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );
      }
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'consumerEntry'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'consumerEntry',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).darkBG,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlutterFlowVideoPlayer(
                      path: 'www.getvalet.com.au/Valet.mp4',
                      videoType: VideoType.network,
                      width: MediaQuery.of(context).size.width,
                      autoPlay: true,
                      looping: true,
                      showControls: false,
                      allowFullScreen: true,
                      allowPlaybackSpeedMenu: false,
                    ),
                  ],
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0.6),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 1,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.4, 0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      width: 350,
                                      height: 700,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          width: 4,
                                        ),
                                      ),
                                      child: MenuScafWidget(),
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation1']!,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.4, 0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      width: 350,
                                      height: 700,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          width: 4,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          NewReservationPageViewWidget(),
                                        ],
                                      ),
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation2']!,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.58, -0.9),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 0,
                                    buttonSize: 40,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CONSUMER_ENTRY_cancel_outlined_ICN_ON_TA');
                                      logFirebaseEvent(
                                          'IconButton_widget_animation');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reset();
                                      }
                                      logFirebaseEvent(
                                          'IconButton_widget_animation');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reset();
                                      }
                                      logFirebaseEvent(
                                          'IconButton_widget_animation');
                                      if (animationsMap[
                                              'iconButtonOnActionTriggerAnimation'] !=
                                          null) {
                                        animationsMap[
                                                'iconButtonOnActionTriggerAnimation']!
                                            .controller
                                            .reset();
                                      }
                                    },
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconButtonOnActionTriggerAnimation']!,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 300, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.8, -0.28),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 20),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CONSUMER_ENTRY_PAGE_MENU_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_widget_animation');
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation1'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation1']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              logFirebaseEvent(
                                                  'Button_widget_animation');
                                              if (animationsMap[
                                                      'iconButtonOnActionTriggerAnimation'] !=
                                                  null) {
                                                animationsMap[
                                                        'iconButtonOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              logFirebaseEvent(
                                                  'Button_widget_animation');
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation2'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation2']!
                                                    .controller
                                                    .reset();
                                              }
                                            },
                                            text: 'MENU',
                                            options: FFButtonOptions(
                                              width: 150,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .darkBG,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family),
                                                  ),
                                              elevation: 12,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.8, -0.09),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'CONSUMER_ENTRY_BOOK_ONLINE_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'Button_widget_animation');
                                            if (animationsMap[
                                                    'iconButtonOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'iconButtonOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'Button_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'containerOnActionTriggerAnimation1']!
                                                  .controller
                                                  .reset();
                                            }
                                          },
                                          text: 'BOOK ONLINE',
                                          options: FFButtonOptions(
                                            width: 150,
                                            height: 50,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .darkBG,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                            elevation: 12,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.8, 0),
                                        child: Container(
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                color: Color(0x33000000),
                                                offset: Offset(0, 1),
                                              )
                                            ],
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0),
                                            ),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              width: 2,
                                            ),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.69, -0.09),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                              child: Image.asset(
                                                'assets/images/powered.png',
                                                width: 150,
                                                height: 40,
                                                fit: BoxFit.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Align(
                    alignment: AlignmentDirectional(0.06, -0.85),
                    child: Image.asset(
                      'assets/images/sake-Logo-300--300-px-200--200-px.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  Align(
                    alignment: AlignmentDirectional(-0.4, -0.71),
                    child: Image.asset(
                      'assets/images/sake-Logo-300--300-px-200--200-px.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 500, 0, 200),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'MENU',
                                options: FFButtonOptions(
                                  width: 150,
                                  height: 50,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color:
                                            FlutterFlowTheme.of(context).darkBG,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  elevation: 12,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ],
                        ),
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'BOOK ONLINE',
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).darkBG,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                            elevation: 12,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          showLoadingIndicator: false,
                        ),
                        Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x33000000),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                            border: Border.all(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              width: 2,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.69, -0.09),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                              child: Image.asset(
                                'assets/images/powered.png',
                                width: 150,
                                height: 40,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
