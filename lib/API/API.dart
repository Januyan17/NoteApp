import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  var baseurl = "https://65fd18ec9fc4425c6531227f.mockapi.io/";
  var token;

  postData(data, apiUrl) async {
    var fullUrl = Uri.parse(baseurl + apiUrl);
    print(fullUrl);
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        // 'Content-Type': 'application/x-www-form-urlencoded',
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
