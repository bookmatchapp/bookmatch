import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_auth_widget.dart' show EditProfileAuthWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileAuthModel extends FlutterFlowModel<EditProfileAuthWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  String? _yourNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for birthDate widget.
  FocusNode? birthDateFocusNode;
  TextEditingController? birthDateTextController;
  String? Function(BuildContext, String?)? birthDateTextControllerValidator;
  String? _birthDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button-Login widget.
  bool? validForm;

  @override
  void initState(BuildContext context) {
    yourNameTextControllerValidator = _yourNameTextControllerValidator;
    birthDateTextControllerValidator = _birthDateTextControllerValidator;
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    birthDateFocusNode?.dispose();
    birthDateTextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();
  }
}
