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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'third_party_pickup_page_model.dart';
export 'third_party_pickup_page_model.dart';

class ThirdPartyPickupPageWidget extends StatefulWidget {
  const ThirdPartyPickupPageWidget({Key? key}) : super(key: key);

  @override
  _ThirdPartyPickupPageWidgetState createState() =>
      _ThirdPartyPickupPageWidgetState();
}

class _ThirdPartyPickupPageWidgetState
    extends State<ThirdPartyPickupPageWidget> {
  late ThirdPartyPickupPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThirdPartyPickupPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ThirdPartyPickupPage'});
    _model.storeNameFormController ??= TextEditingController();
    _model.orderNameFormController ??= TextEditingController();
    _model.orderRefFormController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('THIRD_PARTY_PICKUP_arrow_back_rounded_IC');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            '3rd Party Vendor Pickup',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Text(
                        'Enter your self-pickup details in the form below:',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 10.0),
                      child: TextFormField(
                        controller: _model.storeNameFormController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Vendor Name',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: 'Enter the vendor name...',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        validator: _model.storeNameFormControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 10.0),
                      child: TextFormField(
                        controller: _model.orderNameFormController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: 'Enter the name tagged to your order...',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        validator: _model.orderNameFormControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 10.0),
                      child: TextFormField(
                        controller: _model.orderRefFormController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Order Reference',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText:
                              'Enter the reference number tagged to your order...',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        validator: _model.orderRefFormControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 10.0),
                      child: FlutterFlowDropDown<int>(
                        controller:
                            _model.pickUpLeadTimeDropdownValueController ??=
                                FormFieldController<int>(null),
                        options: [20, 25, 30, 35, 40, 45, 50, 55, 60],
                        optionLabels: [
                          '20 minutes',
                          '25 minutes',
                          '30 minutes',
                          '35 minutes',
                          '40 minutes',
                          '45 minutes',
                          '50 minutes',
                          '55 minutes',
                          '60 minutes'
                        ],
                        onChanged: (val) => setState(
                            () => _model.pickUpLeadTimeDropdownValue = val),
                        width: double.infinity,
                        height: 50.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText:
                            'Select the estimated lead time for the order',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'THIRD_PARTY_PICKUP_OrderScreenshotBtn_ON');
                          logFirebaseEvent(
                              'OrderScreenshotBtn_upload_media_to_fireb');
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl = downloadUrls.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              setState(() {});
                              showUploadMessage(
                                  context, 'Failed to upload data');
                              return;
                            }
                          }
                        },
                        text: 'Upload Order Screenshot (optional)',
                        icon: Icon(
                          Icons.cloud_upload,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Noto Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'THIRD_PARTY_PICKUP_AddToCartBtn_ON_TAP');
                          if (FFAppState().cart == null) {
                            // CreateNewCart
                            logFirebaseEvent('AddToCartBtn_CreateNewCart');

                            var cartsRecordReference1 =
                                CartsRecord.collection.doc();
                            await cartsRecordReference1.set({
                              ...createCartsRecordData(
                                user: currentUserReference,
                                uuid: random_data.randomString(
                                  20,
                                  24,
                                  true,
                                  true,
                                  true,
                                ),
                                status: 'open',
                                requireCutlery: false,
                                priorityOrder: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_at': FieldValue.serverTimestamp(),
                                  'updated_at': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            _model.newlyCreatedCart =
                                CartsRecord.getDocumentFromData({
                              ...createCartsRecordData(
                                user: currentUserReference,
                                uuid: random_data.randomString(
                                  20,
                                  24,
                                  true,
                                  true,
                                  true,
                                ),
                                status: 'open',
                                requireCutlery: false,
                                priorityOrder: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_at': DateTime.now(),
                                  'updated_at': DateTime.now(),
                                },
                              ),
                            }, cartsRecordReference1);
                            // SetNewCartAsAppCart
                            logFirebaseEvent(
                                'AddToCartBtn_SetNewCartAsAppCart');
                            setState(() {
                              FFAppState().cart =
                                  _model.newlyCreatedCart?.reference;
                            });
                            // CreateNewCartItem
                            logFirebaseEvent('AddToCartBtn_CreateNewCartItem');

                            var cartItemsRecordReference1 =
                                CartItemsRecord.collection.doc();
                            await cartItemsRecordReference1
                                .set(createCartItemsRecordData(
                              cart: FFAppState().cart,
                              name:
                                  '${_model.orderNameFormController.text} - Pickup',
                              price: 0.0,
                              isThirdPartyPickup: true,
                              pickupName: _model.storeNameFormController.text,
                              pickupReferenceNo:
                                  _model.orderRefFormController.text,
                              pickupScreenshot: _model.uploadedFileUrl,
                              pickupLeadTime:
                                  _model.pickUpLeadTimeDropdownValue,
                              pickupVendorName:
                                  _model.storeNameFormController.text,
                            ));
                            _model.newlyCreatedCartItem =
                                CartItemsRecord.getDocumentFromData(
                                    createCartItemsRecordData(
                                      cart: FFAppState().cart,
                                      name:
                                          '${_model.orderNameFormController.text} - Pickup',
                                      price: 0.0,
                                      isThirdPartyPickup: true,
                                      pickupName:
                                          _model.storeNameFormController.text,
                                      pickupReferenceNo:
                                          _model.orderRefFormController.text,
                                      pickupScreenshot: _model.uploadedFileUrl,
                                      pickupLeadTime:
                                          _model.pickUpLeadTimeDropdownValue,
                                      pickupVendorName:
                                          _model.storeNameFormController.text,
                                    ),
                                    cartItemsRecordReference1);
                            // AddNewCartItemToCart
                            logFirebaseEvent(
                                'AddToCartBtn_AddNewCartItemToCart');

                            await FFAppState().cart!.update({
                              ...mapToFirestore(
                                {
                                  'items': FieldValue.arrayUnion(
                                      [_model.newlyCreatedCartItem?.reference]),
                                  'updated_at': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                          } else {
                            logFirebaseEvent('AddToCartBtn_backend_call');
                            _model.currentExistingCart =
                                await CartsRecord.getDocumentOnce(
                                    FFAppState().cart!);
                            if (_model.currentExistingCart?.status != 'open') {
                              // CreateNewCart
                              logFirebaseEvent('AddToCartBtn_CreateNewCart');

                              var cartsRecordReference3 =
                                  CartsRecord.collection.doc();
                              await cartsRecordReference3.set({
                                ...createCartsRecordData(
                                  user: currentUserReference,
                                  uuid: random_data.randomString(
                                    20,
                                    24,
                                    true,
                                    true,
                                    true,
                                  ),
                                  status: 'open',
                                  requireCutlery: false,
                                  priorityOrder: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'created_at': FieldValue.serverTimestamp(),
                                    'updated_at': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.newCart = CartsRecord.getDocumentFromData({
                                ...createCartsRecordData(
                                  user: currentUserReference,
                                  uuid: random_data.randomString(
                                    20,
                                    24,
                                    true,
                                    true,
                                    true,
                                  ),
                                  status: 'open',
                                  requireCutlery: false,
                                  priorityOrder: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'created_at': DateTime.now(),
                                    'updated_at': DateTime.now(),
                                  },
                                ),
                              }, cartsRecordReference3);
                              // SetNewCartAsAppCart
                              logFirebaseEvent(
                                  'AddToCartBtn_SetNewCartAsAppCart');
                              setState(() {
                                FFAppState().cart = _model.newCart?.reference;
                              });
                            }
                            // CreateCartItemInDB
                            logFirebaseEvent('AddToCartBtn_CreateCartItemInDB');

                            var cartItemsRecordReference2 =
                                CartItemsRecord.collection.doc();
                            await cartItemsRecordReference2
                                .set(createCartItemsRecordData(
                              cart: FFAppState().cart,
                              name:
                                  '${_model.orderNameFormController.text} - Pickup',
                              price: 0.0,
                              isThirdPartyPickup: true,
                              pickupName: _model.storeNameFormController.text,
                              pickupReferenceNo:
                                  _model.orderRefFormController.text,
                              pickupScreenshot: _model.uploadedFileUrl,
                              pickupLeadTime:
                                  _model.pickUpLeadTimeDropdownValue,
                              pickupVendorName:
                                  _model.storeNameFormController.text,
                            ));
                            _model.newlyCreatedCartItemWithoutCart =
                                CartItemsRecord.getDocumentFromData(
                                    createCartItemsRecordData(
                                      cart: FFAppState().cart,
                                      name:
                                          '${_model.orderNameFormController.text} - Pickup',
                                      price: 0.0,
                                      isThirdPartyPickup: true,
                                      pickupName:
                                          _model.storeNameFormController.text,
                                      pickupReferenceNo:
                                          _model.orderRefFormController.text,
                                      pickupScreenshot: _model.uploadedFileUrl,
                                      pickupLeadTime:
                                          _model.pickUpLeadTimeDropdownValue,
                                      pickupVendorName:
                                          _model.storeNameFormController.text,
                                    ),
                                    cartItemsRecordReference2);
                            // AddCartItemToCartInDB
                            logFirebaseEvent(
                                'AddToCartBtn_AddCartItemToCartInDB');

                            await FFAppState().cart!.update({
                              ...mapToFirestore(
                                {
                                  'items': FieldValue.arrayUnion([
                                    _model.newlyCreatedCartItemWithoutCart
                                        ?.reference
                                  ]),
                                  'updated_at': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                          }

                          logFirebaseEvent('AddToCartBtn_update_app_state');
                          setState(() {});
                          logFirebaseEvent('AddToCartBtn_navigate_back');
                          context.safePop();
                          logFirebaseEvent('AddToCartBtn_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Added pickup to Cart!',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                          );

                          setState(() {});
                        },
                        text: 'Add to Cart',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFEE7D31),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Noto Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
