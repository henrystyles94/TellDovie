import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';

class AffirmationRepository {
  Future getALLAffrimations() async {
    final response = await ApiCalls.httpGetCall(affirmations);
    return response;
  }
}
