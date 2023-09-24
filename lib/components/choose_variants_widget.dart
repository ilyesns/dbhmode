import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_to_cart_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_variants_model.dart';
export 'choose_variants_model.dart';

class ChooseVariantsWidget extends StatefulWidget {
  const ChooseVariantsWidget({
    Key? key,
    required this.idparent,
  }) : super(key: key);

  final DocumentReference? idparent;

  @override
  _ChooseVariantsWidgetState createState() => _ChooseVariantsWidgetState();
}

class _ChooseVariantsWidgetState extends State<ChooseVariantsWidget>
    with TickerProviderStateMixin {
  late ChooseVariantsModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 50.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 400.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseVariantsModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 4.0,
      ),
      child: FutureBuilder<ProductRecord>(
        future: ProductRecord.getDocumentOnce(widget.idparent!),
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
          final containerProductRecord = snapshot.data!;
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              shape: BoxShape.rectangle,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Container(
                      width: double.infinity,
                      height: 500.0,
                      constraints: BoxConstraints(
                        maxWidth: 670.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 1.0,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  containerProductRecord.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Text(
                                                  containerProductRecord.info,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'CHOOSE_VARIANTS_close_rounded_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_bottom_sheet');
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ehw2criv' /* COLOR: */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (_model.colorChosen !=
                                                                    null &&
                                                                _model.colorChosen !=
                                                                    '')
                                                              Text(
                                                                _model
                                                                    .colorChosen!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                FutureBuilder<
                                                    List<ColorsRecord>>(
                                                  future:
                                                      queryColorsRecordOnce(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          child:
                                                              SpinKitFadingGrid(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<ColorsRecord>
                                                        rowColorsRecordList =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: List.generate(
                                                          rowColorsRecordList
                                                              .length,
                                                          (rowIndex) {
                                                        final rowColorsRecord =
                                                            rowColorsRecordList[
                                                                rowIndex];
                                                        return FutureBuilder<
                                                            List<
                                                                VariantsRecord>>(
                                                          future:
                                                              queryVariantsRecordOnce(
                                                            parent:
                                                                widget.idparent,
                                                            queryBuilder: (variantsRecord) =>
                                                                variantsRecord.where(
                                                                    'idcolor',
                                                                    isEqualTo:
                                                                        rowColorsRecord
                                                                            .reference),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  child:
                                                                      SpinKitFadingGrid(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<VariantsRecord>
                                                                containerVariantsRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final containerVariantsRecord =
                                                                containerVariantsRecordList
                                                                        .isNotEmpty
                                                                    ? containerVariantsRecordList
                                                                        .first
                                                                    : null;
                                                            return Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'CHOOSE_VARIANTS_Container_anb5zuo3_ON_TA');
                                                                  logFirebaseEvent(
                                                                      'Container_update_widget_state');
                                                                  setState(() {
                                                                    _model.colorChosen =
                                                                        rowColorsRecord
                                                                            .colorName;
                                                                    _model.colorId =
                                                                        rowColorsRecord
                                                                            .reference;
                                                                    _model.stock =
                                                                        true;
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'Container_set_form_field');
                                                                  setState(() {
                                                                    _model.countControllerValue =
                                                                        1;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: rowColorsRecord
                                                                        .codecolor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: rowColorsRecord.reference ==
                                                                              _model
                                                                                  .colorId
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primaryText
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'n3y89ele' /* SIZE: */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: _model
                                                                        .sizeChosen !=
                                                                    null &&
                                                                _model.sizeChosen !=
                                                                    '',
                                                            child: Text(
                                                              _model
                                                                  .sizeChosen!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<SizesRecord>>(
                                                    stream: querySizesRecord(),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 20.0,
                                                            height: 20.0,
                                                            child:
                                                                SpinKitFadingGrid(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lineColor,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<SizesRecord>
                                                          rowSizesRecordList =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            rowSizesRecordList
                                                                .length,
                                                            (rowIndex) {
                                                          final rowSizesRecord =
                                                              rowSizesRecordList[
                                                                  rowIndex];
                                                          return StreamBuilder<
                                                              List<
                                                                  VariantsRecord>>(
                                                            stream:
                                                                queryVariantsRecord(
                                                              parent:
                                                                  containerProductRecord
                                                                      .reference,
                                                              queryBuilder: (variantsRecord) =>
                                                                  variantsRecord.where(
                                                                      'idsize',
                                                                      isEqualTo:
                                                                          rowSizesRecord
                                                                              .reference),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    child:
                                                                        SpinKitFadingGrid(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<VariantsRecord>
                                                                  rowVariantsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final rowVariantsRecord =
                                                                  rowVariantsRecordList
                                                                          .isNotEmpty
                                                                      ? rowVariantsRecordList
                                                                          .first
                                                                      : null;
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CHOOSE_VARIANTS_Container_s58k7awz_ON_TA');
                                                                      logFirebaseEvent(
                                                                          'Container_update_widget_state');
                                                                      setState(
                                                                          () {
                                                                        _model.sizeChosen =
                                                                            rowSizesRecord.size;
                                                                        _model.sizeId =
                                                                            rowSizesRecord.reference;
                                                                        _model.stock =
                                                                            true;
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Container_set_form_field');
                                                                      setState(
                                                                          () {
                                                                        _model.countControllerValue =
                                                                            1;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color: rowSizesRecord.reference == _model.sizeId
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          rowSizesRecord
                                                                              .size,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Open Sans',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 14.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '77rmobim' /* Quantity: */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 140.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: StreamBuilder<
                                                              List<
                                                                  VariantsRecord>>(
                                                            stream:
                                                                queryVariantsRecord(
                                                              parent: widget
                                                                  .idparent,
                                                              queryBuilder: (variantsRecord) => variantsRecord
                                                                  .where(
                                                                      'idsize',
                                                                      isEqualTo:
                                                                          _model
                                                                              .sizeId)
                                                                  .where(
                                                                      'idcolor',
                                                                      isEqualTo:
                                                                          _model
                                                                              .colorId),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    child:
                                                                        SpinKitFadingGrid(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<VariantsRecord>
                                                                  countControllerVariantsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final countControllerVariantsRecord =
                                                                  countControllerVariantsRecordList
                                                                          .isNotEmpty
                                                                      ? countControllerVariantsRecordList
                                                                          .first
                                                                      : null;
                                                              return Container(
                                                                width: 160.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    FlutterFlowCountController(
                                                                  decrementIconBuilder:
                                                                      (enabled) =>
                                                                          FaIcon(
                                                                    FontAwesomeIcons
                                                                        .minus,
                                                                    color: enabled
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryText
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                    size: 18.0,
                                                                  ),
                                                                  incrementIconBuilder:
                                                                      (enabled) =>
                                                                          FaIcon(
                                                                    FontAwesomeIcons
                                                                        .plus,
                                                                    color: enabled
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryText
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                    size: 18.0,
                                                                  ),
                                                                  countBuilder:
                                                                      (count) =>
                                                                          Text(
                                                                    count
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          fontSize:
                                                                              22.0,
                                                                        ),
                                                                  ),
                                                                  count: _model
                                                                      .countControllerValue ??= 0,
                                                                  updateCount:
                                                                      (count) async {
                                                                    setState(() =>
                                                                        _model.countControllerValue =
                                                                            count);
                                                                    logFirebaseEvent(
                                                                        'CHOOSE_VARIANTS_CountController_ro9bhhbb');
                                                                    if (countControllerVariantsRecord!
                                                                            .quantity >=
                                                                        _model
                                                                            .countControllerValue!) {
                                                                      logFirebaseEvent(
                                                                          'CountController_update_widget_state');
                                                                      setState(
                                                                          () {
                                                                        _model.stock =
                                                                            false;
                                                                      });
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'CountController_update_widget_state');
                                                                      setState(
                                                                          () {
                                                                        _model.stock =
                                                                            true;
                                                                      });
                                                                    }
                                                                  },
                                                                  stepSize: 1,
                                                                  minimum: 1,
                                                                  maximum: 10,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<VariantsRecord>>(
                                                stream: queryVariantsRecord(
                                                  parent: widget.idparent,
                                                  queryBuilder: (variantsRecord) =>
                                                      variantsRecord
                                                          .where('idcolor',
                                                              isEqualTo: _model
                                                                  .colorId)
                                                          .where('idsize',
                                                              isEqualTo: _model
                                                                  .sizeId),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        child:
                                                            SpinKitFadingGrid(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<VariantsRecord>
                                                      columnVariantsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final columnVariantsRecord =
                                                      columnVariantsRecordList
                                                              .isNotEmpty
                                                          ? columnVariantsRecordList
                                                              .first
                                                          : null;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (valueOrDefault<bool>(
                                                        (_model.colorId !=
                                                                null) &&
                                                            (_model.sizeId !=
                                                                null),
                                                        true,
                                                      ))
                                                        Text(
                                                          columnVariantsRecord!
                                                                      .quantity >
                                                                  5
                                                              ? 'In stock'
                                                              : '${columnVariantsRecord?.quantity?.toString()} In stock',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FutureBuilder<DiscountsRecord>(
                                              future: DiscountsRecord
                                                  .getDocumentOnce(
                                                      containerProductRecord
                                                          .discount!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      child: SpinKitFadingGrid(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final columnDiscountsRecord =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (columnDiscountsRecord
                                                        .active)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          SelectionArea(
                                                              child: Text(
                                                            '${containerProductRecord.price.toString()}€',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                          )),
                                                          SelectionArea(
                                                              child: Text(
                                                            '${functions.discountedPrice(columnDiscountsRecord.disc, containerProductRecord.price).toString()}€',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontSize:
                                                                      22.0,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                          )),
                                                        ],
                                                      ),
                                                    if (!columnDiscountsRecord
                                                        .active)
                                                      SelectionArea(
                                                          child: Text(
                                                        '${containerProductRecord.price.toString()}€',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              fontSize: 22.0,
                                                              lineHeight: 1.0,
                                                            ),
                                                      )),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  StreamBuilder<DiscountsRecord>(
                                    stream: DiscountsRecord.getDocument(
                                        containerProductRecord.discount!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 20.0,
                                            height: 20.0,
                                            child: SpinKitFadingGrid(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              size: 20.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final rowDiscountsRecord = snapshot.data!;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CHOOSE_VARIANTS_COMP_CLOSE_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_bottom_sheet');
                                              Navigator.pop(context);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '2q6qgkgu' /* Close */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 120.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          StreamBuilder<List<VariantsRecord>>(
                                            stream: queryVariantsRecord(
                                              parent: widget.idparent,
                                              queryBuilder: (variantsRecord) =>
                                                  variantsRecord
                                                      .where('idcolor',
                                                          isEqualTo:
                                                              _model.colorId)
                                                      .where('idsize',
                                                          isEqualTo:
                                                              _model.sizeId),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 20.0,
                                                    height: 20.0,
                                                    child: SpinKitFadingGrid(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<VariantsRecord>
                                                  buttonVariantsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final buttonVariantsRecord =
                                                  buttonVariantsRecordList
                                                          .isNotEmpty
                                                      ? buttonVariantsRecordList
                                                          .first
                                                      : null;
                                              return FFButtonWidget(
                                                onPressed:
                                                    (_model.colorId == null) ||
                                                            (_model.sizeId ==
                                                                null) ||
                                                            _model.stock
                                                        ? null
                                                        : () async {
                                                            logFirebaseEvent(
                                                                'CHOOSE_VARIANTS_ADD_TO_CART_BTN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            var orderItemsRecordReference =
                                                                OrderItemsRecord
                                                                    .collection
                                                                    .doc();
                                                            await orderItemsRecordReference
                                                                .set(
                                                                    createOrderItemsRecordData(
                                                              productId: widget
                                                                  .idparent,
                                                              variants:
                                                                  buttonVariantsRecord
                                                                      ?.reference,
                                                              quantityOrder: _model
                                                                  .countControllerValue,
                                                              createAtOrder:
                                                                  getCurrentTimestamp,
                                                              modifiedAtOrder:
                                                                  getCurrentTimestamp,
                                                              priceOrder:
                                                                  containerProductRecord
                                                                      .price,
                                                              discountOrder: functions.orderdiscount(
                                                                  rowDiscountsRecord
                                                                      .disc,
                                                                  rowDiscountsRecord
                                                                      .active),
                                                            ));
                                                            _model.idOrderItem =
                                                                OrderItemsRecord
                                                                    .getDocumentFromData(
                                                                        createOrderItemsRecordData(
                                                                          productId:
                                                                              widget.idparent,
                                                                          variants:
                                                                              buttonVariantsRecord?.reference,
                                                                          quantityOrder:
                                                                              _model.countControllerValue,
                                                                          createAtOrder:
                                                                              getCurrentTimestamp,
                                                                          modifiedAtOrder:
                                                                              getCurrentTimestamp,
                                                                          priceOrder:
                                                                              containerProductRecord.price,
                                                                          discountOrder: functions.orderdiscount(
                                                                              rowDiscountsRecord.disc,
                                                                              rowDiscountsRecord.active),
                                                                        ),
                                                                        orderItemsRecordReference);
                                                            logFirebaseEvent(
                                                                'Button_update_app_state');
                                                            setState(() {
                                                              FFAppState()
                                                                  .addToCart(_model
                                                                      .idOrderItem!
                                                                      .reference);
                                                              FFAppState().cartsum = FFAppState()
                                                                      .cartsum +
                                                                  functions.returncartprice(
                                                                      _model
                                                                          .idOrderItem
                                                                          ?.quantityOrder,
                                                                      _model
                                                                          .idOrderItem
                                                                          ?.priceOrder,
                                                                      functions.discountedPrice(
                                                                          _model
                                                                              .idOrderItem
                                                                              ?.discountOrder,
                                                                          _model
                                                                              .idOrderItem
                                                                              ?.priceOrder));
                                                            });
                                                            logFirebaseEvent(
                                                                'Button_bottom_sheet');
                                                            Navigator.pop(
                                                                context);
                                                            logFirebaseEvent(
                                                                'Button_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      AddToCartWidget(
                                                                    idparent:
                                                                        containerProductRecord
                                                                            .idSubcategory!,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            setState(() {});
                                                          },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'rqm5n4tf' /* Add to cart */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 120.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                  disabledTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
                  ),
                ],
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
        },
      ),
    );
  }
}
