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

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridWidget extends StatefulWidget {
  const StaggeredGridWidget({
    Key? key,
    this.width,
    this.height,
    this.categories,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<CategoriesRecord>? categories;

  @override
  _StaggeredGridWidgetState createState() => _StaggeredGridWidgetState();
}

class _StaggeredGridWidgetState extends State<StaggeredGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 4,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            itemCount: widget.categories!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  context.pushNamed(
                    'ShopSubCategories',
                    queryParameters: {
                      'categoryref': serializeParam(
                        widget.categories![index].reference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 200),
                      ),
                    },
                  );
                },
                child: Tile(
                  index: index,
                  category: widget.categories![index],
                ),
              );
            },
            staggeredTileBuilder: (index) {
              if (index == 4 && index % 2 == 0)
                return StaggeredTile.count(4, 1);
              if (index % 2 == 0) return StaggeredTile.count(2, 1);
              if (index % 2 == 1) return StaggeredTile.count(1, 2);
            }));
  }
}

class Tile extends StatefulWidget {
  Tile({required this.index, this.category});
  late int index;
  final CategoriesRecord? category;
  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.category!.image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x48101213),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.category!.nameCategory,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Open Sans',
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
