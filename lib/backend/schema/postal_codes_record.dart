import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostalCodesRecord extends FirestoreRecord {
  PostalCodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postal_code" field.
  int? _postalCode;
  int get postalCode => _postalCode ?? 0;
  bool hasPostalCode() => _postalCode != null;

  void _initializeFields() {
    _postalCode = castToType<int>(snapshotData['postal_code']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('postal_codes');

  static Stream<PostalCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostalCodesRecord.fromSnapshot(s));

  static Future<PostalCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostalCodesRecord.fromSnapshot(s));

  static PostalCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostalCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostalCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostalCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostalCodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostalCodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostalCodesRecordData({
  int? postalCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postal_code': postalCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostalCodesRecordDocumentEquality implements Equality<PostalCodesRecord> {
  const PostalCodesRecordDocumentEquality();

  @override
  bool equals(PostalCodesRecord? e1, PostalCodesRecord? e2) {
    return e1?.postalCode == e2?.postalCode;
  }

  @override
  int hash(PostalCodesRecord? e) => const ListEquality().hash([e?.postalCode]);

  @override
  bool isValidKey(Object? o) => o is PostalCodesRecord;
}
