import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = 'https://app.telldovie.com/api/v1/';

class ApiCalls {
  static Future httpPostCall(String endpoint, params) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    try {
      var response =
          await http.post(Uri.parse(url), body: jsonEncode(params), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Bearer-Token": "$token"
      });
      log(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

// PATCH REQUEST

  static Future httpPatchCall(String endpoint, params) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    try {
      var response =
          await http.patch(Uri.parse(url), body: jsonEncode(params), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Bearer-Token": "$token"
      });
      log(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  //secure httpgetCall
  static Future httpGetCall(
    String endpoint,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    var token = preferences.getString('token').toString();

    try {
      var response = await http.get(Uri.parse(url), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Bearer-Token": token
      });
      log(response.body);

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode != 200) {
        throw response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  //UNAUTHENTICATED PUT REQUEST
  static Future httpPutCall(String endpoint, params) async {
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    try {
      var response = await http.put(Uri.parse(url),
          body: jsonEncode(params),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json"
          });
      log(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  // DELETE
  static Future httpDeleteCall(
    String endpoint,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    var token = preferences.getString('token').toString();

    try {
      var response = await http.delete(Uri.parse(url), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Bearer-Token": token
      });
      log(response.body);

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode != 200) {
        throw response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}
