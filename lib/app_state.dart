import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
      _favoriteBooks =
          prefs.getStringList('ff_favoriteBooks') ?? _favoriteBooks;
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
    prefs.setStringList('ff_favoriteBooks', value);
  }

  void addToFavoriteBooks(String value) {
    favoriteBooks.add(value);
    prefs.setStringList('ff_favoriteBooks', _favoriteBooks);
  }

  void removeFromFavoriteBooks(String value) {
    favoriteBooks.remove(value);
    prefs.setStringList('ff_favoriteBooks', _favoriteBooks);
  }

  void removeAtIndexFromFavoriteBooks(int index) {
    favoriteBooks.removeAt(index);
    prefs.setStringList('ff_favoriteBooks', _favoriteBooks);
  }

  void updateFavoriteBooksAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favoriteBooks[index] = updateFn(_favoriteBooks[index]);
    prefs.setStringList('ff_favoriteBooks', _favoriteBooks);
  }

  void insertAtIndexInFavoriteBooks(int index, String value) {
    favoriteBooks.insert(index, value);
    prefs.setStringList('ff_favoriteBooks', _favoriteBooks);
  }

  DocumentReference? _createdBook;
  DocumentReference? get createdBook => _createdBook;
  set createdBook(DocumentReference? value) {
    _createdBook = value;
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
