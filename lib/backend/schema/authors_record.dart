import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthorsRecord extends FirestoreRecord {
  AuthorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _bio = snapshotData['bio'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('authors');

  static Stream<AuthorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuthorsRecord.fromSnapshot(s));

  static Future<AuthorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuthorsRecord.fromSnapshot(s));

  static AuthorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuthorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuthorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuthorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuthorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuthorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAuthorsRecordData({
  String? bio,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bio': bio,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class AuthorsRecordDocumentEquality implements Equality<AuthorsRecord> {
  const AuthorsRecordDocumentEquality();

  @override
  bool equals(AuthorsRecord? e1, AuthorsRecord? e2) {
    return e1?.bio == e2?.bio && e1?.name == e2?.name;
  }

  @override
  int hash(AuthorsRecord? e) => const ListEquality().hash([e?.bio, e?.name]);

  @override
  bool isValidKey(Object? o) => o is AuthorsRecord;
}
