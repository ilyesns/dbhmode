// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool?> verifNameSubCat(String? nameSubCat) async {
  // Add your function code here!
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collectionGroup('sub_categories').get();
  bool ref = false;
  querySnapshot.docs.forEach((element) {
    if (element["name_sub_category"].toLowerCase() == nameSubCat!.toLowerCase())
      ref = true;
  });
  return ref;
}
