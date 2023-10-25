import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemsRecord extends FirestoreRecord {
  CartItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cart" field.
  DocumentReference? _cart;
  DocumentReference? get cart => _cart;
  bool hasCart() => _cart != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "product_option_values" field.
  List<DocumentReference>? _productOptionValues;
  List<DocumentReference> get productOptionValues =>
      _productOptionValues ?? const [];
  bool hasProductOptionValues() => _productOptionValues != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "cart_uuid" field.
  String? _cartUuid;
  String get cartUuid => _cartUuid ?? '';
  bool hasCartUuid() => _cartUuid != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "is_third_party_pickup" field.
  bool? _isThirdPartyPickup;
  bool get isThirdPartyPickup => _isThirdPartyPickup ?? false;
  bool hasIsThirdPartyPickup() => _isThirdPartyPickup != null;

  // "pickup_name" field.
  String? _pickupName;
  String get pickupName => _pickupName ?? '';
  bool hasPickupName() => _pickupName != null;

  // "pickup_reference_no" field.
  String? _pickupReferenceNo;
  String get pickupReferenceNo => _pickupReferenceNo ?? '';
  bool hasPickupReferenceNo() => _pickupReferenceNo != null;

  // "pickup_screenshot" field.
  String? _pickupScreenshot;
  String get pickupScreenshot => _pickupScreenshot ?? '';
  bool hasPickupScreenshot() => _pickupScreenshot != null;

  // "pickup_lead_time" field.
  int? _pickupLeadTime;
  int get pickupLeadTime => _pickupLeadTime ?? 0;
  bool hasPickupLeadTime() => _pickupLeadTime != null;

  // "pickup_vendor" field.
  String? _pickupVendor;
  String get pickupVendor => _pickupVendor ?? '';
  bool hasPickupVendor() => _pickupVendor != null;

  // "pickup_vendor_name" field.
  String? _pickupVendorName;
  String get pickupVendorName => _pickupVendorName ?? '';
  bool hasPickupVendorName() => _pickupVendorName != null;

  // "vendor" field.
  DocumentReference? _vendor;
  DocumentReference? get vendor => _vendor;
  bool hasVendor() => _vendor != null;

  // "product_image" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "option_values_formatted" field.
  String? _optionValuesFormatted;
  String get optionValuesFormatted => _optionValuesFormatted ?? '';
  bool hasOptionValuesFormatted() => _optionValuesFormatted != null;

  void _initializeFields() {
    _cart = snapshotData['cart'] as DocumentReference?;
    _product = snapshotData['product'] as DocumentReference?;
    _productOptionValues = getDataList(snapshotData['product_option_values']);
    _name = snapshotData['name'] as String?;
    _cartUuid = snapshotData['cart_uuid'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _isThirdPartyPickup = snapshotData['is_third_party_pickup'] as bool?;
    _pickupName = snapshotData['pickup_name'] as String?;
    _pickupReferenceNo = snapshotData['pickup_reference_no'] as String?;
    _pickupScreenshot = snapshotData['pickup_screenshot'] as String?;
    _pickupLeadTime = castToType<int>(snapshotData['pickup_lead_time']);
    _pickupVendor = snapshotData['pickup_vendor'] as String?;
    _pickupVendorName = snapshotData['pickup_vendor_name'] as String?;
    _vendor = snapshotData['vendor'] as DocumentReference?;
    _productImage = snapshotData['product_image'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _optionValuesFormatted = snapshotData['option_values_formatted'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart_items');

  static Stream<CartItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartItemsRecord.fromSnapshot(s));

  static Future<CartItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartItemsRecord.fromSnapshot(s));

  static CartItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CartItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartItemsRecordData({
  DocumentReference? cart,
  DocumentReference? product,
  String? name,
  String? cartUuid,
  double? price,
  bool? isThirdPartyPickup,
  String? pickupName,
  String? pickupReferenceNo,
  String? pickupScreenshot,
  int? pickupLeadTime,
  String? pickupVendor,
  String? pickupVendorName,
  DocumentReference? vendor,
  String? productImage,
  int? quantity,
  String? optionValuesFormatted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cart': cart,
      'product': product,
      'name': name,
      'cart_uuid': cartUuid,
      'price': price,
      'is_third_party_pickup': isThirdPartyPickup,
      'pickup_name': pickupName,
      'pickup_reference_no': pickupReferenceNo,
      'pickup_screenshot': pickupScreenshot,
      'pickup_lead_time': pickupLeadTime,
      'pickup_vendor': pickupVendor,
      'pickup_vendor_name': pickupVendorName,
      'vendor': vendor,
      'product_image': productImage,
      'quantity': quantity,
      'option_values_formatted': optionValuesFormatted,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartItemsRecordDocumentEquality implements Equality<CartItemsRecord> {
  const CartItemsRecordDocumentEquality();

  @override
  bool equals(CartItemsRecord? e1, CartItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cart == e2?.cart &&
        e1?.product == e2?.product &&
        listEquality.equals(e1?.productOptionValues, e2?.productOptionValues) &&
        e1?.name == e2?.name &&
        e1?.cartUuid == e2?.cartUuid &&
        e1?.price == e2?.price &&
        e1?.isThirdPartyPickup == e2?.isThirdPartyPickup &&
        e1?.pickupName == e2?.pickupName &&
        e1?.pickupReferenceNo == e2?.pickupReferenceNo &&
        e1?.pickupScreenshot == e2?.pickupScreenshot &&
        e1?.pickupLeadTime == e2?.pickupLeadTime &&
        e1?.pickupVendor == e2?.pickupVendor &&
        e1?.pickupVendorName == e2?.pickupVendorName &&
        e1?.vendor == e2?.vendor &&
        e1?.productImage == e2?.productImage &&
        e1?.quantity == e2?.quantity &&
        e1?.optionValuesFormatted == e2?.optionValuesFormatted;
  }

  @override
  int hash(CartItemsRecord? e) => const ListEquality().hash([
        e?.cart,
        e?.product,
        e?.productOptionValues,
        e?.name,
        e?.cartUuid,
        e?.price,
        e?.isThirdPartyPickup,
        e?.pickupName,
        e?.pickupReferenceNo,
        e?.pickupScreenshot,
        e?.pickupLeadTime,
        e?.pickupVendor,
        e?.pickupVendorName,
        e?.vendor,
        e?.productImage,
        e?.quantity,
        e?.optionValuesFormatted
      ]);

  @override
  bool isValidKey(Object? o) => o is CartItemsRecord;
}
