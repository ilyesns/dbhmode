import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'promotion_bar_copy_model.dart';
export 'promotion_bar_copy_model.dart';

class PromotionBarCopyWidget extends StatefulWidget {
  const PromotionBarCopyWidget({Key? key}) : super(key: key);

  @override
  _PromotionBarCopyWidgetState createState() => _PromotionBarCopyWidgetState();
}

class _PromotionBarCopyWidgetState extends State<PromotionBarCopyWidget> {
  late PromotionBarCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromotionBarCopyModel());

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
      child: FutureBuilder<List<PromotionRecord>>(
        future: queryPromotionRecordOnce(
          queryBuilder: (promotionRecord) =>
              promotionRecord.orderBy('created_at', descending: true),
        ),
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
          List<PromotionRecord> listViewPromotionRecordList = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: listViewPromotionRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewPromotionRecord =
                  listViewPromotionRecordList[listViewIndex];
              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    listViewPromotionRecord.promotionName,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
