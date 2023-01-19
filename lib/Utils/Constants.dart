import 'package:flutter/material.dart';

class AppConstants {
  static Constants get constants => Constants();

  static ApiEndPoint get apiEndPoint => ApiEndPoint();
}

class Constants {
  String get DEBUG_BASE_URL => "http://192.168.1.70:3000/";

  String get RELEASE_BASE_URL => "http://192.168.1.70:3000/";

  String get ERROR_MSG => "error_message";
  String get LOADING => "loading";

  String get NO_INTERNET_MSG => "no_internet_connection_found.";
}

class ApiEndPoint {
  String get GETEVENTLIST => "event/get-booked-event/";

  String get USER_LOGIN => "api/user/login";

  String get USER_SIGNUP => "api/user/register";
}
