import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartsRecord extends FirestoreRecord {
  CartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "order_ref_no" field.
  String? _orderRefNo;
  String get orderRefNo => _orderRefNo ?? '';
  bool hasOrderRefNo() => _orderRefNo != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  // "paynow_qrcode_url" field.
  String? _paynowQrcodeUrl;
  String get paynowQrcodeUrl => _paynowQrcodeUrl ?? '';
  bool hasPaynowQrcodeUrl() => _paynowQrcodeUrl != null;

  // "require_cutlery" field.
  bool? _requireCutlery;
  bool get requireCutlery => _requireCutlery ?? false;
  bool hasRequireCutlery() => _requireCutlery != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "priority_order" field.
  bool? _priorityOrder;
  bool get priorityOrder => _priorityOrder ?? false;
  bool hasPriorityOrder() => _priorityOrder != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "fazz_order_id" field.
  String? _fazzOrderId;
  String get fazzOrderId => _fazzOrderId ?? '';
  bool hasFazzOrderId() => _fazzOrderId != null;

  // "items" field.
  List<DocumentReference>? _items;
  List<DocumentReference> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "vendors" field.
  List<DocumentReference>? _vendors;
  List<DocumentReference> get vendors => _vendors ?? const [];
  bool hasVendors() => _vendors != null;

  // "street_name" field.
  String? _streetName;
  String get streetName => _streetName ?? '';
  bool hasStreetName() => _streetName != null;

  // "floor" field.
  String? _floor;
  String get floor => _floor ?? '';
  bool hasFloor() => _floor != null;

  // "unit_no" field.
  String? _unitNo;
  String get unitNo => _unitNo ?? '';
  bool hasUnitNo() => _unitNo != null;

  // "postal_code" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  bool hasPostalCode() => _postalCode != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _userEmail = snapshotData['user_email'] as String?;
    _orderRefNo = snapshotData['order_ref_no'] as String?;
    _uuid = snapshotData['uuid'] as String?;
    _paynowQrcodeUrl = snapshotData['paynow_qrcode_url'] as String?;
    _requireCutlery = snapshotData['require_cutlery'] as bool?;
    _status = snapshotData['status'] as String?;
    _priorityOrder = snapshotData['priority_order'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _fazzOrderId = snapshotData['fazz_order_id'] as String?;
    _items = getDataList(snapshotData['items']);
    _vendors = getDataList(snapshotData['vendors']);
    _streetName = snapshotData['street_name'] as String?;
    _floor = snapshotData['floor'] as String?;
    _unitNo = snapshotData['unit_no'] as String?;
    _postalCode = snapshotData['postal_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carts');

  static Stream<CartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartsRecord.fromSnapshot(s));

  static Future<CartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartsRecord.fromSnapshot(s));

  static CartsRecord fromSnapshot(DocumentSnapshot snapshot) => CartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartsRecordData({
  DocumentReference? user,
  String? userEmail,
  String? orderRefNo,
  String? uuid,
  String? paynowQrcodeUrl,
  bool? requireCutlery,
  String? status,
  bool? priorityOrder,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? fazzOrderId,
  String? streetName,
  String? floor,
  String? unitNo,
  String? postalCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'user_email': userEmail,
      'order_ref_no': orderRefNo,
      'uuid': uuid,
      'paynow_qrcode_url': paynowQrcodeUrl,
      'require_cutlery': requireCutlery,
      'status': status,
      'priority_order': priorityOrder,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'fazz_order_id': fazzOrderId,
      'street_name': streetName,
      'floor': floor,
      'unit_no': unitNo,
      'postal_code': postalCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartsRecordDocumentEquality implements Equality<CartsRecord> {
  const CartsRecordDocumentEquality();

  @override
  bool equals(CartsRecord? e1, CartsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.userEmail == e2?.userEmail &&
        e1?.orderRefNo == e2?.orderRefNo &&
        e1?.uuid == e2?.uuid &&
        e1?.paynowQrcodeUrl == e2?.paynowQrcodeUrl &&
        e1?.requireCutlery == e2?.requireCutlery &&
        e1?.status == e2?.status &&
        e1?.priorityOrder == e2?.priorityOrder &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.fazzOrderId == e2?.fazzOrderId &&
        listEquality.equals(e1?.items, e2?.items) &&
        listEquality.equals(e1?.vendors, e2?.vendors) &&
        e1?.streetName == e2?.streetName &&
        e1?.floor == e2?.floor &&
        e1?.unitNo == e2?.unitNo &&
        e1?.postalCode == e2?.postalCode;
  }

  @override
  int hash(CartsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.userEmail,
        e?.orderRefNo,
        e?.uuid,
        e?.paynowQrcodeUrl,
        e?.requireCutlery,
        e?.status,
        e?.priorityOrder,
        e?.createdAt,
        e?.updatedAt,
        e?.fazzOrderId,
        e?.items,
        e?.vendors,
        e?.streetName,
        e?.floor,
        e?.unitNo,
        e?.postalCode
      ]);

  @override
  bool isValidKey(Object? o) => o is CartsRecord;
}
