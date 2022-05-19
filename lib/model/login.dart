import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRes {
  String result;
  String accessToken;
  String refreshToken;
  LoginRes({
    required this.result,
    required this.accessToken,
    required this.refreshToken,
  });
  factory LoginRes.fromJson(Map<String, dynamic> object) {
    return LoginRes(
      result: (object["errors"] != null)
          ? object["errors"][0]["message"].toString()
          : "gagal",
      accessToken:
          (object["data"] != null) ? object["data"]["access_token"] : "",
      refreshToken:
          (object["data"] != null) ? object["data"]["refresh_token"] : "",
    );
  }

  static Future<LoginRes> connectToApi({
    required String email,
    required String password,
  }) async {
    String apiUrl = "https://admin.hdnmetatech.com/auth/login";
    // ini error tidak bisa di akses servernya
    var apiresult = await http.post(Uri.parse(apiUrl), body: {
      "password": "12345678",
      "email": "user2@mail.com",
    });

    var jsonObj = json.decode(apiresult.body);
    return LoginRes.fromJson(jsonObj);
  }
}

LoginRes userLogin = LoginRes(result: "", accessToken: "", refreshToken: "");
