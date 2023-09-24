import 'package:flutter/foundation.dart';

import '/backend/backend.dart';
import '/components/mobileview_widget.dart';
import '/components/webviewnew_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shop_sub_categories_model.dart';
export 'shop_sub_categories_model.dart';

class ShopSubCategoriesWidget extends StatefulWidget {
  const ShopSubCategoriesWidget({
    Key? key,
    required this.categoryref,
  }) : super(key: key);

  final DocumentReference? categoryref;

  @override
  _ShopSubCategoriesWidgetState createState() =>
      _ShopSubCategoriesWidgetState();
}

class _ShopSubCategoriesWidgetState extends State<ShopSubCategoriesWidget> {
  late ShopSubCategoriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<SubCategoriesRecord> subCategories;
  late CategoriesRecord category;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopSubCategoriesModel());
    category = FFAppState()
        .categories
        .where(
          (element) => element.reference == widget.categoryref,
        )
        .first;
    subCategories = FFAppState()
        .subCategories
        .where(
          (element) => element.parentReference == widget.categoryref,
        )
        .toList();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ShopSubCategories'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.webviewnewModel,
                  updateCallback: () => setState(() {}),
                  child: WebviewnewWidget(),
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SHOP_SUB_CATEGORIES_chevron_left_ICN_ON_');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed('Shop');
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    functions.upperCase(category.nameCategory),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SHOP_SUB_CATEGORIES_Icon_v6tq1t93_ON_TAP');
                                        logFirebaseEvent('Icon_navigate_to');

                                        context.pushNamed(
                                          'SearchPage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.search,
                                        color: Color(0xFFC2C2C2),
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: SingleChildScrollView(
                                      child: RefreshIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        onRefresh: () async {
                                          setState(() {
                                            loading = true;
                                          });
                                          FFAppState().categories =
                                              await queryCategoriesRecordOnce();
                                          FFAppState().subCategories =
                                              await querySubCategoriesRecordOnce(
                                                  parent: widget.categoryref);
                                          setState(() {
                                            loading = false;

                                            category = FFAppState()
                                                .categories
                                                .where((element) =>
                                                    element.reference ==
                                                    widget.categoryref)
                                                .first;

                                            subCategories =
                                                FFAppState().subCategories;
                                          });
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      functions
                                                          .upperCaseFistLetter(
                                                              category.gender),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Container(
                                                  width: double.infinity,
                                                  height: kIsWeb
                                                      ? MediaQuery.sizeOf(
                                                              context)
                                                          .height
                                                      : MediaQuery.sizeOf(
                                                                  context)
                                                              .height -
                                                          230,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      crossAxisSpacing: 3.0,
                                                      mainAxisSpacing: 3.0,
                                                      childAspectRatio: 1.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        subCategories.length,
                                                    itemBuilder: (context,
                                                        gridViewIndex) {
                                                      final gridViewSubCategoriesRecord =
                                                          subCategories[
                                                              gridViewIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'SHOP_SUB_CATEGORIES_Container_pzjpzcx6_O');
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            'ListProducts',
                                                            queryParameters: {
                                                              'subcategoryref':
                                                                  serializeParam(
                                                                gridViewSubCategoriesRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .rightToLeft,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        200),
                                                              ),
                                                            },
                                                          );

                                                          logFirebaseEvent(
                                                              'Container_update_app_state');
                                                          setState(() {
                                                            FFAppState()
                                                                    .refreshSubQueryCahe =
                                                                gridViewSubCategoriesRecord
                                                                    .reference;
                                                          });
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 1.0,
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                width: 0.3,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    gridViewSubCategoriesRecord
                                                                        .image,
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .upperCase(gridViewSubCategoriesRecord.nameSubCategory),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: Colors.white,
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )),
                                            ),
                                          ],
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
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      wrapWithModel(
                        model: _model.mobileviewModel,
                        updateCallback: () => setState(() {}),
                        child: MobileviewWidget(
                          navOneIcon: Icon(
                            Icons.home_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          navTwoIcon: Icon(
                            Icons.shopping_bag_outlined,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          navThreeIcon: Icon(
                            Icons.shopping_cart_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          navFourIcon: Icon(
                            Icons.favorite_border,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          navFiveIcon: Icon(
                            Icons.face_retouching_natural,
                            color: FlutterFlowTheme.of(context).secondaryText,
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
    );
  }
}
