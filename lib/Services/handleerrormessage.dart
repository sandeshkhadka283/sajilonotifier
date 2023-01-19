import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finalyearproject/Services/apiresponse.dart';
import 'package:finalyearproject/Utils/Constants.dart';
import 'package:flutter/cupertino.dart';

class HandleError {
  static Future<String> showErrorMessage(
      BuildContext context, DioError e) async {
    if (e.response == null) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected');
          return AppConstants.constants.ERROR_MSG;
        }
      } on SocketException catch (_) {
        print('not connected');
        return AppConstants.constants.NO_INTERNET_MSG;
      }
    } else {
      // var errorResponse = ApiResponse.fromJson(e.response!.data);
      // switch (e.response!.statusCode) {
      //   case 401:
      //     Helper.showSnackBar(context, errorResponse.message!);
      //     break;
      //   default:
      //     Helper.showSnackBar(context, errorResponse.message!);
      // }

      switch (e.type) {
        case DioErrorType.connectTimeout:
          return "connection_timeout";
        case DioErrorType.receiveTimeout:
          return "receiver_timeout";
        case DioErrorType.sendTimeout:
          return "sender_timeout";
        case DioErrorType.cancel:
          return "cancelled_by_server";
        case DioErrorType.other:
          return AppConstants.constants.ERROR_MSG;
        case DioErrorType.response:
          var errorResponse = ApiResponse.fromJson(e.response!.data['error']);
          print("ssss errorResponse ${errorResponse.message}");
          return errorResponse.message!;
        default:
          return e.message;
      }
    }

    if (e.response != null) {
      print("ssss data new ${e.response!.data}");
      print("ssss headers new ${e.response!.headers}");
      print("ssss requestOptions new ${e.response!.requestOptions}");
      print("ssss statusCode new ${e.response!.statusCode}");
    } else {
      print("ssss requestOptions new ${e.requestOptions}");
      print("ssss message new ${e.message}");
    }
    return AppConstants.constants.ERROR_MSG;
  }
}
