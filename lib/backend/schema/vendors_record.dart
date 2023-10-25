import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendorsRecord extends FirestoreRecord {
  VendorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "cover_image_url" field.
  String? _coverImageUrl;
  String get coverImageUrl => _coverImageUrl ?? '';
  bool hasCoverImageUrl() => _coverImageUrl != null;

  // "mall_vendors" field.
  List<DocumentReference>? _mallVendors;
  List<DocumentReference> get mallVendors => _mallVendors ?? const [];
  bool hasMallVendors() => _mallVendors != null;

  // "is_mall" field.
  bool? _isMall;
  bool get isMall => _isMall ?? false;
  bool hasIsMall() => _isMall != null;

  // "is_third_party" field.
  bool? _isThirdParty;
  bool get isThirdParty => _isThirdParty ?? false;
  bool hasIsThirdParty() => _isThirdParty != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "qr_code_url" field.
  String? _qrCodeUrl;
  String get qrCodeUrl => _qrCodeUrl ?? '';
  bool hasQrCodeUrl() => _qrCodeUrl != null;

  // "operating_from" field.
  String? _operatingFrom;
  String get operatingFrom => _operatingFrom ?? '';
  bool hasOperatingFrom() => _operatingFrom != null;

  // "opreating_to" field.
  String? _opreatingTo;
  String get opreatingTo => _opreatingTo ?? '';
  bool hasOpreatingTo() => _opreatingTo != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "qr_code_url_app_store" field.
  String? _qrCodeUrlAppStore;
  String get qrCodeUrlAppStore => _qrCodeUrlAppStore ?? '';
  bool hasQrCodeUrlAppStore() => _qrCodeUrlAppStore != null;

  void _initializeFields() {
    _userEmail = snapshotData['user_email'] as String?;
    _coverImageUrl = snapshotData['cover_image_url'] as String?;
    _mallVendors = getDataList(snapshotData['mall_vendors']);
    _isMall = snapshotData['is_mall'] as bool?;
    _isThirdParty = snapshotData['is_third_party'] as bool?;
    _address = snapshotData['address'] as String?;
    _name = snapshotData['name'] as String?;
    _qrCodeUrl = snapshotData['qr_code_url'] as String?;
    _operatingFrom = snapshotData['operating_from'] as String?;
    _opreatingTo = snapshotData['opreating_to'] as String?;
    _status = snapshotData['status'] as String?;
    _qrCodeUrlAppStore = snapshotData['qr_code_url_app_store'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vendors');

  static Stream<VendorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VendorsRecord.fromSnapshot(s));

  static Future<VendorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VendorsRecord.fromSnapshot(s));

  static VendorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VendorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VendorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VendorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VendorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VendorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVendorsRecordData({
  String? userEmail,
  String? coverImageUrl,
  bool? isMall,
  bool? isThirdParty,
  String? address,
  String? name,
  String? qrCodeUrl,
  String? operatingFrom,
  String? opreatingTo,
  String? status,
  String? qrCodeUrlAppStore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_email': userEmail,
      'cover_image_url': coverImageUrl,
      'is_mall': isMall,
      'is_third_party': isThirdParty,
      'address': address,
      'name': name,
      'qr_code_url': qrCodeUrl,
      'operating_from': operatingFrom,
      'opreating_to': opreatingTo,
      'status': status,
      'qr_code_url_app_store': qrCodeUrlAppStore,
    }.withoutNulls,
  );

  return firestoreData;
}

class VendorsRecordDocumentEquality implements Equality<VendorsRecord> {
  const VendorsRecordDocumentEquality();

  @override
  bool equals(VendorsRecord? e1, VendorsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userEmail == e2?.userEmail &&
        e1?.coverImageUrl == e2?.coverImageUrl &&
        listEquality.equals(e1?.mallVendors, e2?.mallVendors) &&
        e1?.isMall == e2?.isMall &&
        e1?.isThirdParty == e2?.isThirdParty &&
        e1?.address == e2?.address &&
        e1?.name == e2?.name &&
        e1?.qrCodeUrl == e2?.qrCodeUrl &&
        e1?.operatingFrom == e2?.operatingFrom &&
        e1?.opreatingTo == e2?.opreatingTo &&
        e1?.status == e2?.status &&
        e1?.qrCodeUrlAppStore == e2?.qrCodeUrlAppStore;
  }

  @override
  int hash(VendorsRecord? e) => const ListEquality().hash([
        e?.userEmail,
        e?.coverImageUrl,
        e?.mallVendors,
        e?.isMall,
        e?.isThirdParty,
        e?.address,
        e?.name,
        e?.qrCodeUrl,
        e?.operatingFrom,
        e?.opreatingTo,
        e?.status,
        e?.qrCodeUrlAppStore
      ]);

  @override
  bool isValidKey(Object? o) => o is VendorsRecord;
}
