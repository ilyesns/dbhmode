// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future deleteDocs(DocumentReference? idproduct) async {
  // Add your function code here!
  WriteBatch batch = FirebaseFirestore.instance.batch();

  // Delete the product document

  // Delete all variants of the product
  await FirebaseFirestore.instance
      .collection('product')
      .doc(idproduct!.id)
      .collection('variants')
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((document) {
      batch.delete(document.reference);
    });
  });

  // Commit the batch operation
  await batch.commit();
}
