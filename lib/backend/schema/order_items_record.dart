import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderItemsRecord extends FirestoreRecord {
  OrderItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_id" field.
  DocumentReference? _productId;
  DocumentReference? get productId => _productId;
  bool hasProductId() => _productId != null;

  // "variants" field.
  DocumentReference? _variants;
  DocumentReference? get variants => _variants;
  bool hasVariants() => _variants != null;

  // "quantity_order" field.
  int? _quantityOrder;
  int get quantityOrder => _quantityOrder ?? 0;
  bool hasQuantityOrder() => _quantityOrder != null;

  // "create_at_order" field.
  DateTime? _createAtOrder;
  DateTime? get createAtOrder => _createAtOrder;
  bool hasCreateAtOrder() => _createAtOrder != null;

  // "modified_at_order" field.
  DateTime? _modifiedAtOrder;
  DateTime? get modifiedAtOrder => _modifiedAtOrder;
  bool hasModifiedAtOrder() => _modifiedAtOrder != null;

  // "price_order" field.
  double? _priceOrder;
  double get priceOrder => _priceOrder ?? 0.0;
  bool hasPriceOrder() => _priceOrder != null;

  // "discount_order" field.
  double? _discountOrder;
  double get discountOrder => _discountOrder ?? 0.0;
  bool hasDiscountOrder() => _discountOrder != null;

  // "order_details" field.
  DocumentReference? _orderDetails;
  DocumentReference? get orderDetails => _orderDetails;
  bool hasOrderDetails() => _orderDetails != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  void _initializeFields() {
    _productId = snapshotData['product_id'] as DocumentReference?;
    _variants = snapshotData['variants'] as DocumentReference?;
    _quantityOrder = castToType<int>(snapshotData['quantity_order']);
    _createAtOrder = snapshotData['create_at_order'] as DateTime?;
    _modifiedAtOrder = snapshotData['modified_at_order'] as DateTime?;
    _priceOrder = castToType<double>(snapshotData['price_order']);
    _discountOrder = castToType<double>(snapshotData['discount_order']);
    _orderDetails = snapshotData['order_details'] as DocumentReference?;
    _idUser = snapshotData['id_user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_items');

  static Stream<OrderItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderItemsRecord.fromSnapshot(s));

  static Future<OrderItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderItemsRecord.fromSnapshot(s));

  static OrderItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderItemsRecordData({
  DocumentReference? productId,
  DocumentReference? variants,
  int? quantityOrder,
  DateTime? createAtOrder,
  DateTime? modifiedAtOrder,
  double? priceOrder,
  double? discountOrder,
  DocumentReference? orderDetails,
  DocumentReference? idUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_id': productId,
      'variants': variants,
      'quantity_order': quantityOrder,
      'create_at_order': createAtOrder,
      'modified_at_order': modifiedAtOrder,
      'price_order': priceOrder,
      'discount_order': discountOrder,
      'order_details': orderDetails,
      'id_user': idUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderItemsRecordDocumentEquality implements Equality<OrderItemsRecord> {
  const OrderItemsRecordDocumentEquality();

  @override
  bool equals(OrderItemsRecord? e1, OrderItemsRecord? e2) {
    return e1?.productId == e2?.productId &&
        e1?.variants == e2?.variants &&
        e1?.quantityOrder == e2?.quantityOrder &&
        e1?.createAtOrder == e2?.createAtOrder &&
        e1?.modifiedAtOrder == e2?.modifiedAtOrder &&
        e1?.priceOrder == e2?.priceOrder &&
        e1?.discountOrder == e2?.discountOrder &&
        e1?.orderDetails == e2?.orderDetails &&
        e1?.idUser == e2?.idUser;
  }

  @override
  int hash(OrderItemsRecord? e) => const ListEquality().hash([
        e?.productId,
        e?.variants,
        e?.quantityOrder,
        e?.createAtOrder,
        e?.modifiedAtOrder,
        e?.priceOrder,
        e?.discountOrder,
        e?.orderDetails,
        e?.idUser
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderItemsRecord;
}
