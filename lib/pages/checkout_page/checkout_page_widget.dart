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
import 'checkout_page_model.dart';
export 'checkout_page_model.dart';

class CheckoutPageWidget extends StatefulWidget {
  const CheckoutPageWidget({Key? key}) : super(key: key);

  @override
  _CheckoutPageWidgetState createState() => _CheckoutPageWidgetState();
}

class _CheckoutPageWidgetState extends State<CheckoutPageWidget> {
  late CheckoutPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CheckoutPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHECKOUT_CheckoutPage_ON_INIT_STATE');
      logFirebaseEvent('CheckoutPage_firestore_query');
      _model.postalCodes = await queryPostalCodesRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<CartsRecord>(
      stream: CartsRecord.getDocument(FFAppState().cart!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final checkoutPageCartsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
                  logFirebaseEvent('CHECKOUT_arrow_back_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Checkout',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 12.0, 9.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Where should we deliver to?',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                  ),
                            ),
                            Divider(
                              height: 10.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.95,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color: Color(0xFFEE7D31),
                                              size: 24.0,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                PostalCodesRecord>>(
                                                          stream:
                                                              queryPostalCodesRecord(),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitThreeBounce(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<PostalCodesRecord>
                                                                postalCodeRetrievalDialogPostalCodesRecordList =
                                                                snapshot.data!;
                                                            return FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .postalCodeRetrievalDialogValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: postalCodeRetrievalDialogPostalCodesRecordList
                                                                  .map((e) => e
                                                                      .postalCode
                                                                      .toString())
                                                                  .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                setState(() =>
                                                                    _model.postalCodeRetrievalDialogValue =
                                                                        val);
                                                                logFirebaseEvent(
                                                                    'CHECKOUT_PostalCodeRetrievalDialog_ON_FO');
                                                                var _shouldSetState =
                                                                    false;
                                                                logFirebaseEvent(
                                                                    'PostalCodeRetrievalDialog_alert_dialog');
                                                                showAlignedDialog(
                                                                  context:
                                                                      context,
                                                                  isGlobal:
                                                                      true,
                                                                  avoidOverflow:
                                                                      false,
                                                                  targetAnchor: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  followerAnchor: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              70.0,
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.96,
                                                                          child:
                                                                              PostalCodeRetrievalDialogWidget(),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));

                                                                logFirebaseEvent(
                                                                    'PostalCodeRetrievalDialog_backend_call');
                                                                _model.postalCodeResponse =
                                                                    await GetPostalCodeCall
                                                                        .call(
                                                                  postalCode: _model
                                                                      .postalCodeRetrievalDialogValue,
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                logFirebaseEvent(
                                                                    'PostalCodeRetrievalDialog_dismiss_dialog');
                                                                Navigator.pop(
                                                                    context);
                                                                if ((_model
                                                                        .postalCodeResponse
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  logFirebaseEvent(
                                                                      'PostalCodeRetrievalDialog_update_page_st');
                                                                  setState(() {
                                                                    _model.address =
                                                                        GetPostalCodeCall
                                                                            .address(
                                                                      (_model.postalCodeResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString();
                                                                  });
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'PostalCodeRetrievalDialog_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Unable to retrieve your postal code',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                    ),
                                                                  );
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }

                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                              },
                                                              width: 320.0,
                                                              height: 40.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                              hintText:
                                                                  'Select postal code...',
                                                              searchHintText:
                                                                  'Select postal code',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  true,
                                                              isMultiSelect:
                                                                  false,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 320.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Visibility(
                                                        visible: valueOrDefault<
                                                            bool>(
                                                          _model.address !=
                                                                  null &&
                                                              _model.address !=
                                                                  '',
                                                          false,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      3.0,
                                                                      3.0,
                                                                      0.0,
                                                                      3.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              _model.address,
                                                              'Select a postal code...',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          width: 60.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 80.0,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController1,
                                                                focusNode: _model
                                                                    .textFieldFocusNode1,
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelText:
                                                                      'Floor',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                validator: _model
                                                                    .textController1Validator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 60.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 80.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController2,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode2,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText:
                                                                        'Unit',
                                                                    labelStyle:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator: _model
                                                                      .textController2Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 22.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 0.0, 9.0, 0.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 770.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Basket',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 18.0,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 12.0),
                                  child: Text(
                                    'Below are the list of items in your basket',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                                StreamBuilder<List<CartItemsRecord>>(
                                  stream: queryCartItemsRecord(
                                    queryBuilder: (cartItemsRecord) =>
                                        cartItemsRecord
                                            .where(
                                              'cart',
                                              isEqualTo: checkoutPageCartsRecord
                                                  .reference,
                                            )
                                            .where(
                                              'is_third_party_pickup',
                                              isEqualTo: false,
                                            ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitThreeBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<CartItemsRecord>
                                        basketItemsListCartItemsRecordList =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          basketItemsListCartItemsRecordList
                                              .length, (basketItemsListIndex) {
                                        final basketItemsListCartItemsRecord =
                                            basketItemsListCartItemsRecordList[
                                                basketItemsListIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: StreamBuilder<ProductsRecord>(
                                            stream: ProductsRecord.getDocument(
                                                basketItemsListCartItemsRecord
                                                    .product!)
                                              ..listen(
                                                  (basketItemProductsRecord) async {
                                                if (_model.basketItemProductsRecordPreviousSnapshot !=
                                                        null &&
                                                    !ProductsRecordDocumentEquality().equals(
                                                        basketItemProductsRecord,
                                                        _model
                                                            .basketItemProductsRecordPreviousSnapshot)) {
                                                  logFirebaseEvent(
                                                      'CHECKOUT_BasketItem_ON_DATA_CHANGE');
                                                  if (basketItemProductsRecord
                                                          .status ==
                                                      'unavailable') {
                                                    logFirebaseEvent(
                                                        'BasketItem_update_page_state');
                                                    setState(() {
                                                      _model.hasUnavailableProducts =
                                                          true;
                                                    });
                                                    logFirebaseEvent(
                                                        'BasketItem_trigger_push_notification');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Item unavailable!',
                                                      notificationText:
                                                          '${basketItemProductsRecord.name} has gone out of stock',
                                                      userRefs: [
                                                        currentUserReference!
                                                      ],
                                                      initialPageName:
                                                          'CheckoutPage',
                                                      parameterData: {},
                                                    );
                                                    return;
                                                  } else {
                                                    return;
                                                  }

                                                  setState(() {});
                                                }
                                                _model.basketItemProductsRecordPreviousSnapshot =
                                                    basketItemProductsRecord;
                                              }),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitThreeBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final basketItemProductsRecord =
                                                  snapshot.data!;
                                              return Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 0.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      offset: Offset(0.0, 1.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (valueOrDefault<
                                                              bool>(
                                                            basketItemsListCartItemsRecord
                                                                        .productImage !=
                                                                    null &&
                                                                basketItemsListCartItemsRecord
                                                                        .productImage !=
                                                                    '',
                                                            false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          1.0,
                                                                          8.0,
                                                                          1.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                child: Image
                                                                    .network(
                                                                  basketItemsListCartItemsRecord
                                                                      .productImage,
                                                                  width: 70.0,
                                                                  height: 70.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '${valueOrDefault<String>(
                                                                      basketItemsListCartItemsRecord
                                                                          .quantity
                                                                          .toString(),
                                                                      '1',
                                                                    )} x ${basketItemsListCartItemsRecord.name}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final productOptionValues = basketItemsListCartItemsRecord
                                                                            .productOptionValues
                                                                            .map((e) =>
                                                                                e)
                                                                            .toList();
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: List.generate(
                                                                              productOptionValues.length,
                                                                              (productOptionValuesIndex) {
                                                                            final productOptionValuesItem =
                                                                                productOptionValues[productOptionValuesIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 0.0),
                                                                              child: StreamBuilder<ProductOptionValuesRecord>(
                                                                                stream: ProductOptionValuesRecord.getDocument(productOptionValuesItem),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        child: SpinKitThreeBounce(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  final textProductOptionValuesRecord = snapshot.data!;
                                                                                  return AutoSizeText(
                                                                                    '- ${textProductOptionValuesRecord.value}'.maybeHandleOverflow(
                                                                                      maxChars: 70,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Noto Sans',
                                                                                          color: Colors.black,
                                                                                          fontSize: 12.0,
                                                                                        ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  if (basketItemProductsRecord
                                                                          .status ==
                                                                      'unavailable')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Unavailable now',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans',
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                formatNumber(
                                                                  basketItemsListCartItemsRecord
                                                                      .price,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .automatic,
                                                                  currency: '',
                                                                ),
                                                                '\$0',
                                                              ),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                            borderRadius: 0.0,
                                                            borderWidth: 0.0,
                                                            buttonSize: 40.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color: Color(
                                                                  0xFFEE3131),
                                                              size: 20.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CHECKOUT_delete_outline_ICN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'IconButton_backend_call');
                                                              _model.cartForDeletedItem =
                                                                  await CartsRecord
                                                                      .getDocumentOnce(
                                                                          checkoutPageCartsRecord
                                                                              .reference);
                                                              logFirebaseEvent(
                                                                  'IconButton_backend_call');

                                                              await _model
                                                                  .cartForDeletedItem!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'items':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      basketItemsListCartItemsRecord
                                                                          .reference
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                              logFirebaseEvent(
                                                                  'IconButton_backend_call');
                                                              await basketItemsListCartItemsRecord
                                                                  .reference
                                                                  .delete();
                                                              logFirebaseEvent(
                                                                  'IconButton_update_app_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .numCartItems =
                                                                    FFAppState()
                                                                            .numCartItems +
                                                                        -1;
                                                              });

                                                              setState(() {});
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                                StreamBuilder<List<CartItemsRecord>>(
                                  stream: queryCartItemsRecord(
                                    queryBuilder: (cartItemsRecord) =>
                                        cartItemsRecord
                                            .where(
                                              'cart',
                                              isEqualTo: checkoutPageCartsRecord
                                                  .reference,
                                            )
                                            .where(
                                              'is_third_party_pickup',
                                              isEqualTo: true,
                                            ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitThreeBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<CartItemsRecord>
                                        pickupItemsListCartItemsRecordList =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          pickupItemsListCartItemsRecordList
                                              .length, (pickupItemsListIndex) {
                                        final pickupItemsListCartItemsRecord =
                                            pickupItemsListCartItemsRecordList[
                                                pickupItemsListIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (false == true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      1.0,
                                                                      1.0,
                                                                      1.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              pickupItemsListCartItemsRecord
                                                                  .productImage,
                                                              width: 70.0,
                                                              height: 70.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                pickupItemsListCartItemsRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      'Name: ${pickupItemsListCartItemsRecord.pickupName}'
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            70,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      'Order No: ${pickupItemsListCartItemsRecord.pickupReferenceNo}'
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            70,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            8.0,
                                                                            12.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      'Est. pick up in: ${pickupItemsListCartItemsRecord.pickupLeadTime.toString()} mins'
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            70,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              pickupItemsListCartItemsRecord
                                                                  .price,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .automatic,
                                                              currency: '',
                                                            ),
                                                            '\$0',
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        borderRadius: 0.0,
                                                        borderWidth: 0.0,
                                                        buttonSize: 40.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        icon: Icon(
                                                          Icons.delete_outline,
                                                          color:
                                                              Color(0xFFEE3131),
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'CHECKOUT_delete_outline_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');
                                                          await pickupItemsListCartItemsRecord
                                                              .reference
                                                              .delete();
                                                          logFirebaseEvent(
                                                              'IconButton_update_app_state');
                                                          setState(() {
                                                            FFAppState()
                                                                    .numCartItems =
                                                                FFAppState()
                                                                        .numCartItems +
                                                                    -1;
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Eco-friendly options',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18.0,
                                        ),
                                  ),
                                  Divider(
                                    height: 32.0,
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Plastic cutlery requested?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'We\'ll let the store know your request.\nJoin us in reducing plastic on your next order',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              Switch.adaptive(
                                                value: _model
                                                        .cutleryRequiredSwitchValue ??=
                                                    true,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                          .cutleryRequiredSwitchValue =
                                                      newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                inactiveTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                inactiveThumbColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Summary',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Below is a list of your items.',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Noto Sans',
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ),
                                  Divider(
                                    height: 32.0,
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Text(
                                            'Price Breakdown',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Noto Sans',
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Base Price',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              StreamBuilder<
                                                  List<CartItemsRecord>>(
                                                stream: queryCartItemsRecord(
                                                  queryBuilder:
                                                      (cartItemsRecord) =>
                                                          cartItemsRecord.where(
                                                    'cart',
                                                    isEqualTo:
                                                        checkoutPageCartsRecord
                                                            .reference,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CartItemsRecord>
                                                      textCartItemsRecordList =
                                                      snapshot.data!;
                                                  return Text(
                                                    formatNumber(
                                                      functions.sumCartItemPrice(
                                                          textCartItemsRecordList
                                                              .toList()),
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                      currency: '',
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          fontSize: 14.0,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Delivery Fee',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              Text(
                                                formatNumber(
                                                  2.8,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '',
                                                ),
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Total',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 36.0,
                                                    icon: Icon(
                                                      Icons.info_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ],
                                              ),
                                              StreamBuilder<
                                                  List<CartItemsRecord>>(
                                                stream: queryCartItemsRecord(
                                                  queryBuilder:
                                                      (cartItemsRecord) =>
                                                          cartItemsRecord.where(
                                                    'cart',
                                                    isEqualTo:
                                                        checkoutPageCartsRecord
                                                            .reference,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CartItemsRecord>
                                                      totalPriceCartItemsRecordList =
                                                      snapshot.data!;
                                                  return Text(
                                                    formatNumber(
                                                      functions.sumCartItemPrice(
                                                              totalPriceCartItemsRecordList
                                                                  .toList()) +
                                                          2.80,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: '',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 22.0,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 25.0),
                          child: StreamBuilder<List<CartItemsRecord>>(
                            stream: queryCartItemsRecord(
                              queryBuilder: (cartItemsRecord) =>
                                  cartItemsRecord.where(
                                'cart',
                                isEqualTo: checkoutPageCartsRecord.reference,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<CartItemsRecord> buttonCartItemsRecordList =
                                  snapshot.data!;
                              return FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CHECKOUT_PLACE_ORDER_BTN_ON_TAP');
                                  var _shouldSetState = false;
                                  if (_model.hasUnavailableProducts == true) {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Sorry! Some products have become unavailable in your cart',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Noto Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 1500),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  logFirebaseEvent('Button_alert_dialog');
                                  showAlignedDialog(
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Container(
                                            height: 150.0,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.98,
                                            child:
                                                PreparingPaymentDialogWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  logFirebaseEvent('Button_backend_call');
                                  _model.apiOrderRefNo =
                                      await GetOrderReferenceNumberCall.call();
                                  _shouldSetState = true;
                                  logFirebaseEvent('Button_backend_call');

                                  await checkoutPageCartsRecord.reference
                                      .update(createCartsRecordData(
                                    orderRefNo:
                                        'EZ-${GetOrderReferenceNumberCall.indexNumber(
                                      (_model.apiOrderRefNo?.jsonBody ?? ''),
                                    ).toString()}',
                                    requireCutlery:
                                        _model.cutleryRequiredSwitchValue,
                                  ));
                                  logFirebaseEvent('Button_backend_call');
                                  _model.updatedCart =
                                      await CartsRecord.getDocumentOnce(
                                          checkoutPageCartsRecord.reference);
                                  _shouldSetState = true;
                                  logFirebaseEvent('Button_backend_call');
                                  _model.qrCodeApiResponse =
                                      await GenerateQRCodeCall.call(
                                    amount: valueOrDefault<double>(
                                      functions.sumDouble(
                                          valueOrDefault<double>(
                                            functions.sumCartItemPrice(
                                                buttonCartItemsRecordList
                                                    .toList()),
                                            0.0,
                                          ),
                                          2.8),
                                      2.8,
                                    ),
                                    orderRefNo: _model.updatedCart?.orderRefNo,
                                  );
                                  _shouldSetState = true;
                                  logFirebaseEvent('Button_backend_call');

                                  await ApiLogsRecord.collection.doc().set({
                                    ...createApiLogsRecordData(
                                      response:
                                          (_model.qrCodeApiResponse?.bodyText ??
                                              ''),
                                      name: 'Generate QR Code',
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_at':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  if ((_model.qrCodeApiResponse?.succeeded ??
                                          true) ==
                                      true) {
                                    logFirebaseEvent('Button_backend_call');
                                    _model.saveQrCodeApiResponse =
                                        await SaveQRCodeCall.call(
                                      orderRefNo:
                                          _model.updatedCart?.orderRefNo,
                                      qrCodeImage:
                                          GenerateQRCodeCall.qRCodeBase64(
                                        (_model.qrCodeApiResponse?.jsonBody ??
                                            ''),
                                      ).toString(),
                                    );
                                    _shouldSetState = true;
                                    logFirebaseEvent('Button_backend_call');

                                    await ApiLogsRecord.collection.doc().set({
                                      ...createApiLogsRecordData(
                                        response: (_model.saveQrCodeApiResponse
                                                    ?.jsonBody ??
                                                '')
                                            .toString(),
                                        name: 'Save QR Code',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'created_at':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    if ((_model.saveQrCodeApiResponse
                                                ?.succeeded ??
                                            true) ==
                                        true) {
                                      logFirebaseEvent('Button_backend_call');

                                      await checkoutPageCartsRecord.reference
                                          .update(createCartsRecordData(
                                        paynowQrcodeUrl:
                                            SaveQRCodeCall.imageUrl(
                                          (_model.saveQrCodeApiResponse
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                        status: 'pending-payment',
                                        fazzOrderId:
                                            GenerateQRCodeCall.fazzOrderId(
                                          (_model.qrCodeApiResponse?.jsonBody ??
                                              ''),
                                        ).toString(),
                                        postalCode: _model
                                            .postalCodeRetrievalDialogValue,
                                        floor: _model.textController1.text,
                                        unitNo: _model.textController2.text,
                                      ));
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed('QRCodePage');

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Unable to contact our payment provider, please try again later.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 1500),
                                        backgroundColor: Color(0xFFEE7D31),
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Place Order',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle:
                                      FlutterFlowTheme.of(context).titleSmall,
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                  hoverColor: Colors.white,
                                  hoverBorderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
