import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double returncartprice(
  int? quantity,
  double? price,
  double? discountedprice,
) {
  return quantity! * discountedprice!;
}

List<String>? colors(DocumentReference? productref) {
  List<String>? colors = [];

  if (productref != null) {
    productref.collection('variants').get().then((snapshot) {
      List<DocumentSnapshot> documents = snapshot.docs;
      for (var document in documents) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        colors.add(data['color'] as String);
      }
    });
  }

  return colors;
}

double? discountedPrice(
  double? discountPercentage,
  double? originalPrice,
) {
  double discountAmount = originalPrice! * (discountPercentage! / 100);
  double discountedPrice = originalPrice - discountAmount;

  return double.parse(discountedPrice.toStringAsFixed(2));
}

String upperCase(String? string) {
  return string!.toUpperCase();
}

double? orderdiscount(
  double? discountPercentage,
  bool? active,
) {
  // if ative is true return dicountPercentage value else return 0
  if (active!) {
    return discountPercentage;
  } else {
    return 0;
  }
}

String upperCaseFistLetter(String? string) {
  return string!.isEmpty
      ? ''
      : (string[0].toUpperCase() + string.substring(1).toLowerCase());
}

bool checkList(List<String>? list) {
  return list!.isNotEmpty;
}

bool checkString(
  String? name,
  String? search,
) {
  return name!.contains(search!);
}
