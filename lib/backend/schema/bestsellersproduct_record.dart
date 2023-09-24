import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BestsellersproductRecord extends FirestoreRecord {
  BestsellersproductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "info" field.
  String? _info;
  String get info => _info ?? '';
  bool hasInfo() => _info != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "brand" field.
  DocumentReference? _brand;
  DocumentReference? get brand => _brand;
  bool hasBrand() => _brand != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _info = snapshotData['info'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _brand = snapshotData['brand'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bestsellersproduct');

  static Stream<BestsellersproductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BestsellersproductRecord.fromSnapshot(s));

  static Future<BestsellersproductRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BestsellersproductRecord.fromSnapshot(s));

  static BestsellersproductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BestsellersproductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BestsellersproductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BestsellersproductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BestsellersproductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BestsellersproductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBestsellersproductRecordData({
  String? name,
  String? info,
  double? price,
  DocumentReference? brand,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'info': info,
      'price': price,
      'brand': brand,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class BestsellersproductRecordDocumentEquality
    implements Equality<BestsellersproductRecord> {
  const BestsellersproductRecordDocumentEquality();

  @override
  bool equals(BestsellersproductRecord? e1, BestsellersproductRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.info == e2?.info &&
        e1?.price == e2?.price &&
        e1?.brand == e2?.brand &&
        e1?.image == e2?.image;
  }

  @override
  int hash(BestsellersproductRecord? e) => const ListEquality()
      .hash([e?.name, e?.info, e?.price, e?.brand, e?.image]);

  @override
  bool isValidKey(Object? o) => o is BestsellersproductRecord;
}
