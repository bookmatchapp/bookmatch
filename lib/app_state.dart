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

  List<DocumentReference> _filteredBooks = [];
  List<DocumentReference> get filteredBooks => _filteredBooks;
  set filteredBooks(List<DocumentReference> value) {
    _filteredBooks = value;
  }

  void addToFilteredBooks(DocumentReference value) {
    filteredBooks.add(value);
  }

  void removeFromFilteredBooks(DocumentReference value) {
    filteredBooks.remove(value);
  }

  void removeAtIndexFromFilteredBooks(int index) {
    filteredBooks.removeAt(index);
  }

  void updateFilteredBooksAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    filteredBooks[index] = updateFn(_filteredBooks[index]);
  }

  void insertAtIndexInFilteredBooks(int index, DocumentReference value) {
    filteredBooks.insert(index, value);
  }

  List<String> _selectedBookGenres = [];
  List<String> get selectedBookGenres => _selectedBookGenres;
  set selectedBookGenres(List<String> value) {
    _selectedBookGenres = value;
  }

  void addToSelectedBookGenres(String value) {
    selectedBookGenres.add(value);
  }

  void removeFromSelectedBookGenres(String value) {
    selectedBookGenres.remove(value);
  }

  void removeAtIndexFromSelectedBookGenres(int index) {
    selectedBookGenres.removeAt(index);
  }

  void updateSelectedBookGenresAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedBookGenres[index] = updateFn(_selectedBookGenres[index]);
  }

  void insertAtIndexInSelectedBookGenres(int index, String value) {
    selectedBookGenres.insert(index, value);
  }

  bool _is13To17YearsOld = false;
  bool get is13To17YearsOld => _is13To17YearsOld;
  set is13To17YearsOld(bool value) {
    _is13To17YearsOld = value;
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
