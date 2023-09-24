import '/backend/backend.dart';
import '/components/categorymenu_widget.dart';
import '/components/promotion_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WebviewnewModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String gender = 'women';

  ///  State fields for stateful widgets in this component.

  // Model for promotionBar component.
  late PromotionBarModel promotionBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    promotionBarModel = createModel(context, () => PromotionBarModel());
  }

  void dispose() {
    promotionBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
