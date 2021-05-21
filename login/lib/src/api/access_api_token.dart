
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:login/src/models/login_access_token.dart';

class _AccessToken{
  Future<loginAccessToken?> accesstoken(String userName, String password, String U_ID) async {



    final requestBody = {
      "userName": userName,
      "password": password,
      "U_ID": U_ID
    };

    print(requestBody);



    final Url = Uri.parse("http://192.168.1.99:802/api/Users/Login");
    var client = new http.Client();
    try {

      final response = await client.post(
        Url,
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(requestBody),

      );

      final bodydata = response.body;
      final code  =response.statusCode;
      if(code == HttpStatus.created){
        return null;

      }

      else{
        print("Something went wrong");
      }

      final parseMap = jsonDecode(bodydata);




      final loginAccessToken responseModel = loginAccessToken.fromJson(parseMap);
      return responseModel;
    } catch (e) {

      print("test error $e");

    }
  }
}
final AccessToken = _AccessToken();