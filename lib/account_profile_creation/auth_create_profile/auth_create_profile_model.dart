import '/components/edit_profile_auth/edit_profile_auth_widget.dart';
import '/components/logox/logox_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth_create_profile_widget.dart' show AuthCreateProfileWidget;
import 'package:flutter/material.dart';

class AuthCreateProfileModel extends FlutterFlowModel<AuthCreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for logox component.
  late LogoxModel logoxModel;
  // Model for editProfileAuth component.
  late EditProfileAuthModel editProfileAuthModel;

  @override
  void initState(BuildContext context) {
    logoxModel = createModel(context, () => LogoxModel());
    editProfileAuthModel = createModel(context, () => EditProfileAuthModel());
  }

  @override
  void dispose() {
    logoxModel.dispose();
    editProfileAuthModel.dispose();
  }
}
