import '/backend/backend.dart';
import '/components/favorite_button/favorite_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favorites_widget.dart' show FavoritesWidget;
import 'package:flutter/material.dart';

class FavoritesModel extends FlutterFlowModel<FavoritesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  List<BooksRecord> simpleSearchResults = [];
  // Models for favoriteButton dynamic component.
  late FlutterFlowDynamicModels<FavoriteButtonModel> favoriteButtonModels1;
  // Models for favoriteButton dynamic component.
  late FlutterFlowDynamicModels<FavoriteButtonModel> favoriteButtonModels2;
  // Models for favoriteButton dynamic component.
  late FlutterFlowDynamicModels<FavoriteButtonModel> favoriteButtonModels3;
  // Models for favoriteButton dynamic component.
  late FlutterFlowDynamicModels<FavoriteButtonModel> favoriteButtonModels4;

  @override
  void initState(BuildContext context) {
    favoriteButtonModels1 =
        FlutterFlowDynamicModels(() => FavoriteButtonModel());
    favoriteButtonModels2 =
        FlutterFlowDynamicModels(() => FavoriteButtonModel());
    favoriteButtonModels3 =
        FlutterFlowDynamicModels(() => FavoriteButtonModel());
    favoriteButtonModels4 =
        FlutterFlowDynamicModels(() => FavoriteButtonModel());
  }

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    favoriteButtonModels1.dispose();
    favoriteButtonModels2.dispose();
    favoriteButtonModels3.dispose();
    favoriteButtonModels4.dispose();
  }
}
