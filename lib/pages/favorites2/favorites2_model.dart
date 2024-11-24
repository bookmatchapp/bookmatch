import '/flutter_flow/flutter_flow_util.dart';
import 'favorites2_widget.dart' show Favorites2Widget;
import 'package:flutter/material.dart';

class Favorites2Model extends FlutterFlowModel<Favorites2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
