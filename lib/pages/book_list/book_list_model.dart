import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_list_widget.dart' show BookListWidget;
import 'package:flutter/material.dart';

class BookListModel extends FlutterFlowModel<BookListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  List<BooksRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
