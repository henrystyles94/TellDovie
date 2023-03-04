import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';

class   AvatarPointEarnRepository {
  Future scorePoints() async {
    final response = await ApiCalls.httpPostCall(avatarPointEarn, {});
    return response;
  }
}
