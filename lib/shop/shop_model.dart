import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/categorymenu_widget.dart';
import '/components/empty_produtc_item_widget.dart';
import '/components/mobileview_widget.dart';
import '/components/webviewnew_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? genderselect = 'women';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webviewnew component.
  late WebviewnewModel webviewnewModel;
  // Model for mobileview component.
  late MobileviewModel mobileviewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webviewnewModel = createModel(context, () => WebviewnewModel());
    mobileviewModel = createModel(context, () => MobileviewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webviewnewModel.dispose();
    mobileviewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
