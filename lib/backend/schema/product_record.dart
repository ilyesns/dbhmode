import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  static ProductRecord getProductRecord({
    DocumentReference? reference,
    String? name,
    String? info,
    double? price,
    String? image,
    String? brandName,
    DocumentReference? brand,
    DocumentReference? idSubcategory,
    DocumentReference? idCategory,
    DocumentReference? createBy,
    DocumentReference? discount,
    bool? markedAtHome,
    DateTime? createdAt,
  }) {
    return ProductRecord._(reference!, {
      'name': name,
      'info': info,
      'image': image,
      'brand': brand,
      'price': price,
      'brand_name': brandName,
      'id_subcategory': idSubcategory,
      'id_category': idCategory,
      'created_by': createBy,
      'discount': discount,
      'marked_at_home': markedAtHome,
      'created_at': createdAt,
    });
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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "brand" field.
  DocumentReference? _brand;
  DocumentReference? get brand => _brand;
  bool hasBrand() => _brand != null;

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "id_subcategory" field.
  DocumentReference? _idSubcategory;
  DocumentReference? get idSubcategory => _idSubcategory;
  bool hasIdSubcategory() => _idSubcategory != null;

  // "id_category" field.
  DocumentReference? _idCategory;
  DocumentReference? get idCategory => _idCategory;
  bool hasIdCategory() => _idCategory != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "discount" field.
  DocumentReference? _discount;
  DocumentReference? get discount => _discount;
  bool hasDiscount() => _discount != null;

  // "marked_at_home" field.
  bool? _markedAtHome;
  bool get markedAtHome => _markedAtHome ?? false;
  bool hasMarkedAtHome() => _markedAtHome != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _info = snapshotData['info'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _brand = snapshotData['brand'] as DocumentReference?;
    _brandName = snapshotData['brand_name'] as String?;
    _idSubcategory = snapshotData['id_subcategory'] as DocumentReference?;
    _idCategory = snapshotData['id_category'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _discount = snapshotData['discount'] as DocumentReference?;
    _markedAtHome = snapshotData['marked_at_home'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  static ProductRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'info': snapshot.data['info'],
          'price': snapshot.data['price']?.toDouble(),
          'image': snapshot.data['image'],
          'brand': safeGet(
            () => toRef(snapshot.data['brand']),
          ),
          'brand_name': snapshot.data['brand_name'],
          'id_subcategory': safeGet(
            () => toRef(snapshot.data['id_subcategory']),
          ),
          'id_category': safeGet(
            () => toRef(snapshot.data['id_category']),
          ),
          'created_at': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_at']),
          ),
          'created_by': safeGet(
            () => toRef(snapshot.data['created_by']),
          ),
          'discount': safeGet(
            () => toRef(snapshot.data['discount']),
          ),
          'marked_at_home': snapshot.data['marked_at_home'],
        },
        ProductRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'product',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? name,
  String? info,
  double? price,
  String? image,
  DocumentReference? brand,
  String? brandName,
  DocumentReference? idSubcategory,
  DocumentReference? idCategory,
  DateTime? createdAt,
  DocumentReference? createdBy,
  DocumentReference? discount,
  bool? markedAtHome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'info': info,
      'price': price,
      'image': image,
      'brand': brand,
      'brand_name': brandName,
      'id_subcategory': idSubcategory,
      'id_category': idCategory,
      'created_at': createdAt,
      'created_by': createdBy,
      'discount': discount,
      'marked_at_home': markedAtHome,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.info == e2?.info &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.brand == e2?.brand &&
        e1?.brandName == e2?.brandName &&
        e1?.idSubcategory == e2?.idSubcategory &&
        e1?.idCategory == e2?.idCategory &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.discount == e2?.discount &&
        e1?.markedAtHome == e2?.markedAtHome;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.name,
        e?.info,
        e?.price,
        e?.image,
        e?.brand,
        e?.brandName,
        e?.idSubcategory,
        e?.idCategory,
        e?.createdAt,
        e?.createdBy,
        e?.discount,
        e?.markedAtHome
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
