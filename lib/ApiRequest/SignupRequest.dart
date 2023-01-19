class SignupRequest {
  String? firstName;
  String? lastName;

  String? email;
  String? password;
  String? confirmPassword;

  SignupRequest(this.firstName, this.lastName, this.email, this.password,
      this.confirmPassword);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    return data;
  }
}
