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

  Future moodTrackerRepository(String audioFil, reaction, outcome, better) async {
    final response = await ApiCalls.httpPostCall(moodTracker,
      {
    "reason":audioFil,
    "reaction":reaction,
    "outcome":outcome,
    "better":better,
"description":"mp4"
});
    return response;
  }


  Future growthMindsetRepository() async {
    final response = await ApiCalls.httpGetCall(growthMindset);
    return response;
  }

  //earningforAffirmation
  Future earnPointsForAffirmation() async {
    final response = await ApiCalls.httpPostCall(earnAffirmationPoint, {});
    return response;
  }

  //growth Earning
  Future earnGrowthPointsRepository() async {
    final response = await ApiCalls.httpPostCall(earnGrowthPoint, {});
    return response;
  }

  //check downlaod status
  Future checkDownload(String name) async {
    final response =
        await ApiCalls.httpPostCall(checkDownloadRoute, {"name": name});
    return response;
  }
}
