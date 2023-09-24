// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool?> verifNameCat(String? nameCat) async {
  // Add your function code here!
  bool verif = false;
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('categories')
      .where('name_category', isEqualTo: nameCat)
      .limit(1)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    verif = true;
  }
  return verif;
}
