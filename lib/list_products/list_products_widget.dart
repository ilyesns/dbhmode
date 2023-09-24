import 'package:flutter/foundation.dart';

import '/backend/backend.dart';
import '/components/mobileview_widget.dart';
import '/components/webviewnew_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'list_products_model.dart';
export 'list_products_model.dart';

class ListProductsWidget extends StatefulWidget {
  const ListProductsWidget({
    Key? key,
    this.subcategoryref,
  }) : super(key: key);

  final DocumentReference? subcategoryref;

  @override
  _ListProductsWidgetState createState() => _ListProductsWidgetState();
}

class _ListProductsWidgetState extends State<ListProductsWidget>
    with TickerProviderStateMixin {
  late ListProductsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String subname;
  late List<ProductRecord?> products = [];
  late List<VariantsRecord?> variants = [];
  late List<ColorsRecord?> colors = [];
  late List<SizesRecord?> sizes = [];
  late List<DiscountsRecord>? discounts;
  final animationsMap = {
    'toggleIconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1090.ms,
          begin: Offset(39, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'toggleIconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1090.ms,
          begin: Offset(39, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListProductsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListProducts'});

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    subname = FFAppState()
        .subCategories
        .where((element) => element.reference == widget.subcategoryref)
        .first
        .nameSubCategory;

    products = FFAppState()
        .products
        .where((element) => element.idSubcategory == widget.subcategoryref)
        .toList();
    variants = FFAppState().variants;
    colors = FFAppState().colors;
    sizes = FFAppState().sizes;
    discounts = FFAppState().discounts;
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
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 20,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'LIST_PRODUCTS_chevron_left_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(
                                      'ShopSubCategories',
                                      queryParameters: {
                                        'categoryref': serializeParam(
                                          widget.subcategoryref!.parent.parent,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    subname,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LIST_PRODUCTS_PAGE_Icon_rzg9u1wc_ON_TAP');
                                      logFirebaseEvent('Icon_navigate_to');

                                      context.pushNamed(
                                        'SearchPage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.search,
                                      color: Color(0xFFC2C2C2),
                                      size: 20,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.gVcount != 1)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_PRODUCTS_PAGE_Icon_kecva6x0_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_update_widget_state');
                                                setState(() {
                                                  _model.gVcount = 1;
                                                  _model.heightCon = 100.0;
                                                });
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.square,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24,
                                              ),
                                            ),
                                          if (_model.gVcount == 1)
                                            FaIcon(
                                              FontAwesomeIcons.solidSquare,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24,
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.gVcount != 2)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_PRODUCTS_PAGE_Icon_lfdz8b3l_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_update_widget_state');
                                                setState(() {
                                                  _model.gVcount = 2;
                                                  _model.heightCon = 100.0;
                                                });
                                              },
                                              child: Icon(
                                                Icons.dashboard_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24,
                                              ),
                                            ),
                                          if (_model.gVcount == 2)
                                            Icon(
                                              Icons.dashboard_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24,
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.gVcount != 3)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_PRODUCTS_PAGE_Icon_1ta7l6i7_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_update_widget_state');
                                                setState(() {
                                                  _model.gVcount = 3;
                                                  _model.heightCon = 50.0;
                                                });
                                              },
                                              child: Icon(
                                                Icons.apps,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24,
                                              ),
                                            ),
                                          if (_model.gVcount == 3)
                                            Icon(
                                              Icons.apps,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'du7i6mm8' /* Sort */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 30,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 24, 0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 14,
                                              ),
                                          elevation: 3,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'f6wz34xd' /* Filter */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 30,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 24, 0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 14,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 20),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          decoration: BoxDecoration(),
                                          child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: kIsWeb
                                                      ? 4
                                                      : _model.gVcount,
                                                  crossAxisSpacing: 3,
                                                  mainAxisSpacing: 3,
                                                  childAspectRatio: 0.6,
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: products.length,
                                                itemBuilder:
                                                    (context, gridViewIndex) {
                                                  final gridViewProductRecord =
                                                      products[gridViewIndex];

                                                  final variantsProduct =
                                                      variants
                                                          .where(
                                                            (element) =>
                                                                element!
                                                                    .parentReference ==
                                                                gridViewProductRecord!
                                                                    .reference,
                                                          )
                                                          .toList();
                                                  final discount = discounts!
                                                      .where(
                                                        (element) =>
                                                            element.reference ==
                                                            gridViewProductRecord!
                                                                .discount,
                                                      )
                                                      .first;
                                                  final colorsVariants = colors
                                                      .where((e) =>
                                                          variantsProduct.any(
                                                              (element) =>
                                                                  element!
                                                                      .idcolor ==
                                                                  e!.reference))
                                                      .toSet()
                                                      .toList();
                                                  print(gridViewProductRecord!
                                                      .name);
                                                  print(colorsVariants);
                                                  if (variantsProduct
                                                      .isNotEmpty)
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
                                                            'LIST_PRODUCTS_Container_k16vbgjf_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Container_navigate_to');

                                                        context.pushNamed(
                                                          'Product_Item',
                                                          queryParameters: {
                                                            'productref':
                                                                serializeParam(
                                                              gridViewProductRecord!
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'imageRef':
                                                                serializeParam(
                                                              gridViewProductRecord
                                                                  .image,
                                                              ParamType.String,
                                                            ),
                                                            'colorId':
                                                                serializeParam(
                                                              colorsVariants
                                                                  .first
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1,
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                gridViewProductRecord!
                                                                    .image,
                                                              ).image,
                                                            ),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              width: 0.3,
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            setState(
                                                                              () => FFAppState().favorite.contains(gridViewProductRecord.reference) ? FFAppState().removeFromFavorite(gridViewProductRecord.reference) : FFAppState().addToFavorite(gridViewProductRecord.reference),
                                                                            );
                                                                          },
                                                                          value: FFAppState()
                                                                              .favorite
                                                                              .contains(gridViewProductRecord.reference),
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.favorite,
                                                                            color:
                                                                                Color(0xFFDD2424),
                                                                            size:
                                                                                30,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                Color(0xFFDD2424),
                                                                            size:
                                                                                30,
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['toggleIconOnPageLoadAnimation1']!),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: _model
                                                                    .heightCon,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          5,
                                                                          5,
                                                                          5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (_model
                                                                              .gVcount !=
                                                                          3)
                                                                        Text(
                                                                          gridViewProductRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Open Sans',
                                                                                fontSize: 16,
                                                                              ),
                                                                        ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: MediaQuery.sizeOf(context).width,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00FFFFFF),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  if (!discount.active)
                                                                                    Text(
                                                                                      '${gridViewProductRecord.price.toString()}€',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Open Sans',
                                                                                            fontSize: 12,
                                                                                          ),
                                                                                    ),
                                                                                  if (discount.active)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                          child: Text(
                                                                                            '${functions.discountedPrice(discount.disc, gridViewProductRecord.price)?.toString()}€',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  fontSize: 12,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                          child: Text(
                                                                                            '${gridViewProductRecord.price.toString()}€',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  fontSize: 12,
                                                                                                  decoration: TextDecoration.lineThrough,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        if (_model.gVcount != 3)
                                                                                          Text(
                                                                                            '%${discount.disc.toString()}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: Color(0xFFDB6539),
                                                                                                  fontSize: 12,
                                                                                                ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      if (_model
                                                                              .gVcount !=
                                                                          3)
                                                                        Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                10,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: List.generate(colorsVariants.length, (rowIndex) {
                                                                                final rowColorsRecord = colorsVariants[rowIndex];
                                                                                return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                    child: Container(
                                                                                      width: 30,
                                                                                      height: 30,
                                                                                      decoration: BoxDecoration(
                                                                                        color: rowColorsRecord!.codecolor,
                                                                                      ),
                                                                                    ));
                                                                              }),
                                                                            )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                },
                                              )),
                                        ),
                                      ),
                                    ],
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
                            Icons.home_outlined,
                          ),
                          navTwoIcon: Icon(
                            Icons.shopping_bag_sharp,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 27,
                          ),
                          navThreeIcon: Icon(
                            Icons.shopping_cart_outlined,
                          ),
                          navFourIcon: Icon(
                            Icons.favorite_border_sharp,
                          ),
                          navFiveIcon: Icon(
                            Icons.face,
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
