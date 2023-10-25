import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/postal_code_retrieval_dialog_widget.dart';
import '/components/preparing_payment_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'checkout_page_widget.dart' show CheckoutPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutPageModel extends FlutterFlowModel<CheckoutPageWidget> {
  ///  Local state fields for this page.

  String? address = '';

  bool hasUnavailableProducts = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in CheckoutPage widget.
  PostalCodesRecord? postalCodes;
  // State field(s) for PostalCodeRetrievalDialog widget.
  String? postalCodeRetrievalDialogValue;
  FormFieldController<String>? postalCodeRetrievalDialogValueController;
  // Stores action output result for [Backend Call - API (getPostalCode)] action in PostalCodeRetrievalDialog widget.
  ApiCallResponse? postalCodeResponse;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  ProductsRecord? basketItemProductsRecordPreviousSnapshot;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  CartsRecord? cartForDeletedItem;
  // State field(s) for CutleryRequiredSwitch widget.
  bool? cutleryRequiredSwitchValue;
  // Stores action output result for [Backend Call - API (getOrderReferenceNumber)] action in Button widget.
  ApiCallResponse? apiOrderRefNo;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CartsRecord? updatedCart;
  // Stores action output result for [Backend Call - API (generateQRCode)] action in Button widget.
  ApiCallResponse? qrCodeApiResponse;
  // Stores action output result for [Backend Call - API (saveQRCode)] action in Button widget.
  ApiCallResponse? saveQrCodeApiResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
