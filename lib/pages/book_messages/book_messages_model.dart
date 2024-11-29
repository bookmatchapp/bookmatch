import '/components/favorite_button/favorite_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_messages_widget.dart' show BookMessagesWidget;
import 'package:flutter/material.dart';

class BookMessagesModel extends FlutterFlowModel<BookMessagesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for favoriteButton dynamic component.
  late FlutterFlowDynamicModels<FavoriteButtonModel> favoriteButtonModels;

  @override
  void initState(BuildContext context) {
    favoriteButtonModels =
        FlutterFlowDynamicModels(() => FavoriteButtonModel());
  }

  @override
  void dispose() {
    favoriteButtonModels.dispose();
  }
}
