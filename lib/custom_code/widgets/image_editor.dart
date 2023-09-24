// Automatic FlutterFlow imports
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dbhmode/flutter_flow/flutter_flow_util.dart';

import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '/backend/backend.dart';

// Imports custom functions
import 'package:flutter/material.dart';

class ImageEditortest extends StatefulWidget {
  const ImageEditortest(
      {Key? key,
      this.width,
      this.height,
      this.homeImageId,
      required this.image,
      required this.aspectRatio})
      : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? homeImageId;
  final String? image;
  final double aspectRatio;

  @override
  _ImageEditortestState createState() => _ImageEditortestState();
}

class _ImageEditortestState extends State<ImageEditortest> {
  double top = 0.0;
  double left = 0.0;
  String? imageUrl;
  double width = 0.0;
  double height = 0.0;
  double gestureScaleFactor = -0.05; //0.005 for 2000 ,
  double _imageX = 0.0;
  double _imageY = 0.0;

  @override
  void initState() {
    super.initState();
    // Fetch the image URL and position from Firebase
    fetchImageAndPosition();
  }

  Future<void> updateImagePosition(double newTop, double newLeft) async {
    if (widget.homeImageId != null) {
      await widget.homeImageId!.update({
        'top': newTop,
        'left': newLeft,
      });
    }
  }

  Future<Size> _calculateImageDimension() {
    Completer<Size> completer = Completer();
    Image image = Image.network(imageUrl!);
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());

          setState(() {
            width = size.width;
            height = size.height;
            print(size.width);
            print(size.height);
            if (height >= width + 500)
              gestureScaleFactor = -0.03 * (width / height);
            if (width >= height + 500)
              gestureScaleFactor = -0.003 * (width / height);
            if (width == height) gestureScaleFactor = -0.03 * (width / height);
          });
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  Future<void> fetchImageAndPosition() async {
    if (widget.homeImageId != null) {
      final documentSnapshot = await widget.homeImageId!.get();
      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          imageUrl = data['image'];
          top = data['top'] ?? 0.0;
          left = data['left'] ?? 0.0;
        });
      }
      _calculateImageDimension();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 4.0,
      ),
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          height: MediaQuery.sizeOf(context).height * 0.6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'jfqd8u01' /* Edit Home Image Position*/,
                          ),
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADD_HOME_P_IMAGE_close_rounded_ICN_ON_TA');
                        logFirebaseEvent('IconButton_bottom_sheet');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(156, 0, 0, 0),
                    ),
                    child: GestureDetector(
                      onPanUpdate: (details) async {
                        setState(() {
                          top += details.delta.dy * gestureScaleFactor;

                          left += details.delta.dx * gestureScaleFactor;
                          print(gestureScaleFactor);
                        });
                      },
                      child: imageUrl != null
                          ? AspectRatio(
                              aspectRatio: widget.aspectRatio,
                              child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                alignment: () {
                                  Alignment alignment = Alignment(left, top);
                                  print('Alignment: $alignment');
                                  return alignment;
                                }(),
                                fit: BoxFit.cover,
                                image: Image.network(
                                  widget.image!,
                                ).image,
                              ))),
                            )
                          : Container(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      text: FFLocalizations.of(context).getText(
                        'k48ma4q7' /* Reset  */,
                      ),
                      onPressed: () async {
                        setState(() {
                          top = 0.0;
                          left = 0.0;
                        });
                      },
                      options: FFButtonOptions(
                        width: 100,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    FFButtonWidget(
                      text: FFLocalizations.of(context).getText(
                        'k48ma4q6' /*  Update frame image */,
                      ),
                      onPressed: () async {
                        await updateImagePosition(top, left);

                        context.pop();
                      },
                      options: FFButtonOptions(
                        width: 170,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
