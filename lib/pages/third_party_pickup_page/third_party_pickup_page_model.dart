import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'third_party_pickup_page_widget.dart' show ThirdPartyPickupPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThirdPartyPickupPageModel
    extends FlutterFlowModel<ThirdPartyPickupPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for StoreNameForm widget.
  TextEditingController? storeNameFormController;
  String? Function(BuildContext, String?)? storeNameFormControllerValidator;
  // State field(s) for OrderNameForm widget.
  TextEditingController? orderNameFormController;
  String? Function(BuildContext, String?)? orderNameFormControllerValidator;
  // State field(s) for OrderRefForm widget.
  TextEditingController? orderRefFormController;
  String? Function(BuildContext, String?)? orderRefFormControllerValidator;
  // State field(s) for PickUpLeadTimeDropdown widget.
  int? pickUpLeadTimeDropdownValue;
  FormFieldController<int>? pickUpLeadTimeDropdownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in AddToCartBtn widget.
  CartsRecord? newlyCreatedCart;
  // Stores action output result for [Backend Call - Create Document] action in AddToCartBtn widget.
  CartItemsRecord? newlyCreatedCartItem;
  // Stores action output result for [Backend Call - Read Document] action in AddToCartBtn widget.
  CartsRecord? currentExistingCart;
  // Stores action output result for [Backend Call - Create Document] action in AddToCartBtn widget.
  CartsRecord? newCart;
  // Stores action output result for [Backend Call - Create Document] action in AddToCartBtn widget.
  CartItemsRecord? newlyCreatedCartItemWithoutCart;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    storeNameFormController?.dispose();
    orderNameFormController?.dispose();
    orderRefFormController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
