import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/webviewnew_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManageOrdersModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for webviewnewCopy component.
  late WebviewnewCopyModel webviewnewCopyModel;
  // State field(s) for CheckboxListTile widget.

  Map<OrderDetailsRecord, bool> checkboxListTileValueMap1 = {};
  List<OrderDetailsRecord> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.

  Map<OrderDetailsRecord, bool> checkboxListTileValueMap2 = {};
  List<OrderDetailsRecord> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue4;

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
