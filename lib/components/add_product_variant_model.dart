import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/listvariant_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class AddProductVariantModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<String> imageUrl = [];
  void addToImageUrl(String item) => imageUrl.add(item);
  void removeFromImageUrl(String item) => imageUrl.remove(item);
  void removeAtIndexFromImageUrl(int index) => imageUrl.removeAt(index);
  void updateImageUrlAtIndex(int index, Function(String) updateFn) =>
      imageUrl[index] = updateFn(imageUrl[index]);

  String? gender;

  bool error1 = false;

  bool error2 = false;

  bool error3 = false;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Color widget.
  String? colorValue;
  FormFieldController<String>? colorValueController;
  // State field(s) for Size widget.
  String? sizeValue;
  FormFieldController<String>? sizeValueController;
  // State field(s) for Quantity widget.
  int? quantityValue;
  // Stores action output result for [Custom Action - colorID] action in Button widget.
  DocumentReference? colorId;
  // Stores action output result for [Custom Action - sizeID] action in Button widget.
  DocumentReference? sizeId;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for discountName widget.
  TextEditingController? discountNameController;
  String? Function(BuildContext, String?)? discountNameControllerValidator;
  String? _discountNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ckjzia5p' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for discountDesc widget.
  TextEditingController? discountDescController;
  String? Function(BuildContext, String?)? discountDescControllerValidator;
  String? _discountDescControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tudjgklb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for discountPercent widget.
  TextEditingController? discountPercentController;
  String? Function(BuildContext, String?)? discountPercentControllerValidator;
  String? _discountPercentControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h83nb113' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Active widget.
  bool? activeValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscountsRecord? idOlddiscount;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    discountNameControllerValidator = _discountNameControllerValidator;
    discountDescControllerValidator = _discountDescControllerValidator;
    discountPercentControllerValidator = _discountPercentControllerValidator;
  }

  void dispose() {
    discountNameController?.dispose();
    discountDescController?.dispose();
    discountPercentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
