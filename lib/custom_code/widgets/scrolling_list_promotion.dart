// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class ScrollingListPromotion extends StatefulWidget {
  const ScrollingListPromotion({
    Key? key,
    this.width,
    this.height,
    this.promotions,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<PromotionRecord>? promotions;

  @override
  _ScrollingListPromotionState createState() => _ScrollingListPromotionState();
}

class _ScrollingListPromotionState extends State<ScrollingListPromotion> {
  final ScrollController _scrollController = ScrollController();

  Timer? _timer;
  int _currentIndex = 0;

  void _startScrolling() {
    _timer =
        Timer.periodic(Duration(seconds: 1) + Duration(seconds: 4), (timer) {
      if (_currentIndex < widget.promotions!.length - 1) {
        _currentIndex++;
        _scrollController.animateTo(
            _currentIndex * MediaQuery.sizeOf(context).width,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut);
      } else {
        _currentIndex = 0;
        _scrollController.animateTo(0,
            duration: Duration(seconds: 1), curve: Curves.easeInOut);
      }
    });
  }

  void _stopScrolling() {
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  @override
  void dispose() {
    _stopScrolling();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.promotions!.length,
      itemBuilder: (context, listViewIndex) {
        final listViewPromotionRecord = widget.promotions![listViewIndex];
        return Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              listViewPromotionRecord.promotionName.toUpperCase(),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Open Sans',
                    color: FlutterFlowTheme.of(context).primary,
                  ),
            ),
          ),
        );
      },
    );
  }
}
