// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updateDisc(
  DocumentReference? idsubcategory,
  String? namedisc,
  String? desscrption,
  String? image,
  double? discvalue,
  bool? active,
) async {
  try {
    // Search for products with matching subcategory id
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('product')
        .where('id_subcategory', isEqualTo: idsubcategory)
        .get();

    // Update discounts collection for each matching product
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      // Get the discount reference for the current product
      DocumentReference? discountRef = doc['discount'];

      if (discountRef != null) {
        await discountRef.set({
          'name': namedisc,
          'desc': desscrption,
          'image': image,
          'disc': discvalue,
          'active': active,
          'created_at': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      }
    }
  } catch (e) {
    print('Error updating discounts: $e');
  }
}
