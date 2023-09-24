import '/backend/backend.dart';
import '/components/categorymenu_widget.dart';
import '/components/promotion_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'webviewnew_model.dart';
export 'webviewnew_model.dart';

class WebviewnewWidget extends StatefulWidget {
  const WebviewnewWidget({
    Key? key,
    this.navOne,
    this.navTwo,
    this.navThree,
    this.navFour,
    this.navFive,
    this.navSix,
  }) : super(key: key);

  final Color? navOne;
  final Color? navTwo;
  final Color? navThree;
  final Color? navFour;
  final Color? navFive;
  final Color? navSix;

  @override
  _WebviewnewWidgetState createState() => _WebviewnewWidgetState();
}

class _WebviewnewWidgetState extends State<WebviewnewWidget> {
  late WebviewnewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebviewnewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: () {
        if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
          return 70.0;
        } else if (MediaQuery.sizeOf(context).width >= kBreakpointMedium) {
          return 200.0;
        } else {
          return 200.0;
        }
      }(),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:
                  MediaQuery.sizeOf(context).width <= kBreakpointSmall
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'WEBVIEWNEW_COMP_Column_68regian_ON_TAP');
                          logFirebaseEvent('Column_update_widget_state');
                          _model.updatePage(() {
                            _model.gender = 'women';
                          });
                          logFirebaseEvent('Column_update_app_state');
                          _model.updatePage(() {
                            FFAppState().Gender = 'women';
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'm2wgdo08' /* Women */,
                                ),
                                style: FlutterFlowTheme.of(context).titleSmall,
                              ),
                            ),
                            if (_model.gender == 'women')
                              SizedBox(
                                width: 50.0,
                                child: Divider(
                                  height: 10.0,
                                  thickness: 2.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                          ],
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'WEBVIEWNEW_COMP_Column_9fq7r6k1_ON_TAP');
                          logFirebaseEvent('Column_update_widget_state');
                          _model.updatePage(() {
                            _model.gender = 'men';
                          });
                          logFirebaseEvent('Column_update_app_state');
                          _model.updatePage(() {
                            FFAppState().Gender = 'men';
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ck2r0duz' /* Men */,
                                ),
                                style: FlutterFlowTheme.of(context).titleSmall,
                              ),
                            ),
                            if (_model.gender == 'men')
                              SizedBox(
                                width: 50.0,
                                child: Divider(
                                  height: 10.0,
                                  thickness: 2.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('WEBVIEWNEW_COMP_Image_23nvukgo_ON_TAP');
                    logFirebaseEvent('Image_navigate_to');

                    context.pushNamed('Home');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/dbhlogo.png',
                      width: 75.0,
                      height: 75.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'WEBVIEWNEW_COMP_Column_4rl35jzu_ON_TAP');
                            logFirebaseEvent('Column_navigate_to');

                            context.pushNamed('SearchPage');
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Icon(
                                  Icons.search_outlined,
                                  color: widget.navFour,
                                  size: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'WEBVIEWNEW_COMP_Column_g0dys8vg_ON_TAP');
                            logFirebaseEvent('Column_navigate_to');

                            context.pushNamed('ProfileTeam');
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: FaIcon(
                                  FontAwesomeIcons.user,
                                  color: widget.navFive,
                                  size: 27.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'WEBVIEWNEW_COMP_Column_ll90wr0y_ON_TAP');
                            logFirebaseEvent('Column_navigate_to');

                            context.pushNamed('CART');
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: widget.navSix,
                                  size: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'WEBVIEWNEW_COMP_Column_frsl9ukc_ON_TAP');
                          logFirebaseEvent('Column_navigate_to');

                          context.pushNamed('FAVORITE');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color: widget.navFour,
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            StreamBuilder<List<CategoriesRecord>>(
              stream: queryCategoriesRecord(
                queryBuilder: (categoriesRecord) =>
                    categoriesRecord.orderBy('modified_at'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: SpinKitFadingGrid(
                        color: FlutterFlowTheme.of(context).lineColor,
                        size: 20.0,
                      ),
                    ),
                  );
                }
                List<CategoriesRecord> rowCategoriesRecordList = snapshot.data!;
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      List.generate(rowCategoriesRecordList.length, (rowIndex) {
                    final rowCategoriesRecord =
                        rowCategoriesRecordList[rowIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: StreamBuilder<List<SubCategoriesRecord>>(
                        stream: querySubCategoriesRecord(
                          parent: rowCategoriesRecord.reference,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: SpinKitFadingGrid(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  size: 20.0,
                                ),
                              ),
                            );
                          }
                          List<SubCategoriesRecord>
                              categorymenuSubCategoriesRecordList =
                              snapshot.data!;
                          return CategorymenuWidget(
                            key: Key(
                                'Keyf98_${rowIndex}_of_${rowCategoriesRecordList.length}'),
                            categoryname: rowCategoriesRecord.nameCategory,
                            subcategoryname: categorymenuSubCategoriesRecordList
                                .map((e) => e.nameSubCategory)
                                .toList(),
                          );
                        },
                      ),
                    );
                  }),
                );
              },
            ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            wrapWithModel(
              model: _model.promotionBarModel,
              updateCallback: () => setState(() {}),
              child: PromotionBarWidget(),
            ),
        ],
      ),
    );
  }
}
