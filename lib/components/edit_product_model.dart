import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_product_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class EditProductModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? imageUrl;

  String? gender;

  DocumentReference? idParent;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for productName widget.
  TextEditingController? productNameController;
  String? Function(BuildContext, String?)? productNameControllerValidator;
  // State field(s) for productInfo widget.
  TextEditingController? productInfoController;
  String? Function(BuildContext, String?)? productInfoControllerValidator;
  // State field(s) for productPrice widget.
  TextEditingController? productPriceController;
  String? Function(BuildContext, String?)? productPriceControllerValidator;
  // State field(s) for productBrand widget.
  TextEditingController? productBrandController;
  String? Function(BuildContext, String?)? productBrandControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for SubCategoryDD widget.
  String? subCategoryDDValue;
  FormFieldController<String>? subCategoryDDValueController;
  // Stores action output result for [Custom Action - subCategoryId] action in Button widget.
  DocumentReference? idSub;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    productNameController?.dispose();
    productInfoController?.dispose();
    productPriceController?.dispose();
    productBrandController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
