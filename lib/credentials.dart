import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class credential{


  static String DOMAIN = 'https://sandbox.cpcon.co';
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

      var decode = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("jwt", decode["token"]);
      return response;
  }

  Future<String> getTokenSharedPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("jwt") ?? '';
     return token;
  }

  Future<List<Map<String, dynamic>?>> getPeople(String code) async {
    var url = Uri.parse("$DOMAIN/api/people-management/?identify_number=$code");

    String token = await getTokenSharedPref();

    print("CODE $code");
    print("TOKEN $token");
    print("$DOMAIN/api/people-management/?identify_number=$code");

    var header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'x-tenant':"b3a0b746-1b53-4346-b9a4-7b6a8ee9588e"
    };

    var response = await http.get(
        url, headers: header
    );


    List<Map<String, dynamic?>> results = [];
    var decode = jsonDecode(response.body);

    for(var people in decode['results']){
      results.add(people);
    }
    
    Map<String, dynamic> toReturn = {};
    print(results);
    return results;
  }
}