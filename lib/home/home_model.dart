import '/backend/backend.dart';
import '/components/footer_webview_widget.dart';
import '/components/mobileview_widget.dart';
import '/components/webviewnew_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? genderselect = 'women';

  ///  State fields for stateful widgets in this page.

  // Model for webviewnew component.
  late WebviewnewModel webviewnewModel;
  // State field(s) for scrollingContent widget.
  ScrollController? scrollingContent;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for footerWebview component.
  late FooterWebviewModel footerWebviewModel;
  // Model for mobileview component.
  late MobileviewModel mobileviewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webviewnewModel = createModel(context, () => WebviewnewModel());
    scrollingContent = ScrollController();
    listViewController = ScrollController();
    footerWebviewModel = createModel(context, () => FooterWebviewModel());
    mobileviewModel = createModel(context, () => MobileviewModel());
  }

  void dispose() {
    webviewnewModel.dispose();
    scrollingContent?.dispose();
    listViewController?.dispose();
    footerWebviewModel.dispose();
    mobileviewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
