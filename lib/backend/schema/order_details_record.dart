import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderDetailsRecord extends FirestoreRecord {
  OrderDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id_order" field.
  DocumentReference? _userIdOrder;
  DocumentReference? get userIdOrder => _userIdOrder;
  bool hasUserIdOrder() => _userIdOrder != null;

  // "total_order" field.
  double? _totalOrder;
  double get totalOrder => _totalOrder ?? 0.0;
  bool hasTotalOrder() => _totalOrder != null;

  // "created_order_details" field.
  DateTime? _createdOrderDetails;
  DateTime? get createdOrderDetails => _createdOrderDetails;
  bool hasCreatedOrderDetails() => _createdOrderDetails != null;

  // "modified_order_details" field.
  DateTime? _modifiedOrderDetails;
  DateTime? get modifiedOrderDetails => _modifiedOrderDetails;
  bool hasModifiedOrderDetails() => _modifiedOrderDetails != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "paymentId" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  bool hasPaymentId() => _paymentId != null;

  // "OrderItem" field.
  List<DocumentReference>? _orderItem;
  List<DocumentReference> get orderItem => _orderItem ?? const [];
  bool hasOrderItem() => _orderItem != null;

  void _initializeFields() {
    _userIdOrder = snapshotData['user_id_order'] as DocumentReference?;
    _totalOrder = castToType<double>(snapshotData['total_order']);
    _createdOrderDetails = snapshotData['created_order_details'] as DateTime?;
    _modifiedOrderDetails = snapshotData['modified_order_details'] as DateTime?;
    _status = snapshotData['status'] as bool?;
    _paymentId = snapshotData['paymentId'] as String?;
    _orderItem = getDataList(snapshotData['OrderItem']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_details');

  static Stream<OrderDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderDetailsRecord.fromSnapshot(s));

  static Future<OrderDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderDetailsRecord.fromSnapshot(s));

  static OrderDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderDetailsRecordData({
  DocumentReference? userIdOrder,
  double? totalOrder,
  DateTime? createdOrderDetails,
  DateTime? modifiedOrderDetails,
  bool? status,
  String? paymentId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id_order': userIdOrder,
      'total_order': totalOrder,
      'created_order_details': createdOrderDetails,
      'modified_order_details': modifiedOrderDetails,
      'status': status,
      'paymentId': paymentId,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderDetailsRecordDocumentEquality
    implements Equality<OrderDetailsRecord> {
  const OrderDetailsRecordDocumentEquality();

  @override
  bool equals(OrderDetailsRecord? e1, OrderDetailsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userIdOrder == e2?.userIdOrder &&
        e1?.totalOrder == e2?.totalOrder &&
        e1?.createdOrderDetails == e2?.createdOrderDetails &&
        e1?.modifiedOrderDetails == e2?.modifiedOrderDetails &&
        e1?.status == e2?.status &&
        e1?.paymentId == e2?.paymentId &&
        listEquality.equals(e1?.orderItem, e2?.orderItem);
  }

  @override
  int hash(OrderDetailsRecord? e) => const ListEquality().hash([
        e?.userIdOrder,
        e?.totalOrder,
        e?.createdOrderDetails,
        e?.modifiedOrderDetails,
        e?.status,
        e?.paymentId,
        e?.orderItem
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderDetailsRecord;
}
