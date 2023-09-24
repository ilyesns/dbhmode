// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';

Future<void> deleteFileFRomFirebase(String url) async {
  try {
    String filePath = url.replaceAll(
        new RegExp(
            r'https://firebasestorage.googleapis.com/v0/b/dbh-shop.appspot.com/o/'),
        '');
    filePath = filePath.replaceAll(new RegExp(r'%2F'), '/');
    filePath = filePath.replaceAll(new RegExp(r'(\?alt).*'), '');
    FirebaseStorage storage = FirebaseStorage.instance;

    Reference imageRef = storage.ref().child(filePath);

    await imageRef.delete().catchError((val) {
      print('[Error]' + val);
    }).then((_) {
      print('[Sucess] Image deleted');
    });
  } catch (error) {
    print(error);
  }
}
