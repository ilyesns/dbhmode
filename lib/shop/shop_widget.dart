import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/categorymenu_widget.dart';
import '/components/empty_produtc_item_widget.dart';
import '/components/mobileview_widget.dart';
import '/components/webviewnew_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shop_model.dart';
export 'shop_model.dart';

class ShopWidget extends StatefulWidget {
  const ShopWidget({Key? key}) : super(key: key);

  @override
  _ShopWidgetState createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  late ShopModel _model;

  late Future<List<CategoriesRecord?>> categoryHive;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late List<CategoriesRecord> categories;
  late List<SubCategoriesRecord> subCategories;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopModel());
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Shop'});
    categories = FFAppState().categories;
    subCategories = FFAppState().subCategories;
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(categories.length, (rowIndex) {
                    final rowCategoriesRecord = categories[rowIndex]!;
                    return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: CategorymenuWidget(
                          key:
                              Key('Keyp7o_${rowIndex}_of_${categories.length}'),
                          categoryname: rowCategoriesRecord.nameCategory,
                          subcategoryname: subCategories
                              .map((e) => e!.nameSubCategory)
                              .toList(),
                        ));
                  }),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/dbhlogo.png',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SHOP_PAGE_Row_2qgavzgy_ON_TAP');
                                          if (FFAppState().searchonof) {
                                            logFirebaseEvent(
                                                'Row_update_app_state');
                                            FFAppState().update(() {
                                              FFAppState().searchonof = false;
                                            });
                                          } else {
                                            logFirebaseEvent(
                                                'Row_update_app_state');
                                            FFAppState().update(() {
                                              FFAppState().searchonof = true;
                                            });
                                          }
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SHOP_PAGE_Icon_ymoaf0f9_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_navigate_to');

                                                context.pushNamed(
                                                  'SearchPage',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 0.2,
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
                                    SingleChildScrollView(
                                      child: loading
                                          ? Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: MediaQuery.sizeOf(context)
                                                      .height -
                                                  200,
                                              child: Center(
                                                child: SizedBox(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  child: SpinKitFadingGrid(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : RefreshIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              onRefresh: () async {
                                                setState(() {
                                                  loading = true;
                                                });
                                                FFAppState().categories =
                                                    await queryCategoriesRecordOnce();
                                                FFAppState().subCategories =
                                                    await querySubCategoriesRecordOnce();
                                                setState(() {
                                                  loading = false;

                                                  categories =
                                                      FFAppState().categories;

                                                  subCategories = FFAppState()
                                                      .subCategories;
                                                });
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.74,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: GridView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
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
                                                            categories.length,
                                                        itemBuilder: (context,
                                                            gridViewIndex) {
                                                          final gridViewCategoriesRecord =
                                                              categories[
                                                                  gridViewIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'SHOP_PAGE_Container_w7brqcu2_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                'ShopSubCategories',
                                                                queryParameters:
                                                                    {
                                                                  'categoryref':
                                                                      serializeParam(
                                                                    gridViewCategoriesRecord!
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
                                                                            .rightToLeftWithFade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            700),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 1.0,
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    width: 0.3,
                                                                  ),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            gridViewCategoriesRecord!.image,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
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
                                                                            functions.upperCase(gridViewCategoriesRecord.nameCategory),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Open Sans',
                                                                                  color: Colors.white,
                                                                                  fontSize: () {
                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                      return 14.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width >= kBreakpointSmall) {
                                                                                      return 16.0;
                                                                                    } else {
                                                                                      return 14.0;
                                                                                    }
                                                                                  }(),
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
                                                ],
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
            )),
      ),
    );
  }
}
