import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'library_list_widget.dart' show LibraryListWidget;
import 'package:flutter/material.dart';

class LibraryListModel extends FlutterFlowModel<LibraryListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  List<LibrariesRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
