import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';

class ActivitiesRepository {
  Future getALLAffrimations() async {
    final response = await ApiCalls.httpGetCall(affirmations);
    print('object response $response');
    return response;
  }

  Future getInformationHubRepository() async {
    final response = await ApiCalls.httpGetCall(
      informationHub,
    );
    return response;
  }

  Future lessonsRepository() async {
    final response = await ApiCalls.httpGetCall(lessons);
    return response;
  }

  Future calmingJournalRepository(
      String reason, reaction, outcome, better) async {
    final response = await ApiCalls.httpPostCall(calmingJourn, {
      "reason": reason,
      "reaction": reaction,
      "outcome": outcome,
      "better": better
    });
    return response;
  }

  Future moodTrackerRepository(String reaction, reason, better) async {
    final response = await ApiCalls.httpPostCall(moodTracker,
        {"reaction": reaction, "reason": reaction, "better": better});
    return response;
  }

  Future growthMindsetRepository() async {
    final response = await ApiCalls.httpGetCall(growthMindset);
    return response;
  }
}
