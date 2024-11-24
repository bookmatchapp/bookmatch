// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FavBookStruct extends FFFirebaseStruct {
  FavBookStruct({
    String? id,
    bool? favorite,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _favorite = favorite,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "favorite" field.
  bool? _favorite;
  bool get favorite => _favorite ?? false;
  set favorite(bool? val) => _favorite = val;

  bool hasFavorite() => _favorite != null;

  static FavBookStruct fromMap(Map<String, dynamic> data) => FavBookStruct(
        id: data['id'] as String?,
        favorite: data['favorite'] as bool?,
      );

  static FavBookStruct? maybeFromMap(dynamic data) =>
      data is Map ? FavBookStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'favorite': _favorite,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'favorite': serializeParam(
          _favorite,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FavBookStruct fromSerializableMap(Map<String, dynamic> data) =>
      FavBookStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        favorite: deserializeParam(
          data['favorite'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FavBookStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FavBookStruct &&
        id == other.id &&
        favorite == other.favorite;
  }

  @override
  int get hashCode => const ListEquality().hash([id, favorite]);
}

FavBookStruct createFavBookStruct({
  String? id,
  bool? favorite,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FavBookStruct(
      id: id,
      favorite: favorite,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FavBookStruct? updateFavBookStruct(
  FavBookStruct? favBook, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    favBook
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFavBookStructData(
  Map<String, dynamic> firestoreData,
  FavBookStruct? favBook,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (favBook == null) {
    return;
  }
  if (favBook.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && favBook.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final favBookData = getFavBookFirestoreData(favBook, forFieldValue);
  final nestedData = favBookData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = favBook.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFavBookFirestoreData(
  FavBookStruct? favBook, [
  bool forFieldValue = false,
]) {
  if (favBook == null) {
    return {};
  }
  final firestoreData = mapToFirestore(favBook.toMap());

  // Add any Firestore field values
  favBook.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFavBookListFirestoreData(
  List<FavBookStruct>? favBooks,
) =>
    favBooks?.map((e) => getFavBookFirestoreData(e, true)).toList() ?? [];
