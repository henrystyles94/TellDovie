import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';

class SubscriptionRepository {
  getSubscriptionPlans() async {
    final response = await ApiCalls.httpGetCall(subPlans);
    return response;
  }
}
