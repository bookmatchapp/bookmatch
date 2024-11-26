import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _libraries = prefs
              .getStringList('ff_libraries')
              ?.map((path) => path.ref)
              .toList() ??
          _libraries;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _searchMode = false;
  bool get searchMode => _searchMode;
  set searchMode(bool value) {
    _searchMode = value;
  }

  List<String> _favoriteBooks = ['default'];
  List<String> get favoriteBooks => _favoriteBooks;
  set favoriteBooks(List<String> value) {
    _favoriteBooks = value;
  }

  void addToFavoriteBooks(String value) {
    favoriteBooks.add(value);
  }

  void removeFromFavoriteBooks(String value) {
    favoriteBooks.remove(value);
  }

  void removeAtIndexFromFavoriteBooks(int index) {
    favoriteBooks.removeAt(index);
  }

  void updateFavoriteBooksAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favoriteBooks[index] = updateFn(_favoriteBooks[index]);
  }

  void insertAtIndexInFavoriteBooks(int index, String value) {
    favoriteBooks.insert(index, value);
  }

  DocumentReference? _createdBook;
  DocumentReference? get createdBook => _createdBook;
  set createdBook(DocumentReference? value) {
    _createdBook = value;
  }

  List<DocumentReference> _libraries = [];
  List<DocumentReference> get libraries => _libraries;
  set libraries(List<DocumentReference> value) {
    _libraries = value;
    prefs.setStringList('ff_libraries', value.map((x) => x.path).toList());
  }

  void addToLibraries(DocumentReference value) {
    libraries.add(value);
    prefs.setStringList('ff_libraries', _libraries.map((x) => x.path).toList());
  }

  void removeFromLibraries(DocumentReference value) {
    libraries.remove(value);
    prefs.setStringList('ff_libraries', _libraries.map((x) => x.path).toList());
  }

  void removeAtIndexFromLibraries(int index) {
    libraries.removeAt(index);
    prefs.setStringList('ff_libraries', _libraries.map((x) => x.path).toList());
  }

  void updateLibrariesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    libraries[index] = updateFn(_libraries[index]);
    prefs.setStringList('ff_libraries', _libraries.map((x) => x.path).toList());
  }

  void insertAtIndexInLibraries(int index, DocumentReference value) {
    libraries.insert(index, value);
    prefs.setStringList('ff_libraries', _libraries.map((x) => x.path).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
