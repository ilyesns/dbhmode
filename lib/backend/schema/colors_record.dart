import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColorsRecord extends FirestoreRecord {
  ColorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "color_name" field.
  String? _colorName;
  String get colorName => _colorName ?? '';
  bool hasColorName() => _colorName != null;

  // "codecolor" field.
  Color? _codecolor;
  Color? get codecolor => _codecolor;
  bool hasCodecolor() => _codecolor != null;

  void _initializeFields() {
    _colorName = snapshotData['color_name'] as String?;
    _codecolor = getSchemaColor(snapshotData['codecolor']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('colors');

  static Stream<ColorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ColorsRecord.fromSnapshot(s));

  static Future<ColorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ColorsRecord.fromSnapshot(s));

  static ColorsRecord fromSnapshot(DocumentSnapshot snapshot) => ColorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ColorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ColorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ColorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ColorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createColorsRecordData({
  String? colorName,
  Color? codecolor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'color_name': colorName,
      'codecolor': codecolor,
    }.withoutNulls,
  );

  return firestoreData;
}

class ColorsRecordDocumentEquality implements Equality<ColorsRecord> {
  const ColorsRecordDocumentEquality();

  @override
  bool equals(ColorsRecord? e1, ColorsRecord? e2) {
    return e1?.colorName == e2?.colorName && e1?.codecolor == e2?.codecolor;
  }

  @override
  int hash(ColorsRecord? e) =>
      const ListEquality().hash([e?.colorName, e?.codecolor]);

  @override
  bool isValidKey(Object? o) => o is ColorsRecord;
}
