import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';

class SubscriptionRepository {
  getSubscriptionPlans() async {
    final response = await ApiCalls.httpGetCall(subPlans);
    return response;
  }

//buy coins
  sendAmount(String amount) async {
    final response = await ApiCalls.httpPostCall(pay, amount);
    return response;
  }

  //  subcribe
  subscribe(String duration, amount) async {
    final response = await ApiCalls.httpPostCall(
        subscribeToPlans, {"duration": duration, "amount": amount});
    return response;
  }

  //check subscription status
  checkStatus() async {
    final response = await ApiCalls.httpGetCall(status);
    return response;
  }
}
