import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubCategoriesRecord extends FirestoreRecord {
  SubCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  static SubCategoriesRecord getSubCategoryRecord({
    DocumentReference? reference,
    String? nameSubCategory,
    String? image,
    String? gender,
    DateTime? createAt,
    DateTime? modifiedAt,
  }) {
    return SubCategoriesRecord._(reference!, {
      'name_sub_category': nameSubCategory,
      'image': image,
      'create_at': createAt,
      'modified_at': modifiedAt
    });
  }

  // "id_parent" field.
  DocumentReference? _idParent;
  DocumentReference? get idParent => _idParent;
  bool hasIdParent() => _idParent != null;

  // "name_sub_category" field.
  String? _nameSubCategory;
  String get nameSubCategory => _nameSubCategory ?? '';
  bool hasNameSubCategory() => _nameSubCategory != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "create_at" field.
  DateTime? _createAt;
  DateTime? get createAt => _createAt;
  bool hasCreateAt() => _createAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idParent = snapshotData['id_parent'] as DocumentReference?;
    _nameSubCategory = snapshotData['name_sub_category'] as String?;
    _image = snapshotData['image'] as String?;
    _createAt = snapshotData['create_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sub_categories')
          : FirebaseFirestore.instance.collectionGroup('sub_categories');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('sub_categories').doc();

  static Stream<SubCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubCategoriesRecord.fromSnapshot(s));

  static Future<SubCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubCategoriesRecord.fromSnapshot(s));

  static SubCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubCategoriesRecordData({
  DocumentReference? idParent,
  String? nameSubCategory,
  String? image,
  DateTime? createAt,
  DateTime? modifiedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_parent': idParent,
      'name_sub_category': nameSubCategory,
      'image': image,
      'create_at': createAt,
      'modified_at': modifiedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubCategoriesRecordDocumentEquality
    implements Equality<SubCategoriesRecord> {
  const SubCategoriesRecordDocumentEquality();

  @override
  bool equals(SubCategoriesRecord? e1, SubCategoriesRecord? e2) {
    return e1?.idParent == e2?.idParent &&
        e1?.nameSubCategory == e2?.nameSubCategory &&
        e1?.image == e2?.image &&
        e1?.createAt == e2?.createAt &&
        e1?.modifiedAt == e2?.modifiedAt;
  }

  @override
  int hash(SubCategoriesRecord? e) => const ListEquality().hash(
      [e?.idParent, e?.nameSubCategory, e?.image, e?.createAt, e?.modifiedAt]);

  @override
  bool isValidKey(Object? o) => o is SubCategoriesRecord;
}
