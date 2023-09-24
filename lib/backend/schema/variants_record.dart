import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VariantsRecord extends FirestoreRecord {
  VariantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "idcolor" field.
  DocumentReference? _idcolor;
  DocumentReference? get idcolor => _idcolor;
  bool hasIdcolor() => _idcolor != null;

  // "idsize" field.
  DocumentReference? _idsize;
  DocumentReference? get idsize => _idsize;
  bool hasIdsize() => _idsize != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _images = getDataList(snapshotData['images']);
    _idcolor = snapshotData['idcolor'] as DocumentReference?;
    _idsize = snapshotData['idsize'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('variants')
          : FirebaseFirestore.instance.collectionGroup('variants');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('variants').doc();

  static Stream<VariantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VariantsRecord.fromSnapshot(s));

  static Future<VariantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VariantsRecord.fromSnapshot(s));

  static VariantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VariantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VariantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VariantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VariantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VariantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVariantsRecordData({
  DocumentReference? idcolor,
  DocumentReference? idsize,
  int? quantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idcolor': idcolor,
      'idsize': idsize,
      'quantity': quantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class VariantsRecordDocumentEquality implements Equality<VariantsRecord> {
  const VariantsRecordDocumentEquality();

  @override
  bool equals(VariantsRecord? e1, VariantsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.images, e2?.images) &&
        e1?.idcolor == e2?.idcolor &&
        e1?.idsize == e2?.idsize &&
        e1?.quantity == e2?.quantity;
  }

  @override
  int hash(VariantsRecord? e) => const ListEquality()
      .hash([e?.images, e?.idcolor, e?.idsize, e?.quantity]);

  @override
  bool isValidKey(Object? o) => o is VariantsRecord;
}
