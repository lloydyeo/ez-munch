import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sms_verification_page_model.dart';
export 'sms_verification_page_model.dart';

class SmsVerificationPageWidget extends StatefulWidget {
  const SmsVerificationPageWidget({Key? key}) : super(key: key);

  @override
  _SmsVerificationPageWidgetState createState() =>
      _SmsVerificationPageWidgetState();
}

class _SmsVerificationPageWidgetState extends State<SmsVerificationPageWidget> {
  late SmsVerificationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmsVerificationPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'smsVerificationPage'});
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                alignment: AlignmentDirectional(0.00, 1.00),
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.85,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Ez_Munch_Main_(Customer)_Logo_(1).png',
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                fit: BoxFit.contain,
                                alignment: Alignment(0.00, 0.00),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 16.0),
                            child: Text(
                              'We\'ve sent you an OTP!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 32.0),
                            child: Text(
                              'Enter it below to verify your phone number',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                            ),
                          ),
                        ),
                        PinCodeTextField(
                          autoDisposeControllers: false,
                          appContext: context,
                          length: 5,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Noto Sans',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          enableActiveFill: false,
                          autoFocus: true,
                          enablePinAutofill: true,
                          errorTextSpace: 0.0,
                          showCursor: true,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          obscureText: false,
                          hintCharacter: '-',
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            fieldHeight: 50.0,
                            fieldWidth: 40.0,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: PinCodeFieldShape.underline,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            inactiveColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            selectedColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            activeFillColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            inactiveFillColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            selectedFillColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                          controller: _model.pinCodeController,
                          onChanged: (_) {},
                          onCompleted: (_) async {
                            logFirebaseEvent(
                                'SMS_VERIFICATION_PinCode_1sa91zms_ON_PIN');
                            if (_model.pinCodeController!.text ==
                                valueOrDefault(
                                    currentUserDocument?.phoneOtp, '')) {
                              logFirebaseEvent('PinCode_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                phoneVerified: true,
                              ));
                              logFirebaseEvent('PinCode_navigate_to');

                              context.pushNamed('ListVendorPage');

                              return;
                            } else {
                              logFirebaseEvent('PinCode_show_snack_bar');
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'OTP does not match, please try again.',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _model.pinCodeControllerValidator
                              .asValidator(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
