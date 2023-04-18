class RegisterResponse {
  String? token;
  RegisterResponse({
    required this.token,
  });
  factory RegisterResponse.fromjson(Map<String, String> res) {
    return RegisterResponse(token: res["token"]);
  }
}
