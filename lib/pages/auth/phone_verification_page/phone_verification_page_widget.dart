import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
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
import 'phone_verification_page_model.dart';
export 'phone_verification_page_model.dart';

class PhoneVerificationPageWidget extends StatefulWidget {
  const PhoneVerificationPageWidget({Key? key}) : super(key: key);

  @override
  _PhoneVerificationPageWidgetState createState() =>
      _PhoneVerificationPageWidgetState();
}

class _PhoneVerificationPageWidgetState
    extends State<PhoneVerificationPageWidget> {
  late PhoneVerificationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneVerificationPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'phoneVerificationPage'});
    _model.phoneNoTextController ??= TextEditingController();
    _model.phoneNoTextFocusNode ??= FocusNode();
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
                            'Welcome to Ez Munch!',
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
                            'Before we begin, we will need to verify your phone number below',
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          child: TextFormField(
                            controller: _model.phoneNoTextController,
                            focusNode: _model.phoneNoTextFocusNode,
                            autofocus: true,
                            autofillHints: [AutofillHints.telephoneNumber],
                            textCapitalization: TextCapitalization.none,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Mobile number',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                              hintText: 'Enter your mobile number here...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
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
                              prefixIcon: Icon(
                                Icons.phone,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                            maxLength: 8,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.phone,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            validator: _model.phoneNoTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PHONE_VERIFICATION_OTPBtn_ON_TAP');
                            var _shouldSetState = false;
                            logFirebaseEvent('OTPBtn_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              phoneNumber: _model.phoneNoTextController.text,
                              phoneOtp: _model.phoneNoTextController.text ==
                                      '88888888'
                                  ? '88888'
                                  : random_data
                                      .randomInteger(10000, 99999)
                                      .toString(),
                            ));
                            logFirebaseEvent('OTPBtn_backend_call');
                            _model.updatedUser =
                                await UsersRecord.getDocumentOnce(
                                    currentUserReference!);
                            _shouldSetState = true;
                            logFirebaseEvent('OTPBtn_backend_call');
                            _model.result =
                                await SendVerificationOTPSMSCall.call(
                              otp: _model.updatedUser?.phoneOtp,
                              mobileNumber: _model.updatedUser?.phoneNumber,
                            );
                            _shouldSetState = true;
                            if ((_model.result?.succeeded ?? true) == true) {
                              logFirebaseEvent('OTPBtn_navigate_to');

                              context.pushNamed('smsVerificationPage');

                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              logFirebaseEvent('OTPBtn_show_snack_bar');
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Unable to generate OTP ',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontSize: 14.0,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: 'Send OTP',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Noto Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 4.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PHONE_VERIFICATION_LogoutBtn_ON_TAP');
                            logFirebaseEvent('LogoutBtn_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth('loginPage', context.mounted);
                          },
                          text: 'Logout',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Noto Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 4.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
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
      ),
    );
  }
}
