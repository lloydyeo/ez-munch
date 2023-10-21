import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigsRecord extends FirestoreRecord {
  ConfigsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "third_party_availability" field.
  bool? _thirdPartyAvailability;
  bool get thirdPartyAvailability => _thirdPartyAvailability ?? false;
  bool hasThirdPartyAvailability() => _thirdPartyAvailability != null;

  void _initializeFields() {
    _thirdPartyAvailability = snapshotData['third_party_availability'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('configs');

  static Stream<ConfigsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigsRecord.fromSnapshot(s));

  static Future<ConfigsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigsRecord.fromSnapshot(s));

  static ConfigsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfigsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigsRecordData({
  bool? thirdPartyAvailability,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'third_party_availability': thirdPartyAvailability,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigsRecordDocumentEquality implements Equality<ConfigsRecord> {
  const ConfigsRecordDocumentEquality();

  @override
  bool equals(ConfigsRecord? e1, ConfigsRecord? e2) {
    return e1?.thirdPartyAvailability == e2?.thirdPartyAvailability;
  }

  @override
  int hash(ConfigsRecord? e) =>
      const ListEquality().hash([e?.thirdPartyAvailability]);

  @override
  bool isValidKey(Object? o) => o is ConfigsRecord;
}
