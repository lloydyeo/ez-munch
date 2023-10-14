import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApiLogsRecord extends FirestoreRecord {
  ApiLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _response = snapshotData['response'] as String?;
    _name = snapshotData['name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('api_logs');

  static Stream<ApiLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApiLogsRecord.fromSnapshot(s));

  static Future<ApiLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApiLogsRecord.fromSnapshot(s));

  static ApiLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApiLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApiLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApiLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApiLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApiLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApiLogsRecordData({
  String? response,
  String? name,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'response': response,
      'name': name,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApiLogsRecordDocumentEquality implements Equality<ApiLogsRecord> {
  const ApiLogsRecordDocumentEquality();

  @override
  bool equals(ApiLogsRecord? e1, ApiLogsRecord? e2) {
    return e1?.response == e2?.response &&
        e1?.name == e2?.name &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ApiLogsRecord? e) =>
      const ListEquality().hash([e?.response, e?.name, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is ApiLogsRecord;
}
