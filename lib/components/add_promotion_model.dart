import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_promotion_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPromotionModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? imageUrl;

  String? gender;

  bool? error = false;

  bool? verif = false;

  bool? error2 = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for promotionName widget.
  TextEditingController? promotionNameController;
  String? Function(BuildContext, String?)? promotionNameControllerValidator;
  String? _promotionNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oljjpdrh' /* Field is required */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    promotionNameControllerValidator = _promotionNameControllerValidator;
  }

  void dispose() {
    promotionNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
