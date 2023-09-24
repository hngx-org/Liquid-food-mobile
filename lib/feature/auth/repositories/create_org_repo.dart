import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../../feature/utils/routing/utlils.dart';
import '../model/admin_model.dart';
import '../model/create_adm.model.dart';
import '../model/output.dart';

typedef AuthResult = Result<CreateAdmModel, String>;

class AuthService {
  // static const String _baseUrl =
  //     'liquid-food-backend-production.up.railway.app';
  // static const String _username = '';
  // static const String _password = '';
  // static final String _authToken =
  //     base64.encode(utf8.encode('$_username:$_password'));

  static Future<AuthResult> registerUser(AdminUser user) async {
    final url = AppUrl.adminSignupUrl;

    Map<String, String> headers = {
      // "accept": "application/json",
      "Content-Type": "application/json",
      // HttpHeaders.authorizationHeader: _authToken,
    };

    Uri uri = Uri.parse(url);
    try {
      var response = await http
          .post(uri, headers: headers, body: user.toJson())
          .timeout(const Duration(seconds: 10));

      if (response.statusCode.toString().startsWith("400")) {
        var err = json.decode(response.body)["message"];

        return Result(err: err);
      }

      if (response.statusCode.toString().startsWith("4")) {
        var err = json.decode(response.body)["message"];

        return Result(err: (err));
      }

      if (response.statusCode != 200) {
        var err = jsonDecode(response.body)["error"] ??
            "Unexpected error, please try again.";

        return Result(err: err);
      }
      return Result(
        data: CreateAdmModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    } on SocketException {
      return Result(err: "Network error");
    } on TimeoutException catch (e) {
      return Result(err: e.message!);
    }
  }
}
