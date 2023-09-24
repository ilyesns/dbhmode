import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/update_role_user_widget.dart';
import '/components/webviewnew_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManageTeamsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for webviewnewCopy component.
  late WebviewnewCopyModel webviewnewCopyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webviewnewCopyModel = createModel(context, () => WebviewnewCopyModel());
  }

  void dispose() {
    webviewnewCopyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
