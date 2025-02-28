import '/components/logox/logox_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth_forgot_password_widget.dart' show AuthForgotPasswordWidget;
import 'package:flutter/material.dart';

class AuthForgotPasswordModel
    extends FlutterFlowModel<AuthForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for logox component.
  late LogoxModel logoxModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {
    logoxModel = createModel(context, () => LogoxModel());
  }

  @override
  void dispose() {
    logoxModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
