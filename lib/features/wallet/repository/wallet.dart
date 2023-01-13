import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';

class WalletRepository {
  Future getWalletBalance() async {
    final response = await ApiCalls.httpGetCall(wallet);
    return response;
  }
}
