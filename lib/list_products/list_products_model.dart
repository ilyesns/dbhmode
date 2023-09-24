import '/backend/backend.dart';
import '/components/mobileview_widget.dart';
import '/components/webviewnew_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListProductsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int gVcount = 2;

  double heightCon = 100.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webviewnew component.
  late WebviewnewModel webviewnewModel;
  // Model for mobileview component.
  late MobileviewModel mobileviewModel;

  /// Query cache managers for this widget.

  final _discountManager = FutureRequestManager<DiscountsRecord>();
  Future<DiscountsRecord> discount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<DiscountsRecord> Function() requestFn,
  }) =>
      _discountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDiscountCache() => _discountManager.clear();
  void clearDiscountCacheKey(String? uniqueKey) =>
      _discountManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webviewnewModel = createModel(context, () => WebviewnewModel());
    mobileviewModel = createModel(context, () => MobileviewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webviewnewModel.dispose();
    mobileviewModel.dispose();

    /// Dispose query cache managers for this widget.

    clearDiscountCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
