import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BrandRecord extends FirestoreRecord {
  BrandRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('brand');

  static Stream<BrandRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BrandRecord.fromSnapshot(s));

  static Future<BrandRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BrandRecord.fromSnapshot(s));

  static BrandRecord fromSnapshot(DocumentSnapshot snapshot) => BrandRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BrandRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BrandRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BrandRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BrandRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBrandRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class BrandRecordDocumentEquality implements Equality<BrandRecord> {
  const BrandRecordDocumentEquality();

  @override
  bool equals(BrandRecord? e1, BrandRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(BrandRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is BrandRecord;
}
