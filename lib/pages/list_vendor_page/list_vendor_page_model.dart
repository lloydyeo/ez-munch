import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'list_vendor_page_widget.dart' show ListVendorPageWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ListVendorPageModel extends FlutterFlowModel<ListVendorPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ListVendorPage widget.
  CartsRecord? existingCart;
  // Stores action output result for [Backend Call - Create Document] action in ListVendorPage widget.
  CartsRecord? newCart;
  // Stores action output result for [Backend Call - Read Document] action in ListVendorPage widget.
  CartsRecord? currentCart;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ListVendorView widget.

  PagingController<DocumentSnapshot?, VendorsRecord>?
      listVendorViewPagingController;
  Query? listVendorViewPagingQuery;
  List<StreamSubscription?> listVendorViewStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
    tabBarController?.dispose();
    listVendorViewStreamSubscriptions.forEach((s) => s?.cancel());
    listVendorViewPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, VendorsRecord>
      setListVendorViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listVendorViewPagingController ??=
        _createListVendorViewController(query, parent);
    if (listVendorViewPagingQuery != query) {
      listVendorViewPagingQuery = query;
      listVendorViewPagingController?.refresh();
    }
    return listVendorViewPagingController!;
  }

  PagingController<DocumentSnapshot?, VendorsRecord>
      _createListVendorViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, VendorsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryVendorsRecordPage(
          queryBuilder: (_) => listVendorViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listVendorViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
