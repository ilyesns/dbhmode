import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_brand_widget.dart';
import '/components/add_category_widget.dart';
import '/components/add_home_p_image_widget.dart';
import '/components/add_product_widget.dart';
import '/components/add_promotion_widget.dart';
import '/components/add_sub_category_widget.dart';
import '/components/add_variant_widget.dart';
import '/components/discount_widget.dart';
import '/components/edit_prdct_add_vrt_widget.dart';
import '/components/empty_produtc_item_widget.dart';
import '/components/webviewnew_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManageProductsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showlist = true;

  ///  State fields for stateful widgets in this page.

  // Model for webviewnewCopy component.
  late WebviewnewCopyModel webviewnewCopyModel;
  // State field(s) for textfiledproduct widget.
  TextEditingController? textfiledproductController;
  String? Function(BuildContext, String?)? textfiledproductControllerValidator;
  // Algolia Search Results from action on IconButton
  List<ProductRecord>? algoliaSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webviewnewCopyModel = createModel(context, () => WebviewnewCopyModel());
  }

  void dispose() {
    webviewnewCopyModel.dispose();
    textfiledproductController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
