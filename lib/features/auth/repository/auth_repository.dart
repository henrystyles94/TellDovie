import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future loginUser(String email, password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final response = await ApiCalls.httpPostCall(
        login, {"username": email, "password": password});
    var token = response['token'];
    preferences.setString('token', token);
    return response;
  }
}
