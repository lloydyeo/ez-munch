import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_email_page_widget.dart' show LoginEmailPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginEmailPageModel extends FlutterFlowModel<LoginEmailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailField widget.
  TextEditingController? emailFieldController1;
  String? Function(BuildContext, String?)? emailFieldController1Validator;
  // State field(s) for EmailField widget.
  TextEditingController? emailFieldController2;
  late bool emailFieldVisibility;
  String? Function(BuildContext, String?)? emailFieldController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailFieldVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailFieldController1?.dispose();
    emailFieldController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
