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

import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

class CategoriesDragDrop extends StatefulWidget {
  const CategoriesDragDrop({
    Key? key,
    this.width,
    this.height,
    this.categories,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<DocumentReference>? categories;

  @override
  _CategoriesDragDropState createState() => _CategoriesDragDropState();
}

class _CategoriesDragDropState extends State<CategoriesDragDrop> {
  List<DocumentSnapshot> _categories = [];

  @override
  void initState() {
    super.initState();
    // Fetch categories data from Firestore
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .orderBy('modified_at')
        .get();

    setState(() {
      _categories = querySnapshot.docs;
    });
  }

  void onCategoryReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final category = _categories.removeAt(oldIndex);
      _categories.insert(newIndex, category);
      updateModifiedAt();
    });
  }

  void updateModifiedAt() {
    for (int i = 0; i < _categories.length; i++) {
      final category = _categories[i];
      category.reference.update({'modified_at': DateTime.now()});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      physics: NeverScrollableScrollPhysics(),
      onReorder: onCategoryReorder,
      children: _categories
          .map(
            (category) => ListTile(
              key: ValueKey(category.id),
              title: Text(category['name_category']),
            ),
          )
          .toList(),
    );
  }
}
