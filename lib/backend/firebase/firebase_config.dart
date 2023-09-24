import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBN_7_B01Z1RpHn0v7_netaHB7IoTM_BFI",
            authDomain: "dbh-shop.firebaseapp.com",
            projectId: "dbh-shop",
            storageBucket: "dbh-shop.appspot.com",
            messagingSenderId: "585246569039",
            appId: "1:585246569039:web:d8908e99cddfc83245703a",
            measurementId: "G-9HVYFEDJDW"));
  } else {
    await Firebase.initializeApp();
  }
}
