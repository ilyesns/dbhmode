// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference<Map<String, dynamic>>?> subCategoryId(
    String? nameSubCategory) async {
  // Add your function code here!
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collectionGroup('sub_categories').get();
  dynamic ref;
  querySnapshot.docs.forEach((element) {
    if (element["name_sub_category"] == nameSubCategory)
      ref = element.reference;
  });

  if (ref != null) return ref;
}
