import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

class PINLoginWidget extends StatefulWidget {
  const PINLoginWidget({
    Key? key,
    this.firstName,
  }) : super(key: key);

  final String? firstName;

  @override
  _PINLoginWidgetState createState() => _PINLoginWidgetState();
}

class _PINLoginWidgetState extends State<PINLoginWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
  TextEditingController? pinCodeController;
  bool biometriLoginResult = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('P_I_N_LOGIN_PAGE_PINLogin_ON_PAGE_LOAD');
      logFirebaseEvent('PINLogin_biometric_verification');
      final _localAuth = LocalAuthentication();
      bool _isBiometricSupported = await _localAuth.isDeviceSupported();
      bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
      if (_isBiometricSupported && canCheckBiometrics) {
        biometriLoginResult = await _localAuth.authenticate(
            localizedReason:
                'Please authenticate with biometrics to access Valet',
            options: const AuthenticationOptions(biometricOnly: true));
        setState(() {});
      }

      if (biometriLoginResult!) {
        logFirebaseEvent('PINLogin_navigate_to');

        context.goNamed('Dashboard');
      } else {
        logFirebaseEvent('PINLogin_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              biometriLoginResult!.toString(),
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PINLogin'});
    pinCodeController = TextEditingController();
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
        title: 'PINLogin',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            color: Color(0x33000000),
                            offset: Offset(0, 6),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
                        child: Image.asset(
                          'assets/images/Valet-WhiteOnBlue.png',
                          width: double.infinity,
                          height: 50,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 12, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2, 0, 12, 0),
                                  child: AuthUserStreamWidget(
                                    child: Text(
                                      'Welcome back ${valueOrDefault(currentUserDocument?.firstName, '')}',
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 24, 24, 24),
                                    child: Text(
                                      'Please enter your PIN',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                  'PIN',
                                  isEqualTo:
                                      int.parse(pinCodeController!.text)),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      size: 40,
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> formUsersRecordList =
                                  snapshot.data!;
                              final formUsersRecord =
                                  formUsersRecordList.isNotEmpty
                                      ? formUsersRecordList.first
                                      : null;
                              return Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    PinCodeTextField(
                                      appContext: context,
                                      length: 4,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family),
                                          ),
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      enableActiveFill: true,
                                      autoFocus: true,
                                      showCursor: false,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).iconGray,
                                      obscureText: true,
                                      obscuringCharacter: '*',
                                      hintCharacter: '●',
                                      pinTheme: PinTheme(
                                        fieldHeight: 60,
                                        fieldWidth: 60,
                                        borderWidth: 2,
                                        borderRadius: BorderRadius.circular(12),
                                        shape: PinCodeFieldShape.box,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                        inactiveColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        selectedColor:
                                            FlutterFlowTheme.of(context)
                                                .iconGray,
                                        activeFillColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                        inactiveFillColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        selectedFillColor:
                                            FlutterFlowTheme.of(context)
                                                .iconGray,
                                      ),
                                      controller: pinCodeController,
                                      onChanged: (_) => {},
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 24),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'P_I_N_LOGIN_PAGE_LOGIN_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_validate_form');
                                          if (formKey.currentState == null ||
                                              !formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }

                                          if (biometriLoginResult!) {
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed('Dashboard');
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Login Error',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x00000000),
                                              ),
                                            );
                                          }
                                        },
                                        text: 'Login',
                                        icon: Icon(
                                          Icons.person,
                                          size: 20,
                                        ),
                                        options: FFButtonOptions(
                                          width: 175,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1,
                                          elevation: 2,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 24),
                                      child: AuthUserStreamWidget(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'P_I_N_LOGIN_PAGE__BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed(
                                              'mainLogin',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          },
                                          text:
                                              'Not ${valueOrDefault(currentUserDocument?.firstName, '')}?',
                                          icon: Icon(
                                            Icons.error_outline,
                                            size: 20,
                                          ),
                                          options: FFButtonOptions(
                                            width: 175,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            elevation: 2,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
