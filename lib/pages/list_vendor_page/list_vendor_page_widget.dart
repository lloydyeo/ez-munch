import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/postal_code_serving_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'list_vendor_page_model.dart';
export 'list_vendor_page_model.dart';

class ListVendorPageWidget extends StatefulWidget {
  const ListVendorPageWidget({Key? key}) : super(key: key);

  @override
  _ListVendorPageWidgetState createState() => _ListVendorPageWidgetState();
}

class _ListVendorPageWidgetState extends State<ListVendorPageWidget>
    with TickerProviderStateMixin {
  late ListVendorPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListVendorPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListVendorPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LIST_VENDOR_ListVendorPage_ON_INIT_STATE');
      if (valueOrDefault<bool>(currentUserDocument?.phoneVerified, false) ==
          true) {
        logFirebaseEvent('ListVendorPage_alert_dialog');
        showAlignedDialog(
          context: context,
          isGlobal: true,
          avoidOverflow: false,
          targetAnchor: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          followerAnchor: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          builder: (dialogContext) {
            return Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Container(
                  height: 450.0,
                  width: MediaQuery.sizeOf(context).width * 0.98,
                  child: PostalCodeServingDialogWidget(),
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));

        logFirebaseEvent('ListVendorPage_firestore_query');
        _model.existingCart = await queryCartsRecordOnce(
          queryBuilder: (cartsRecord) => cartsRecord
              .where(
                'user',
                isEqualTo: currentUserReference,
              )
              .where(
                'status',
                isEqualTo: 'open',
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if ((_model.existingCart != null) == true) {
          logFirebaseEvent('ListVendorPage_update_app_state');
          setState(() {
            FFAppState().cart = _model.existingCart?.reference;
          });
        } else {
          logFirebaseEvent('ListVendorPage_backend_call');

          var cartsRecordReference1 = CartsRecord.collection.doc();
          await cartsRecordReference1.set({
            ...createCartsRecordData(
              user: currentUserReference,
              userEmail: currentUserEmail,
              uuid: random_data.randomString(
                36,
                36,
                false,
                true,
                true,
              ),
              requireCutlery: false,
              status: 'open',
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
              userEmail: currentUserEmail,
              uuid: random_data.randomString(
                36,
                36,
                false,
                true,
                true,
              ),
              requireCutlery: false,
              status: 'open',
              priorityOrder: false,
            ),
            ...mapToFirestore(
              {
                'created_at': DateTime.now(),
                'updated_at': DateTime.now(),
              },
            ),
          }, cartsRecordReference1);
          logFirebaseEvent('ListVendorPage_update_app_state');
          setState(() {
            FFAppState().cart = _model.newCart?.reference;
          });
        }

        logFirebaseEvent('ListVendorPage_backend_call');
        _model.currentCart =
            await CartsRecord.getDocumentOnce(FFAppState().cart!);
        logFirebaseEvent('ListVendorPage_update_app_state');
        setState(() {
          FFAppState().numCartItems = valueOrDefault<int>(
            _model.currentCart?.items?.length,
            0,
          );
        });
        return;
      } else {
        logFirebaseEvent('ListVendorPage_navigate_to');

        context.pushNamed('phoneVerificationPage');

        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            drawer: Drawer(
              elevation: 16.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              'Welcome back, ${currentUserDisplayName}!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            currentUserEmail,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Noto Sans',
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('AddressBtn pressed ...');
                                  },
                                  text: 'My Addresses',
                                  icon: Icon(
                                    Icons.maps_home_work_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 30.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('MyOrdersBtn pressed ...');
                                  },
                                  text: 'My Orders',
                                  icon: Icon(
                                    Icons.receipt,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 30.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LIST_VENDOR_PAGE_PAGE_LogoutBtn_ON_TAP');
                                  logFirebaseEvent('LogoutBtn_auth');
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'loginPage', context.mounted);
                                },
                                text: 'Logout',
                                icon: Icon(
                                  Icons.logout_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 100.0,
                                  height: 30.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Noto Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 0.0,
                borderWidth: 0.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('LIST_VENDOR_DrawerButton_ON_TAP');
                  logFirebaseEvent('DrawerButton_drawer');
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              actions: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 10.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: badges.Badge(
                      badgeContent: Text(
                        valueOrDefault<String>(
                          FFAppState().numCartItems.toString(),
                          '0',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Noto Sans',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 12.0,
                            ),
                      ),
                      showBadge: true,
                      shape: badges.BadgeShape.circle,
                      badgeColor: FlutterFlowTheme.of(context).primaryBtnText,
                      elevation: 4.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      position: badges.BadgePosition.topEnd(),
                      animationType: badges.BadgeAnimationType.scale,
                      toAnimate: true,
                      child: FlutterFlowIconButton(
                        borderRadius: 0.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.shopping_cart,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'LIST_VENDOR_PAGE_PAGE_CartButton_ON_TAP');
                          logFirebaseEvent('CartButton_navigate_to');

                          context.pushNamed(
                            'CheckoutPage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Align(
                  alignment: AlignmentDirectional(-1.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivering to',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Noto Sans',
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          'Home',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Noto Sans',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: false,
                expandedTitleScale: 1.0,
                titlePadding:
                    EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 0.0, 0.0),
              ),
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Icon(
                                  Icons.search,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'What should we deliver?',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.tune_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor: FlutterFlowTheme.of(context).primary,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 12.0,
                                  ),
                              unselectedLabelStyle: TextStyle(),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 4.0, 4.0, 4.0),
                              tabs: [
                                Tab(
                                  text: 'Nearby',
                                  icon: Icon(
                                    Icons.location_pin,
                                  ),
                                ),
                                Tab(
                                  text: '3rd party vendors',
                                  icon: Icon(
                                    Icons.store_rounded,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                PagedListView<DocumentSnapshot<Object?>?,
                                    VendorsRecord>(
                                  pagingController:
                                      _model.setListVendorViewController(
                                    VendorsRecord.collection
                                        .where(
                                          'is_mall',
                                          isEqualTo: false,
                                        )
                                        .where(
                                          'is_third_party',
                                          isEqualTo: false,
                                        )
                                        .where(
                                          'status',
                                          isEqualTo: 'available',
                                        )
                                        .orderBy('name'),
                                  ),
                                  padding: EdgeInsets.zero,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<VendorsRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),

                                    itemBuilder:
                                        (context, _, listVendorViewIndex) {
                                      final listVendorViewVendorsRecord = _model
                                          .listVendorViewPagingController!
                                          .itemList![listVendorViewIndex];
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 16.0, 12.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'LIST_VENDOR_Image_j9x9m1fc_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                      'VendorProductListPage',
                                                      queryParameters: {
                                                        'vendorReference':
                                                            serializeParam(
                                                          listVendorViewVendorsRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  150),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    child: Image.network(
                                                      listVendorViewVendorsRecord
                                                          .coverImageUrl,
                                                      width: double.infinity,
                                                      height: 230.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 4.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      listVendorViewVendorsRecord
                                                          .name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 4.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Deliver in 40 mins',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Text(
                                                        '5.00',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.star_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 6.0, 6.0, 0.0),
                                        child: Text(
                                          'Craving food that are not from our partner merchants? Place your self-pickup order from any of these 3rd party merchants and have us deliver it to your doorstep!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Noto Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      StreamBuilder<List<ConfigsRecord>>(
                                        stream: queryConfigsRecord(
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitThreeBounce(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ConfigsRecord>
                                              containerConfigsRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final containerConfigsRecord =
                                              containerConfigsRecordList
                                                      .isNotEmpty
                                                  ? containerConfigsRecordList
                                                      .first
                                                  : null;
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Status: ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    containerConfigsRecord
                                                                ?.thirdPartyAvailability ==
                                                            true
                                                        ? 'Service Available'
                                                        : 'Service Unavailable',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans',
                                                              color: containerConfigsRecord!
                                                                      .thirdPartyAvailability
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .success
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    ' (updated at 9.33pm)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          color:
                                                              Color(0xFF5F5F5F),
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 9.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'LIST_VENDOR_ADD_A_3RD_PARTY_MERCHANT_ORD');
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed(
                                                'ThirdPartyPickupPage');
                                          },
                                          text:
                                              'Add a 3rd party merchant order',
                                          icon: Icon(
                                            Icons.shopping_bag,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Noto Sans',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child:
                                            StreamBuilder<List<VendorsRecord>>(
                                          stream: queryVendorsRecord(
                                            queryBuilder: (vendorsRecord) =>
                                                vendorsRecord.where(
                                              'is_third_party',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<VendorsRecord>
                                                pageViewVendorsRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: double.infinity,
                                              height: 500.0,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 40.0),
                                                    child: PageView.builder(
                                                      controller: _model
                                                              .pageViewController ??=
                                                          PageController(
                                                              initialPage: min(
                                                                  0,
                                                                  pageViewVendorsRecordList
                                                                          .length -
                                                                      1)),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          pageViewVendorsRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          pageViewIndex) {
                                                        final pageViewVendorsRecord =
                                                            pageViewVendorsRecordList[
                                                                pageViewIndex];
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Text(
                                                                  pageViewVendorsRecord
                                                                      .name,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            22.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              1300),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              1300),
                                                                  imageUrl:
                                                                      pageViewVendorsRecord
                                                                          .coverImageUrl,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.8,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      Alignment(
                                                                          0.00,
                                                                          0.00),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'LIST_VENDOR_BRING_ME_THERE!_BTN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Button_launch_u_r_l');
                                                                    await launchURL(
                                                                        pageViewVendorsRecord
                                                                            .qrCodeUrl);
                                                                  },
                                                                  text:
                                                                      'Bring me there!',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        34.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 1.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: smooth_page_indicator
                                                          .SmoothPageIndicator(
                                                        controller: _model
                                                                .pageViewController ??=
                                                            PageController(
                                                                initialPage: min(
                                                                    0,
                                                                    pageViewVendorsRecordList
                                                                            .length -
                                                                        1)),
                                                        count:
                                                            pageViewVendorsRecordList
                                                                .length,
                                                        axisDirection:
                                                            Axis.horizontal,
                                                        onDotClicked:
                                                            (i) async {
                                                          await _model
                                                              .pageViewController!
                                                              .animateToPage(
                                                            i,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        effect: smooth_page_indicator
                                                            .ExpandingDotsEffect(
                                                          expansionFactor: 3.0,
                                                          spacing: 8.0,
                                                          radius: 16.0,
                                                          dotWidth: 16.0,
                                                          dotHeight: 8.0,
                                                          dotColor:
                                                              Color(0xFFAFAFAF),
                                                          activeDotColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          paintStyle:
                                                              PaintingStyle
                                                                  .fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
