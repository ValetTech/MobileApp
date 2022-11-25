import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScafWidget extends StatefulWidget {
  const MenuScafWidget({Key? key}) : super(key: key);

  @override
  _MenuScafWidgetState createState() => _MenuScafWidgetState();
}

class _MenuScafWidgetState extends State<MenuScafWidget> {
  ValueNotifier<List<String>?> choiceChipsValues = ValueNotifier(null);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primaryBackground,
                  FlutterFlowTheme.of(context).grayLines
                ],
                stops: [0, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (FFAppState().filtersOn == false)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                      child: Icon(
                        Icons.filter_alt_rounded,
                        color: FlutterFlowTheme.of(context).iconGray,
                        size: 24,
                      ),
                    ),
                  if (FFAppState().filtersOn == true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'MENU_SCAF_COMP_Icon_5yf294pl_ON_TAP');
                          logFirebaseEvent('Icon_update_local_state');
                          setState(() => FFAppState().filtersOn = false);
                          logFirebaseEvent('Icon_clear_all_select_all');
                          setState(() => choiceChipsValues.value = []);
                          if (!isWeb) {
                            logFirebaseEvent('Icon_navigate_to');

                            context.pushNamed(
                              'Menu',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Color(0xFFDF3F3F),
                          size: 24,
                        ),
                      ),
                    ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.vertical,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.antiAlias,
                              children: [
                                FutureBuilder<List<CategoriesRecord>>(
                                  future: queryCategoriesRecordOnce(
                                    queryBuilder: (categoriesRecord) =>
                                        categoriesRecord.orderBy('id'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: CircularProgressIndicator(
                                            color: Color(0x00023047),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CategoriesRecord>
                                        choiceChipsCategoriesRecordList =
                                        snapshot.data!;
                                    return FlutterFlowChoiceChips(
                                      options: choiceChipsCategoriesRecordList
                                          .map((e) => e.title!)
                                          .toList()
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(() =>
                                            choiceChipsValues.value = val);
                                        logFirebaseEvent(
                                            'MENU_SCAF_ChoiceChips_k1erc6nk_ON_FORM_W');
                                        logFirebaseEvent(
                                            'ChoiceChips_update_local_state');
                                        setState(() =>
                                            FFAppState().filtersOn = true);
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        iconSize: 14,
                                        elevation: 4,
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .iconGray,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .iconGray,
                                        iconSize: 14,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 1, 0),
                                        elevation: 4,
                                      ),
                                      chipSpacing: 8,
                                      multiselect: true,
                                      initialized:
                                          choiceChipsValues.value != null,
                                      alignment: WrapAlignment.start,
                                      selectedValuesVariable: choiceChipsValues,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x230E151B),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<CategoriesRecord>>(
                      stream: queryCategoriesRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: SpinKitRipple(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                size: 40,
                              ),
                            ),
                          );
                        }
                        List<CategoriesRecord> listViewCategoriesRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewCategoriesRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewCategoriesRecord =
                                listViewCategoriesRecordList[listViewIndex];
                            return Stack(
                              children: [
                                if (choiceChipsValues.value?.contains(
                                        listViewCategoriesRecord.title) ??
                                    true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 4, 0, 0),
                                    child: Text(
                                      listViewCategoriesRecord.title!,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                  ),
                                if (choiceChipsValues.value?.contains(
                                        listViewCategoriesRecord.title) ??
                                    true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 18, 0, 0),
                                    child: StreamBuilder<List<MenuRecord>>(
                                      stream: queryMenuRecord(
                                        queryBuilder: (menuRecord) => menuRecord
                                            .where('category',
                                                isEqualTo:
                                                    listViewCategoriesRecord
                                                        .title)
                                            .whereIn('category',
                                                choiceChipsValues.value)
                                            .orderBy('price'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                size: 40,
                                              ),
                                            ),
                                          );
                                        }
                                        List<MenuRecord>
                                            menuListViewMenuRecordList =
                                            snapshot.data!;
                                        if (menuListViewMenuRecordList
                                            .isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/Screenshot_2022-10-21_at_10.24.55_pm.png',
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                            ),
                                          );
                                        }
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              menuListViewMenuRecordList.length,
                                          itemBuilder:
                                              (context, menuListViewIndex) {
                                            final menuListViewMenuRecord =
                                                menuListViewMenuRecordList[
                                                    menuListViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 4, 0, 4),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              child:
                                                                  Image.network(
                                                                menuListViewMenuRecord
                                                                    .image!,
                                                                width: 100,
                                                                height: 66,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            8,
                                                                            0,
                                                                            8),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        menuListViewMenuRecord
                                                                            .name!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.attach_money_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).iconGray,
                                                                            size:
                                                                                16,
                                                                          ),
                                                                          Text(
                                                                            menuListViewMenuRecord.price!.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: FlutterFlowTheme.of(context).iconGray,
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              menuListViewMenuRecord.description!,
                                                                              maxLines: 3,
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).iconGray,
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30,
                                                                    borderWidth:
                                                                        1,
                                                                    buttonSize:
                                                                        60,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 30,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
