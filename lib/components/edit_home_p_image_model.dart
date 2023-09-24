import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditHomePImageModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? imageUrl;

  String? gender;

  DocumentReference? idParent;

  bool error = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - subCategoryName] action in EditHomePImage widget.
  String? subname;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for ButtonText widget.
  TextEditingController? buttonTextController;
  String? Function(BuildContext, String?)? buttonTextControllerValidator;
  // State field(s) for order widget.
  int? orderValue;
  FormFieldController<int>? orderValueController;
  // State field(s) for SubCategory widget.
  String? subCategoryValue;
  FormFieldController<String>? subCategoryValueController;
  // Stores action output result for [Custom Action - subCategoryId] action in Button widget.
  DocumentReference? idparent;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    buttonTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
