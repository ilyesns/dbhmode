import '/backend/backend.dart';
import '/components/mobileview_widget.dart';
import '/components/webviewnew_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for webviewnew component.
  late WebviewnewModel webviewnewModel;
  // State field(s) for search widget.
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
  // Algolia Search Results from action on search
  List<ProductRecord>? algoliaSearchResults = [];
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Model for mobileview component.
  late MobileviewModel mobileviewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webviewnewModel = createModel(context, () => WebviewnewModel());
    mobileviewModel = createModel(context, () => MobileviewModel());
  }

  void dispose() {
    webviewnewModel.dispose();
    searchController?.dispose();
    mobileviewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
