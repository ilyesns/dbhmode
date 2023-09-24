import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_color_item_widget.dart';
import '/components/delete_size_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddVariantModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for Color widget.
  TextEditingController? colorController;
  String? Function(BuildContext, String?)? colorControllerValidator;
  Color? colorPicked;
  // State field(s) for Size widget.
  TextEditingController? sizeController;
  String? Function(BuildContext, String?)? sizeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    colorController?.dispose();
    sizeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
