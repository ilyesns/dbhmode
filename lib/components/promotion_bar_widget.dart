import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'promotion_bar_model.dart';
export 'promotion_bar_model.dart';

class PromotionBarWidget extends StatefulWidget {
  const PromotionBarWidget({Key? key}) : super(key: key);

  @override
  _PromotionBarWidgetState createState() => _PromotionBarWidgetState();
}

class _PromotionBarWidgetState extends State<PromotionBarWidget> {
  late PromotionBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromotionBarModel());

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

    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: FlutterFlowTheme.of(context).lineColor,
            offset: Offset(0.0, -1.0),
          )
        ],
      ),
      child: StreamBuilder<List<PromotionRecord>>(
        stream: queryPromotionRecord(),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: SpinKitFadingGrid(
                  color: FlutterFlowTheme.of(context).lineColor,
                  size: 20.0,
                ),
              ),
            );
          }
          List<PromotionRecord> scrollingListPromotionPromotionRecordList =
              snapshot.data!;
          return custom_widgets.ScrollingListPromotion(
            width: double.infinity,
            height: 100.0,
            promotions: scrollingListPromotionPromotionRecordList,
          );
        },
      ),
    );
  }
}
