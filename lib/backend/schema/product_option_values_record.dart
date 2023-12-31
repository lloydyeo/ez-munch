import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductOptionValuesRecord extends FirestoreRecord {
  ProductOptionValuesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  // "productOption" field.
  DocumentReference? _productOption;
  DocumentReference? get productOption => _productOption;
  bool hasProductOption() => _productOption != null;

  // "addOnPrice" field.
  double? _addOnPrice;
  double get addOnPrice => _addOnPrice ?? 0.0;
  bool hasAddOnPrice() => _addOnPrice != null;

  void _initializeFields() {
    _value = snapshotData['value'] as String?;
    _productOption = snapshotData['productOption'] as DocumentReference?;
    _addOnPrice = castToType<double>(snapshotData['addOnPrice']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product_option_values');

  static Stream<ProductOptionValuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductOptionValuesRecord.fromSnapshot(s));

  static Future<ProductOptionValuesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProductOptionValuesRecord.fromSnapshot(s));

  static ProductOptionValuesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductOptionValuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductOptionValuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductOptionValuesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductOptionValuesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductOptionValuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductOptionValuesRecordData({
  String? value,
  DocumentReference? productOption,
  double? addOnPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'productOption': productOption,
      'addOnPrice': addOnPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductOptionValuesRecordDocumentEquality
    implements Equality<ProductOptionValuesRecord> {
  const ProductOptionValuesRecordDocumentEquality();

  @override
  bool equals(ProductOptionValuesRecord? e1, ProductOptionValuesRecord? e2) {
    return e1?.value == e2?.value &&
        e1?.productOption == e2?.productOption &&
        e1?.addOnPrice == e2?.addOnPrice;
  }

  @override
  int hash(ProductOptionValuesRecord? e) =>
      const ListEquality().hash([e?.value, e?.productOption, e?.addOnPrice]);

  @override
  bool isValidKey(Object? o) => o is ProductOptionValuesRecord;
}
