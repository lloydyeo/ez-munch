import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'phone_verification_page_widget.dart' show PhoneVerificationPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneVerificationPageModel
    extends FlutterFlowModel<PhoneVerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PhoneNoText widget.
  TextEditingController? phoneNoTextController;
  String? Function(BuildContext, String?)? phoneNoTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in OTPBtn widget.
  UsersRecord? updatedUser;
  // Stores action output result for [Backend Call - API (Send Verification OTP SMS)] action in OTPBtn widget.
  ApiCallResponse? result;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    phoneNoTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
