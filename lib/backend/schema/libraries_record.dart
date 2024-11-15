import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LibrariesRecord extends FirestoreRecord {
  LibrariesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "cover_photo" field.
  String? _coverPhoto;
  String get coverPhoto => _coverPhoto ?? '';
  bool hasCoverPhoto() => _coverPhoto != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _coverPhoto = snapshotData['cover_photo'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('libraries');

  static Stream<LibrariesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LibrariesRecord.fromSnapshot(s));

  static Future<LibrariesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LibrariesRecord.fromSnapshot(s));

  static LibrariesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LibrariesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LibrariesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LibrariesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LibrariesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LibrariesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLibrariesRecordData({
  String? title,
  String? coverPhoto,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'cover_photo': coverPhoto,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class LibrariesRecordDocumentEquality implements Equality<LibrariesRecord> {
  const LibrariesRecordDocumentEquality();

  @override
  bool equals(LibrariesRecord? e1, LibrariesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.coverPhoto == e2?.coverPhoto &&
        e1?.description == e2?.description;
  }

  @override
  int hash(LibrariesRecord? e) =>
      const ListEquality().hash([e?.title, e?.coverPhoto, e?.description]);

  @override
  bool isValidKey(Object? o) => o is LibrariesRecord;
}
