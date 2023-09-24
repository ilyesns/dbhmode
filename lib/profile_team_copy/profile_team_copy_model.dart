import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/mobileview_widget.dart';
import '/components/webviewnew_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTeamCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webviewnewCopy component.
  late WebviewnewCopyModel webviewnewCopyModel;
  // Model for mobileview component.
  late MobileviewModel mobileviewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webviewnewCopyModel = createModel(context, () => WebviewnewCopyModel());
    mobileviewModel = createModel(context, () => MobileviewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webviewnewCopyModel.dispose();
    mobileviewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
