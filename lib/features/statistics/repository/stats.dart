import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';

class StatisticsRepository {
  Future statsRepo() async {
    final response = await ApiCalls.httpGetCall(statistics);
    return response;
  }
}
