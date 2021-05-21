import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:login/src/models/signup_model.dart';

class _AuthApi {
  Future<signup?> SignUp(String email, String password, String gender) async {
    final requestBody = {
      "email": email,
      "password": password,
      "gender": gender
    };

    final Url = Uri.parse("https://api.fresco-meat.com/api/albums/signup");

    try {
      final response = await post(
        Url,
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      final bodydata = response.body;
      final code  =response.statusCode;
      if(code != HttpStatus.created){
        return null;
      }

      final parseMap = jsonDecode(bodydata);

      print(parseMap);

      final signup responseModel = signup.fromJson(parseMap);
      return responseModel;
    } catch (e) {}
  }
}

final authApi = _AuthApi();
