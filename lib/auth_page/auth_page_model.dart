import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for comfirmpassword widget.
  TextEditingController? comfirmpasswordController;
  late bool comfirmpasswordVisibility;
  String? Function(BuildContext, String?)? comfirmpasswordControllerValidator;
  // State field(s) for emailAddressSignin widget.
  TextEditingController? emailAddressSigninController;
  String? Function(BuildContext, String?)?
      emailAddressSigninControllerValidator;
  // State field(s) for passwordSignin widget.
  TextEditingController? passwordSigninController;
  late bool passwordSigninVisibility;
  String? Function(BuildContext, String?)? passwordSigninControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    comfirmpasswordVisibility = false;
    passwordSigninVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
    comfirmpasswordController?.dispose();
    emailAddressSigninController?.dispose();
    passwordSigninController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
