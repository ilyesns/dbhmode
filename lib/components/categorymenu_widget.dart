import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categorymenu_model.dart';
export 'categorymenu_model.dart';

class CategorymenuWidget extends StatefulWidget {
  const CategorymenuWidget({
    Key? key,
    this.categoryname,
    this.subcategoryname,
  }) : super(key: key);

  final String? categoryname;
  final List<String>? subcategoryname;

  @override
  _CategorymenuWidgetState createState() => _CategorymenuWidgetState();
}

class _CategorymenuWidgetState extends State<CategorymenuWidget> {
  late CategorymenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategorymenuModel());

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
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??= widget.categoryname,
        ),
        options: widget.subcategoryname!,
        onChanged: (val) async {
          setState(() => _model.dropDownValue = val);
          logFirebaseEvent('CATEGORYMENU_DropDown_8chckkge_ON_FORM_W');
          logFirebaseEvent('DropDown_custom_action');
          _model.subcatid = await actions.subCategoryId(
            _model.dropDownValue,
          );
          logFirebaseEvent('DropDown_navigate_to');

          context.pushNamed(
            'ListProducts',
            queryParameters: {
              'subcategoryref': serializeParam(
                _model.subcatid,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );

          setState(() {});
        },
        width: 170.0,
        height: 50.0,
        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Open Sans',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Open Sans',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
        hintText: widget.categoryname,
        searchHintText: FFLocalizations.of(context).getText(
          'st7kwi8v' /* Search for an item... */,
        ),
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 2.0,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
        borderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
        hidesUnderline: true,
        isSearchable: true,
      ),
    );
  }
}
