import '/backend/backend.dart';
import '/components/choose_variants_widget.dart';
import '/components/footer_webview_widget.dart';
import '/components/mobileview_widget.dart';
import '/components/webviewnew_widget.dart';
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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductItemModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DocumentReference? colorId;

  String? imageRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webviewnew component.
  late WebviewnewModel webviewnewModel;
  // State field(s) for scrollingContent widget.
  ScrollController? scrollingContent;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // State field(s) for ListView widget.
  ScrollController? listViewController4;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController5;
  // Model for footerWebview component.
  late FooterWebviewModel footerWebviewModel;
  // Model for mobileview component.
  late MobileviewModel mobileviewModel;

  /// Query cache managers for this widget.

  final _nameSubCategoriesCacheManager =
      StreamRequestManager<SubCategoriesRecord>();
  Stream<SubCategoriesRecord> nameSubCategoriesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<SubCategoriesRecord> Function() requestFn,
  }) =>
      _nameSubCategoriesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNameSubCategoriesCacheCache() =>
      _nameSubCategoriesCacheManager.clear();
  void clearNameSubCategoriesCacheCacheKey(String? uniqueKey) =>
      _nameSubCategoriesCacheManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webviewnewModel = createModel(context, () => WebviewnewModel());
    scrollingContent = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    listViewController3 = ScrollController();
    listViewController4 = ScrollController();
    columnController = ScrollController();
    listViewController5 = ScrollController();
    footerWebviewModel = createModel(context, () => FooterWebviewModel());
    mobileviewModel = createModel(context, () => MobileviewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webviewnewModel.dispose();
    scrollingContent?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    listViewController3?.dispose();
    listViewController4?.dispose();
    columnController?.dispose();
    listViewController5?.dispose();
    footerWebviewModel.dispose();
    mobileviewModel.dispose();

    /// Dispose query cache managers for this widget.

    clearNameSubCategoriesCacheCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
