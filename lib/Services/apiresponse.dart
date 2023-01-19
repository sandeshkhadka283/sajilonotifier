class ApiResponse {
  String? message;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
