import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'product_detail_page_widget.dart' show ProductDetailPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailPageModel extends FlutterFlowModel<ProductDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.

  Map<ProductOptionValuesRecord, bool> checkboxValueMap = {};
  List<ProductOptionValuesRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for QuantityController widget.
  int? quantityControllerValue;
  // Stores action output result for [Backend Call - Read Document] action in AddToCartBtn widget.
  CartsRecord? existingCart;
  // Stores action output result for [Backend Call - Create Document] action in AddToCartBtn widget.
  CartsRecord? newlyCreatedCart;
  // Stores action output result for [Backend Call - Create Document] action in AddToCartBtn widget.
  CartItemsRecord? newlyCreatedCartItem;
  // Stores action output result for [Backend Call - Create Document] action in AddToCartBtn widget.
  CartsRecord? newCart;
  // Stores action output result for [Backend Call - Create Document] action in AddToCartBtn widget.
  CartItemsRecord? newlyCreatedCartItemWithoutCart;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
