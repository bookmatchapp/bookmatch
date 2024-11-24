import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BooksRecord extends FirestoreRecord {
  BooksRecord._(
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

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "library" field.
  DocumentReference? _library;
  DocumentReference? get library => _library;
  bool hasLibrary() => _library != null;

  // "libraryName" field.
  String? _libraryName;
  String get libraryName => _libraryName ?? '';
  bool hasLibraryName() => _libraryName != null;

  // "isbn" field.
  String? _isbn;
  String get isbn => _isbn ?? '';
  bool hasIsbn() => _isbn != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "libCode" field.
  Libraries? _libCode;
  Libraries? get libCode => _libCode;
  bool hasLibCode() => _libCode != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _coverPhoto = snapshotData['cover_photo'] as String?;
    _description = snapshotData['description'] as String?;
    _genre = snapshotData['genre'] as String?;
    _author = snapshotData['author'] as String?;
    _library = snapshotData['library'] as DocumentReference?;
    _libraryName = snapshotData['libraryName'] as String?;
    _isbn = snapshotData['isbn'] as String?;
    _uid = snapshotData['uid'] as String?;
    _libCode = deserializeEnum<Libraries>(snapshotData['libCode']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('books');

  static Stream<BooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BooksRecord.fromSnapshot(s));

  static Future<BooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BooksRecord.fromSnapshot(s));

  static BooksRecord fromSnapshot(DocumentSnapshot snapshot) => BooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBooksRecordData({
  String? title,
  String? coverPhoto,
  String? description,
  String? genre,
  String? author,
  DocumentReference? library,
  String? libraryName,
  String? isbn,
  String? uid,
  Libraries? libCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'cover_photo': coverPhoto,
      'description': description,
      'genre': genre,
      'author': author,
      'library': library,
      'libraryName': libraryName,
      'isbn': isbn,
      'uid': uid,
      'libCode': libCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class BooksRecordDocumentEquality implements Equality<BooksRecord> {
  const BooksRecordDocumentEquality();

  @override
  bool equals(BooksRecord? e1, BooksRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.coverPhoto == e2?.coverPhoto &&
        e1?.description == e2?.description &&
        e1?.genre == e2?.genre &&
        e1?.author == e2?.author &&
        e1?.library == e2?.library &&
        e1?.libraryName == e2?.libraryName &&
        e1?.isbn == e2?.isbn &&
        e1?.uid == e2?.uid &&
        e1?.libCode == e2?.libCode;
  }

  @override
  int hash(BooksRecord? e) => const ListEquality().hash([
        e?.title,
        e?.coverPhoto,
        e?.description,
        e?.genre,
        e?.author,
        e?.library,
        e?.libraryName,
        e?.isbn,
        e?.uid,
        e?.libCode
      ]);

  @override
  bool isValidKey(Object? o) => o is BooksRecord;
}
