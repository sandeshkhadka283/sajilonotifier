import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:finalyearproject/ApiRequest/LoginRequest.dart';
import 'package:finalyearproject/ApiRequest/SignupRequest.dart';
import 'package:finalyearproject/ApiResponse/SignupResponse.dart';
import 'package:finalyearproject/Utils/Constants.dart';

import '../ApiResponse/LoginResponse.dart';

class DioClient {
  static DioClient? _instance;
  Dio? dio;

  DioClient._() {
    setupDio();
  }

  static DioClient get instance {
    _instance ??= DioClient._();
    return _instance!;
  }

  void setupDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.constants.DEBUG_BASE_URL,
        connectTimeout: 5000,
        receiveTimeout: 5000,
      ),
    );
    dio!.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
  }

  //  -----------------SignUP---------------------------------------------------------------------------------------------------------------------------

  Future<SignupResponse> signup(SignupRequest signupRequest) async {
    final response = await dio!.postUri(
        Uri.parse(AppConstants.apiEndPoint.USER_SIGNUP),
        data: signupRequest.toJson(),
        options: Options(headers: {"Content-Type": "application/json"}));

    return SignupResponse.fromJson(response.data);
  }

  // //  -----------------Login Emaiphone Password-------------------------------------------------------------------------------------------------

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await dio!.postUri(
        Uri.parse(AppConstants.apiEndPoint.USER_LOGIN),
        data: loginRequest.toJson(),
        options: Options(headers: {"Content-Type": "application/json"}));

    return LoginResponse.fromJson(response.data);
  }

  // //  -----------------Send Booking Form Data   ------------------------------------------------------------------------------
  // Future<UserBookedSubmitResponse> sendbookingformdata(
  //     String fullName,
  //     String email,
  //     String phone,
  //     int ticket,
  //     int totalprice,
  //     String event) async {
  //   var token = AppSetting.instance.token;
  //   final response = await dio!.postUri(
  //       Uri.parse(AppConstants.apiEndPoint.BOOKEVENT),
  //       data: jsonEncode(<dynamic, dynamic>{
  //         'fullName': fullName,
  //         'email': email,
  //         'phone': phone,
  //         'ticket': ticket,
  //         'totalPrice': totalprice,
  //         'event': event
  //       }),
  //       options: Options(
  //           headers: {"authorization": "Bearer ${AppSetting.instance.token}"}));
  //   print('Inside API method');
  //   return UserBookedSubmitResponse.fromJson(response.data);
  // }

  // Future<FetchEventResponse> fetcheventlistitems() async {
  //   var token = AppSetting.instance.token;
  //   final response = await dio!.getUri(
  //       Uri.parse(AppConstants.apiEndPoint.EVENTS),
  //       options: Options(headers: {"authorization": "Bearer $token"}));
  //   print('ssss response::::::::::::::  ${response}');

  //   return FetchEventResponse.fromJson(response.data);
  // }

}
