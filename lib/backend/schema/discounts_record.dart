import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiscountsRecord extends FirestoreRecord {
  DiscountsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "disc" field.
  double? _disc;
  double get disc => _disc ?? 0.0;
  bool hasDisc() => _disc != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _desc = snapshotData['desc'] as String?;
    _disc = castToType<double>(snapshotData['disc']);
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('discounts');

  static Stream<DiscountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiscountsRecord.fromSnapshot(s));

  static Future<DiscountsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiscountsRecord.fromSnapshot(s));

  static DiscountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiscountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiscountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiscountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiscountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiscountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiscountsRecordData({
  String? name,
  String? desc,
  double? disc,
  bool? active,
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'desc': desc,
      'disc': disc,
      'active': active,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiscountsRecordDocumentEquality implements Equality<DiscountsRecord> {
  const DiscountsRecordDocumentEquality();

  @override
  bool equals(DiscountsRecord? e1, DiscountsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.desc == e2?.desc &&
        e1?.disc == e2?.disc &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.image == e2?.image;
  }

  @override
  int hash(DiscountsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.desc,
        e?.disc,
        e?.active,
        e?.createdAt,
        e?.modifiedAt,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is DiscountsRecord;
}
