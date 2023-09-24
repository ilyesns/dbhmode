import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  static CategoriesRecord getCategoryRecord({
    DocumentReference? reference,
    String? nameCategory,
    String? image,
    String? gender,
    DateTime? createAt,
    DateTime? modifiedAt,
  }) {
    return CategoriesRecord._(reference!, {
      'name_category': nameCategory,
      'image': image,
      'gender': gender,
      'create_at': createAt,
      'modified_at': modifiedAt
    });
  }

  // "name_category" field.
  String? _nameCategory;
  String get nameCategory => _nameCategory ?? '';
  bool hasNameCategory() => _nameCategory != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "create_at" field.
  DateTime? _createAt;
  DateTime? get createAt => _createAt;
  bool hasCreateAt() => _createAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  void _initializeFields() {
    _nameCategory = snapshotData['name_category'] as String?;
    _image = snapshotData['image'] as String?;
    _gender = snapshotData['gender'] as String?;
    _createAt = snapshotData['create_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? nameCategory,
  String? image,
  String? gender,
  DateTime? createAt,
  DateTime? modifiedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name_category': nameCategory,
      'image': image,
      'gender': gender,
      'create_at': createAt,
      'modified_at': modifiedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.nameCategory == e2?.nameCategory &&
        e1?.image == e2?.image &&
        e1?.gender == e2?.gender &&
        e1?.createAt == e2?.createAt &&
        e1?.modifiedAt == e2?.modifiedAt;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.nameCategory, e?.image, e?.gender, e?.createAt, e?.modifiedAt]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
