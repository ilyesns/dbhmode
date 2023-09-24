import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomeImagesRecord extends FirestoreRecord {
  HomeImagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  static HomeImagesRecord getHomeImageRecord(
      {String? image,
      String? buttonText,
      DocumentReference? reference,
      DocumentReference? linkSubCategory,
      int? orderImage,
      double? top,
      double? left}) {
    return HomeImagesRecord._(reference!, {
      'link_sub_category': linkSubCategory,
      'order_image': orderImage,
      'image': image,
      'button_text': buttonText,
      'top': top,
      'left': left
    });
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "button_text" field.
  String? _buttonText;
  String get buttonText => _buttonText ?? '';
  bool hasButtonText() => _buttonText != null;

  // "link_sub_category" field.
  DocumentReference? _linkSubCategory;
  DocumentReference? get linkSubCategory => _linkSubCategory;
  bool hasLinkSubCategory() => _linkSubCategory != null;

  // "order_image" field.
  int? _orderImage;
  int get orderImage => _orderImage ?? 0;
  bool hasOrderImage() => _orderImage != null;

  // "left" field.
  double? _left;
  double get left => _left ?? 0.0;
  bool hasLeft() => _left != null;

  // "top" field.
  double? _top;
  double get top => _top ?? 0.0;
  bool hasTop() => _top != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _buttonText = snapshotData['button_text'] as String?;
    _linkSubCategory = snapshotData['link_sub_category'] as DocumentReference?;
    _orderImage = castToType<int>(snapshotData['order_image']);
    _left = castToType<double>(snapshotData['left']);
    _top = castToType<double>(snapshotData['top']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('home_images');

  static Stream<HomeImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HomeImagesRecord.fromSnapshot(s));

  static Future<HomeImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HomeImagesRecord.fromSnapshot(s));

  static HomeImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HomeImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HomeImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HomeImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HomeImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HomeImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHomeImagesRecordData({
  String? image,
  String? buttonText,
  DocumentReference? linkSubCategory,
  int? orderImage,
  double? left,
  double? top,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'button_text': buttonText,
      'link_sub_category': linkSubCategory,
      'order_image': orderImage,
      'left': left,
      'top': top,
    }.withoutNulls,
  );

  return firestoreData;
}

class HomeImagesRecordDocumentEquality implements Equality<HomeImagesRecord> {
  const HomeImagesRecordDocumentEquality();

  @override
  bool equals(HomeImagesRecord? e1, HomeImagesRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.buttonText == e2?.buttonText &&
        e1?.linkSubCategory == e2?.linkSubCategory &&
        e1?.orderImage == e2?.orderImage &&
        e1?.left == e2?.left &&
        e1?.top == e2?.top;
  }

  @override
  int hash(HomeImagesRecord? e) => const ListEquality().hash([
        e?.image,
        e?.buttonText,
        e?.linkSubCategory,
        e?.orderImage,
        e?.left,
        e?.top
      ]);

  @override
  bool isValidKey(Object? o) => o is HomeImagesRecord;
}
