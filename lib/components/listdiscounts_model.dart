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

class ListdiscountsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SubCategory widget.
  String? subCategoryValue;
  FormFieldController<String>? subCategoryValueController;
  // Stores action output result for [Custom Action - subCategoryId] action in SubCategory widget.
  DocumentReference? idsubcategory;
  // State field(s) for Checkbox widget.

  Map<ProductRecord, bool> checkboxValueMap = {};
  List<ProductRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
