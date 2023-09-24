import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'imageeditor_model.dart';
export 'imageeditor_model.dart';

class ImageeditorWidget extends StatefulWidget {
  const ImageeditorWidget({
    Key? key,
    required this.imageref,
  }) : super(key: key);

  final DocumentReference? imageref;

  @override
  _ImageeditorWidgetState createState() => _ImageeditorWidgetState();
}

class _ImageeditorWidgetState extends State<ImageeditorWidget> {
  late ImageeditorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageeditorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return custom_widgets.ImageEditor(
      homeImageId: widget.imageref,
    );
  }
}
