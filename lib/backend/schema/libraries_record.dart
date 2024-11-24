import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "borrowing_policy" field.
  String? _borrowingPolicy;
  String get borrowingPolicy => _borrowingPolicy ?? '';
  bool hasBorrowingPolicy() => _borrowingPolicy != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "code" field.
  Libraries? _code;
  Libraries? get code => _code;
  bool hasCode() => _code != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _coverPhoto = snapshotData['cover_photo'] as String?;
    _description = snapshotData['description'] as String?;
    _borrowingPolicy = snapshotData['borrowing_policy'] as String?;
    _location = snapshotData['location'] as String?;
    _code = deserializeEnum<Libraries>(snapshotData['code']);
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
  String? borrowingPolicy,
  String? location,
  Libraries? code,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'cover_photo': coverPhoto,
      'description': description,
      'borrowing_policy': borrowingPolicy,
      'location': location,
      'code': code,
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
        e1?.description == e2?.description &&
        e1?.borrowingPolicy == e2?.borrowingPolicy &&
        e1?.location == e2?.location &&
        e1?.code == e2?.code;
  }

  @override
  int hash(LibrariesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.coverPhoto,
        e?.description,
        e?.borrowingPolicy,
        e?.location,
        e?.code
      ]);

  @override
  bool isValidKey(Object? o) => o is LibrariesRecord;
}
