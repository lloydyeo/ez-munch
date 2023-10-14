import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductOptionsRecord extends FirestoreRecord {
  ProductOptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "option_type" field.
  String? _optionType;
  String get optionType => _optionType ?? '';
  bool hasOptionType() => _optionType != null;

  // "mandatory" field.
  bool? _mandatory;
  bool get mandatory => _mandatory ?? false;
  bool hasMandatory() => _mandatory != null;

  // "max_values" field.
  int? _maxValues;
  int get maxValues => _maxValues ?? 0;
  bool hasMaxValues() => _maxValues != null;

  void _initializeFields() {
    _product = snapshotData['product'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _optionType = snapshotData['option_type'] as String?;
    _mandatory = snapshotData['mandatory'] as bool?;
    _maxValues = castToType<int>(snapshotData['max_values']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product_options');

  static Stream<ProductOptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductOptionsRecord.fromSnapshot(s));

  static Future<ProductOptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductOptionsRecord.fromSnapshot(s));

  static ProductOptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductOptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductOptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductOptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductOptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductOptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductOptionsRecordData({
  DocumentReference? product,
  String? name,
  String? optionType,
  bool? mandatory,
  int? maxValues,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product': product,
      'name': name,
      'option_type': optionType,
      'mandatory': mandatory,
      'max_values': maxValues,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductOptionsRecordDocumentEquality
    implements Equality<ProductOptionsRecord> {
  const ProductOptionsRecordDocumentEquality();

  @override
  bool equals(ProductOptionsRecord? e1, ProductOptionsRecord? e2) {
    return e1?.product == e2?.product &&
        e1?.name == e2?.name &&
        e1?.optionType == e2?.optionType &&
        e1?.mandatory == e2?.mandatory &&
        e1?.maxValues == e2?.maxValues;
  }

  @override
  int hash(ProductOptionsRecord? e) => const ListEquality()
      .hash([e?.product, e?.name, e?.optionType, e?.mandatory, e?.maxValues]);

  @override
  bool isValidKey(Object? o) => o is ProductOptionsRecord;
}
