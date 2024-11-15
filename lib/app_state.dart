import 'package:flutter/material.dart';
import '/backend/backend.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _books = [];
  List<DocumentReference> get books => _books;
  set books(List<DocumentReference> value) {
    _books = value;
  }

  void addToBooks(DocumentReference value) {
    books.add(value);
  }

  void removeFromBooks(DocumentReference value) {
    books.remove(value);
  }

  void removeAtIndexFromBooks(int index) {
    books.removeAt(index);
  }

  void updateBooksAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    books[index] = updateFn(_books[index]);
  }

  void insertAtIndexInBooks(int index, DocumentReference value) {
    books.insert(index, value);
  }

  bool _searchMode = false;
  bool get searchMode => _searchMode;
  set searchMode(bool value) {
    _searchMode = value;
  }
}
