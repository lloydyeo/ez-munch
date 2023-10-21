import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_detail_page_model.dart';
export 'product_detail_page_model.dart';

class ProductDetailPageWidget extends StatefulWidget {
  const ProductDetailPageWidget({
    Key? key,
    required this.productReference,
  }) : super(key: key);

  final DocumentReference? productReference;

  @override
  _ProductDetailPageWidgetState createState() =>
      _ProductDetailPageWidgetState();
}

class _ProductDetailPageWidgetState extends State<ProductDetailPageWidget> {
  late ProductDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProductDetailPage'});
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

    return StreamBuilder<ProductsRecord>(
      stream: ProductsRecord.getDocument(widget.productReference!),
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
        final productDetailPageProductsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('PRODUCT_DETAIL_arrow_back_rounded_ICN_ON');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Hero(
                                tag: productDetailPageProductsRecord
                                    .coverImageUrl,
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    productDetailPageProductsRecord
                                        .coverImageUrl,
                                    width: double.infinity,
                                    height: 230.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  productDetailPageProductsRecord.name,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  formatNumber(
                                    productDetailPageProductsRecord.price,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelLarge,
                                ),
                              ),
                            ),
                            Divider(
                              height: 20.0,
                              thickness: 2.0,
                              indent: 16.0,
                              endIndent: 16.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Description',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 0.0),
                                child: Text(
                                  productDetailPageProductsRecord.description,
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              ),
                            ),
                            StreamBuilder<List<ProductOptionsRecord>>(
                              stream: queryProductOptionsRecord(
                                queryBuilder: (productOptionsRecord) =>
                                    productOptionsRecord.where(
                                  'product',
                                  isEqualTo:
                                      productDetailPageProductsRecord.reference,
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
                                List<ProductOptionsRecord>
                                    productOptionColProductOptionsRecordList =
                                    snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      productOptionColProductOptionsRecordList
                                          .length, (productOptionColIndex) {
                                    final productOptionColProductOptionsRecord =
                                        productOptionColProductOptionsRecordList[
                                            productOptionColIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  -0.90, 0.00),
                                              child: Text(
                                                productOptionColProductOptionsRecord
                                                    .name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ),
                                            ),
                                          ),
                                          StreamBuilder<
                                              List<ProductOptionValuesRecord>>(
                                            stream:
                                                queryProductOptionValuesRecord(
                                              queryBuilder:
                                                  (productOptionValuesRecord) =>
                                                      productOptionValuesRecord
                                                          .where(
                                                'productOption',
                                                isEqualTo:
                                                    productOptionColProductOptionsRecord
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
                                              List<ProductOptionValuesRecord>
                                                  optionValuesColProductOptionValuesRecordList =
                                                  snapshot.data!;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    optionValuesColProductOptionValuesRecordList
                                                        .length,
                                                    (optionValuesColIndex) {
                                                  final optionValuesColProductOptionValuesRecord =
                                                      optionValuesColProductOptionValuesRecordList[
                                                          optionValuesColIndex];
                                                  return Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.95,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Theme(
                                                          data: ThemeData(
                                                            checkboxTheme:
                                                                CheckboxThemeData(
                                                              visualDensity:
                                                                  VisualDensity
                                                                      .compact,
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                            ),
                                                            unselectedWidgetColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                          ),
                                                          child: Checkbox(
                                                            value: _model
                                                                    .checkboxValueMap[
                                                                optionValuesColProductOptionValuesRecord] ??= false,
                                                            onChanged:
                                                                (newValue) async {
                                                              setState(() =>
                                                                  _model.checkboxValueMap[
                                                                          optionValuesColProductOptionValuesRecord] =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                logFirebaseEvent(
                                                                    'PRODUCT_DETAIL_Checkbox_qt0qzozx_ON_TOGG');
                                                                logFirebaseEvent(
                                                                    'Checkbox_update_page_state');
                                                                setState(() {
                                                                  _model.addToSelectedProductValues(
                                                                      optionValuesColProductOptionValuesRecord);
                                                                  _model
                                                                      .perUnitPrice = _model
                                                                          .perUnitPrice +
                                                                      valueOrDefault<
                                                                          double>(
                                                                        optionValuesColProductOptionValuesRecord.addOnPrice !=
                                                                                null
                                                                            ? optionValuesColProductOptionValuesRecord.addOnPrice
                                                                            : 0.0,
                                                                        0.0,
                                                                      );
                                                                });
                                                              }
                                                            },
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            checkColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${optionValuesColProductOptionValuesRecord.value}${optionValuesColProductOptionValuesRecord.addOnPrice <= 0.0 ? ('') : ' (+ ${formatNumber(
                                                              optionValuesColProductOptionValuesRecord
                                                                  .addOnPrice,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .automatic,
                                                              currency: '',
                                                            )})'}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 24.0),
                                child: Container(
                                  width: 160.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(25.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => Icon(
                                      Icons.remove_rounded,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    incrementIconBuilder: (enabled) => Icon(
                                      Icons.add_rounded,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                    count: _model.quantityControllerValue ??= 1,
                                    updateCount: (count) => setState(() =>
                                        _model.quantityControllerValue = count),
                                    stepSize: 1,
                                    minimum: 1,
                                    maximum: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('PRODUCT_DETAIL_AddToCartBtn_ON_TAP');
                        logFirebaseEvent('AddToCartBtn_backend_call');
                        _model.existingCart = await CartsRecord.getDocumentOnce(
                            FFAppState().cart!);
                        if ((_model.existingCart != null) == false) {
                          logFirebaseEvent('AddToCartBtn_backend_call');

                          var cartsRecordReference2 =
                              CartsRecord.collection.doc();
                          await cartsRecordReference2.set(createCartsRecordData(
                            user: currentUserReference,
                            uuid: random_data.randomString(
                              36,
                              36,
                              false,
                              true,
                              true,
                            ),
                            status: 'open',
                            requireCutlery: false,
                            priorityOrder: false,
                          ));
                          _model.newlyCreatedCart =
                              CartsRecord.getDocumentFromData(
                                  createCartsRecordData(
                                    user: currentUserReference,
                                    uuid: random_data.randomString(
                                      36,
                                      36,
                                      false,
                                      true,
                                      true,
                                    ),
                                    status: 'open',
                                    requireCutlery: false,
                                    priorityOrder: false,
                                  ),
                                  cartsRecordReference2);
                          logFirebaseEvent('AddToCartBtn_update_app_state');
                          setState(() {
                            FFAppState().cart =
                                _model.newlyCreatedCart?.reference;
                          });
                          logFirebaseEvent('AddToCartBtn_backend_call');

                          var cartItemsRecordReference1 =
                              CartItemsRecord.collection.doc();
                          await cartItemsRecordReference1.set({
                            ...createCartItemsRecordData(
                              cart: FFAppState().cart,
                              product:
                                  productDetailPageProductsRecord.reference,
                              name: productDetailPageProductsRecord.name,
                              price: (productDetailPageProductsRecord.price +
                                      _model.perUnitPrice) *
                                  _model.quantityControllerValue!,
                              isThirdPartyPickup: false,
                              cartUuid: _model.newlyCreatedCart?.uuid,
                              productImage:
                                  productDetailPageProductsRecord.coverImageUrl,
                              vendor: productDetailPageProductsRecord.vendor,
                              quantity: valueOrDefault<int>(
                                _model.quantityControllerValue,
                                1,
                              ),
                            ),
                            ...mapToFirestore(
                              {
                                'product_option_values': _model
                                    .selectedProductValues
                                    .map((e) => e.reference)
                                    .toList(),
                              },
                            ),
                          });
                          _model.newlyCreatedCartItem =
                              CartItemsRecord.getDocumentFromData({
                            ...createCartItemsRecordData(
                              cart: FFAppState().cart,
                              product:
                                  productDetailPageProductsRecord.reference,
                              name: productDetailPageProductsRecord.name,
                              price: (productDetailPageProductsRecord.price +
                                      _model.perUnitPrice) *
                                  _model.quantityControllerValue!,
                              isThirdPartyPickup: false,
                              cartUuid: _model.newlyCreatedCart?.uuid,
                              productImage:
                                  productDetailPageProductsRecord.coverImageUrl,
                              vendor: productDetailPageProductsRecord.vendor,
                              quantity: valueOrDefault<int>(
                                _model.quantityControllerValue,
                                1,
                              ),
                            ),
                            ...mapToFirestore(
                              {
                                'product_option_values': _model
                                    .selectedProductValues
                                    .map((e) => e.reference)
                                    .toList(),
                              },
                            ),
                          }, cartItemsRecordReference1);
                          logFirebaseEvent('AddToCartBtn_backend_call');

                          await FFAppState().cart!.update({
                            ...mapToFirestore(
                              {
                                'items': FieldValue.arrayUnion(
                                    [_model.newlyCreatedCartItem?.reference]),
                                'vendors': FieldValue.arrayUnion(
                                    [productDetailPageProductsRecord.vendor]),
                              },
                            ),
                          });
                        } else {
                          if (_model.existingCart?.status != 'open') {
                            logFirebaseEvent('AddToCartBtn_backend_call');

                            var cartsRecordReference3 =
                                CartsRecord.collection.doc();
                            await cartsRecordReference3
                                .set(createCartsRecordData(
                              user: currentUserReference,
                              uuid: random_data.randomString(
                                25,
                                25,
                                true,
                                true,
                                true,
                              ),
                              status: 'open',
                              requireCutlery: false,
                              priorityOrder: false,
                            ));
                            _model.newCart = CartsRecord.getDocumentFromData(
                                createCartsRecordData(
                                  user: currentUserReference,
                                  uuid: random_data.randomString(
                                    25,
                                    25,
                                    true,
                                    true,
                                    true,
                                  ),
                                  status: 'open',
                                  requireCutlery: false,
                                  priorityOrder: false,
                                ),
                                cartsRecordReference3);
                            logFirebaseEvent('AddToCartBtn_update_app_state');
                            setState(() {
                              FFAppState().cart = _model.newCart?.reference;
                            });
                          }
                          // CreateCartItemInDB
                          logFirebaseEvent('AddToCartBtn_CreateCartItemInDB');

                          var cartItemsRecordReference2 =
                              CartItemsRecord.collection.doc();
                          await cartItemsRecordReference2.set({
                            ...createCartItemsRecordData(
                              cart: FFAppState().cart,
                              product:
                                  productDetailPageProductsRecord.reference,
                              name: productDetailPageProductsRecord.name,
                              price: (productDetailPageProductsRecord.price +
                                      valueOrDefault<double>(
                                        _model.perUnitPrice,
                                        0.0,
                                      )) *
                                  _model.quantityControllerValue!,
                              isThirdPartyPickup: false,
                              productImage:
                                  productDetailPageProductsRecord.coverImageUrl,
                              vendor: productDetailPageProductsRecord.vendor,
                              quantity: valueOrDefault<int>(
                                _model.quantityControllerValue,
                                1,
                              ),
                            ),
                            ...mapToFirestore(
                              {
                                'product_option_values': _model
                                    .selectedProductValues
                                    .map((e) => e.reference)
                                    .toList(),
                              },
                            ),
                          });
                          _model.newlyCreatedCartItemWithoutCart =
                              CartItemsRecord.getDocumentFromData({
                            ...createCartItemsRecordData(
                              cart: FFAppState().cart,
                              product:
                                  productDetailPageProductsRecord.reference,
                              name: productDetailPageProductsRecord.name,
                              price: (productDetailPageProductsRecord.price +
                                      valueOrDefault<double>(
                                        _model.perUnitPrice,
                                        0.0,
                                      )) *
                                  _model.quantityControllerValue!,
                              isThirdPartyPickup: false,
                              productImage:
                                  productDetailPageProductsRecord.coverImageUrl,
                              vendor: productDetailPageProductsRecord.vendor,
                              quantity: valueOrDefault<int>(
                                _model.quantityControllerValue,
                                1,
                              ),
                            ),
                            ...mapToFirestore(
                              {
                                'product_option_values': _model
                                    .selectedProductValues
                                    .map((e) => e.reference)
                                    .toList(),
                              },
                            ),
                          }, cartItemsRecordReference2);
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
                                'vendors': FieldValue.arrayUnion(
                                    [productDetailPageProductsRecord.vendor]),
                              },
                            ),
                          });
                        }

                        logFirebaseEvent('AddToCartBtn_update_app_state');
                        setState(() {
                          FFAppState().numCartItems =
                              FFAppState().numCartItems + 1;
                        });
                        logFirebaseEvent('AddToCartBtn_navigate_back');
                        context.safePop();

                        setState(() {});
                      },
                      text:
                          'Add to Cart - ${productDetailPageProductsRecord.price.toString()}',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
        );
      },
    );
  }
}
