import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_product_variant_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'listdiscounts_model.dart';
export 'listdiscounts_model.dart';

class ListdiscountsWidget extends StatefulWidget {
  const ListdiscountsWidget({Key? key}) : super(key: key);

  @override
  _ListdiscountsWidgetState createState() => _ListdiscountsWidgetState();
}

class _ListdiscountsWidgetState extends State<ListdiscountsWidget> {
  late ListdiscountsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListdiscountsModel());

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

    return Visibility(
      visible: valueOrDefault(currentUserDocument?.role, '') == 'admin',
      child: AuthUserStreamWidget(
        builder: (context) => ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 1.0),
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.0,
                      color: Color(0xFFDFEDEC),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 8.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 253.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Color(0x0006D5CD),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: StreamBuilder<List<SubCategoriesRecord>>(
                            stream: querySubCategoriesRecord(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitFadingGrid(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              List<SubCategoriesRecord>
                                  subCategorySubCategoriesRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller:
                                    _model.subCategoryValueController ??=
                                        FormFieldController<String>(null),
                                options: subCategorySubCategoriesRecordList
                                    .map((e) => e.nameSubCategory)
                                    .toList(),
                                onChanged: (val) async {
                                  setState(() => _model.subCategoryValue = val);
                                  logFirebaseEvent(
                                      'LISTDISCOUNTS_SubCategory_ON_FORM_WIDGET');
                                  logFirebaseEvent('SubCategory_custom_action');
                                  _model.idsubcategory =
                                      await actions.subCategoryId(
                                    _model.subCategoryValue,
                                  );

                                  setState(() {});
                                },
                                width: 558.0,
                                height: 70.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'd2ueb2qr' /* Please select a sub category.. */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).secondary,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                              );
                            },
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'LISTDISCOUNTS_close_rounded_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 1.0),
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.0,
                      color: Color(0xFFDFEDEC),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                ),
                child: StreamBuilder<List<ProductRecord>>(
                  stream: queryProductRecord(
                    queryBuilder: (productRecord) => productRecord.where(
                        'id_subcategory',
                        isEqualTo: _model.idsubcategory),
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
                    List<ProductRecord> listViewProductRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewProductRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewProductRecord =
                            listViewProductRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 8.0, 12.0),
                          child: StreamBuilder<DiscountsRecord>(
                            stream: DiscountsRecord.getDocument(
                                listViewProductRecord.discount!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitFadingGrid(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              final rowDiscountsRecord = snapshot.data!;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 36.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF06D5CD),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LISTDISCOUNTS_COMP_Image_1pf9kbbp_ON_TAP');
                                        logFirebaseEvent('Image_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: AddProductVariantWidget(
                                                idparent: listViewProductRecord
                                                    .reference,
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          listViewProductRecord.image,
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listViewProductRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF101518),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Text(
                                            '${rowDiscountsRecord.disc.toString()}%',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF101518),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF57636C),
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValueMap[
                                              listViewProductRecord] ??=
                                          rowDiscountsRecord.active,
                                      onChanged: (newValue) async {
                                        setState(() => _model.checkboxValueMap[
                                            listViewProductRecord] = newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'LISTDISCOUNTS_Checkbox_orlw5ygg_ON_TOGGL');
                                          logFirebaseEvent(
                                              'Checkbox_backend_call');

                                          await rowDiscountsRecord.reference
                                              .update(createDiscountsRecordData(
                                            active: true,
                                            modifiedAt: getCurrentTimestamp,
                                          ));
                                        } else {
                                          logFirebaseEvent(
                                              'LISTDISCOUNTS_Checkbox_orlw5ygg_ON_TOGGL');
                                          logFirebaseEvent(
                                              'Checkbox_backend_call');

                                          await rowDiscountsRecord.reference
                                              .update(createDiscountsRecordData(
                                            active: false,
                                            modifiedAt: getCurrentTimestamp,
                                          ));
                                        }
                                      },
                                      activeColor: Color(0xFF06D5CD),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
