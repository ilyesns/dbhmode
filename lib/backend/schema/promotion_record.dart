import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionRecord extends FirestoreRecord {
  PromotionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "promotion_name" field.
  String? _promotionName;
  String get promotionName => _promotionName ?? '';
  bool hasPromotionName() => _promotionName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  void _initializeFields() {
    _promotionName = snapshotData['promotion_name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promotion');

  static Stream<PromotionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromotionRecord.fromSnapshot(s));

  static Future<PromotionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromotionRecord.fromSnapshot(s));

  static PromotionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromotionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromotionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromotionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromotionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromotionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromotionRecordData({
  String? promotionName,
  DateTime? createdAt,
  DateTime? modifiedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'promotion_name': promotionName,
      'created_at': createdAt,
      'modified_at': modifiedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromotionRecordDocumentEquality implements Equality<PromotionRecord> {
  const PromotionRecordDocumentEquality();

  @override
  bool equals(PromotionRecord? e1, PromotionRecord? e2) {
    return e1?.promotionName == e2?.promotionName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt;
  }

  @override
  int hash(PromotionRecord? e) => const ListEquality()
      .hash([e?.promotionName, e?.createdAt, e?.modifiedAt]);

  @override
  bool isValidKey(Object? o) => o is PromotionRecord;
}
