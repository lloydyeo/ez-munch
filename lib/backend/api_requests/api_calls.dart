import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendVerificationOTPSMSCall {
  static Future<ApiCallResponse> call({
    String? otp = '',
    String? mobileNumber = '',
  }) {
    final ffApiRequestBody = '''
{
  "otp": "${otp}",
  "mobile_number": "${mobileNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Verification OTP SMS',
      apiUrl:
          'https://m3poj4lhre.execute-api.ap-southeast-1.amazonaws.com/production',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic applicationId(dynamic response) => getJsonField(
        response,
        r'''$.MessageResponse.ApplicationId''',
      );
  static dynamic requestId(dynamic response) => getJsonField(
        response,
        r'''$.MessageResponse.RequestId''',
      );
  static dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.MessageResponse.Result''',
      );
}

class GetOrderReferenceNumberCall {
  static Future<ApiCallResponse> call() {
    final ffApiRequestBody = '''
{
  "TableName": "SystemKeys",
  "ReturnValues": "UPDATED_NEW",
  "ExpressionAttributeNames": {
    "#key": "index"
  },
  "Key": {
    "pk": {
      "S": "orderRefNo"
    },
    "sk": {
      "S": "orderRefNo"
    }
  },
  "ExpressionAttributeValues": {
    ":val": {
      "N": "1"
    },
    ":start_value": {
      "N": "0"
    }
  },
  "UpdateExpression": "SET #key = if_not_exists(#key, :start_value) + :val"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderReferenceNumber',
      apiUrl:
          'https://cbccc7etnd.execute-api.ap-southeast-1.amazonaws.com/production',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic indexNumber(dynamic response) => getJsonField(
        response,
        r'''$.Attributes.index.N''',
      );
}

class GenerateQRCodeCall {
  static Future<ApiCallResponse> call({
    double? amount = 0.0,
    String? orderRefNo = 'TESTING',
  }) {
    final ffApiRequestBody = '''
{
  "data": {
    "attributes": {
      "amount": ${amount},
      "referenceId": "${orderRefNo}",
      "description": "Make payment for${orderRefNo} ",
      "paymentMethodType": "paynow",
      "expiredAt": "2023-10-25T17:48:42+07:00",
      "paymentMethodOptions": {
        "bankShortCode": "faZZ"
      }
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateQRCode',
      apiUrl: 'https://xfers.io/api/v4/payments',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/vnd.api+json',
        'Authorization':
            'Basic bGl2ZV83OGMzN2Y5MTMwMDIyOWU0NDhkZWQ4ZGY5NmY5MDFkZDpxSXlXUTIxZjM3RW5WWVJHc1ZwZUZOR280clllV2RGRg==',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic fazzOrderId(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.description''',
      );
  static dynamic referenceId(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.referenceId''',
      );
  static dynamic qRCodeBase64(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.paymentMethod.instructions.qrCodeDisplayImage''',
      );
  static dynamic paymentMethodReferenceId(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.paymentMethod.referenceId''',
      );
  static dynamic paymentMethodId(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.paymentMethod.id''',
      );
  static dynamic fees(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.fees''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.amount''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.status''',
      );
  static dynamic paymentMethodType(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.paymentMethod.type''',
      );
  static dynamic paymentMethodExtEndToEndId(dynamic response) => getJsonField(
        response,
        r'''$.data.attributes.paymentMethod.instructions.extEndToEndId''',
      );
}

class SaveQRCodeCall {
  static Future<ApiCallResponse> call({
    String? orderRefNo = '',
    String? qrCodeImage = '',
  }) {
    final ffApiRequestBody = '''
{
  "orderRefNo": "${orderRefNo}",
  "qrCodeDisplayImage": "${qrCodeImage}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveQRCode',
      apiUrl:
          'https://9op2vvbcac.execute-api.ap-southeast-1.amazonaws.com/production',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic imageUrl(dynamic response) => getJsonField(
        response,
        r'''$.imageUrl''',
      );
}

class SendReceiptEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'sendReceiptEmail',
      apiUrl:
          'https://3508c685w7.execute-api.ap-southeast-1.amazonaws.com/production',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPostalCodeCall {
  static Future<ApiCallResponse> call({
    String? postalCode = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPostalCode',
      apiUrl: 'https://onemap.sg/api/common/elastic/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'searchVal': postalCode,
        'getAddrDetails': "Y",
        'returnGeom': "N",
        'pageNum': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic searchval(dynamic response) => getJsonField(
        response,
        r'''$.results[0].SEARCHVAL''',
        true,
      );
  static dynamic blkno(dynamic response) => getJsonField(
        response,
        r'''$.results[0].BLK_NO''',
      );
  static dynamic roadname(dynamic response) => getJsonField(
        response,
        r'''$.results[0].ROAD_NAME''',
      );
  static dynamic building(dynamic response) => getJsonField(
        response,
        r'''$.results[0].BUILDING''',
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.results[0].ADDRESS''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
