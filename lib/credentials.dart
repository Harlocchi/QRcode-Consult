import 'dart:convert';

import 'package:http/http.dart' as http;

class credential{


  static String DOMAIN = 'https://manager.cpcon.co';
  static String DomainJWT = '$DOMAIN/api/jwt/obtain-token/';
  static String APPVERSION = "2.4.1";

  credential();

   Future<http.Response> getTokenJWT(user, password) async {
      var url = Uri.parse(DomainJWT);

      var body = jsonEncode({
        "username": user,
        "password": password
      });

      var header = {
        'Content-Type': 'application/json'
      };

      var response = await http.post(
        url, headers: header, body: body
      );

      return response;
  }

}