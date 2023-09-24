// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> updateHomeImage(int? order) async {
  // Add your function code here!
  final query = await queryHomeImagesRecordOnce(
      queryBuilder: (q) => q.where('order_image', isEqualTo: order),
      singleRecord: true);
  if (query.isNotEmpty) {
    return query[0].reference;
  } else {
    return null;
  }
}
