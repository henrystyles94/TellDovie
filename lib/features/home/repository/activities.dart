import 'package:dio/dio.dart';
import 'package:dovie/constants/api_routes.dart';
import 'package:dovie/constants/http%20call/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    String audioFil,
    reaction,
    feeling,
    outcome,
    better,
    description,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    String fileName = audioFil;

    print(fileName);

    FormData data = FormData.fromMap({
      "reason": await MultipartFile.fromFile(
        audioFil,
        filename: fileName,
      ),
      "reaction": reaction,
      "outcome": outcome,
      "better": better,
      "description": description
    });
    Map<String, dynamic> mainheader = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Dio dio = Dio();

    var response = await dio.post(
      'https://app.telldovie.com/api/v1/store/journal',
      data: data,
      options: Options(headers: mainheader),
    );
    print(response.data);
    return response.data;
  }

  Future calmingJournalTextRepository(
      String reason, reaction, outcome, better, description) async {
    final response = await ApiCalls.httpPostCall(calmingJourn, {
      "reason": reason,
      "reaction": reaction,
      "outcome": outcome,
      "better": better,
      "description": description
    });
    return response;
  }

  Future moodTrackerTextRepository(String reason, reaction, better) async {
    final response = await ApiCalls.httpPostCall(moodTracker, {
      "reaction": reaction,
      "reason": reason,
      "better": better,
      "description": 'text'
    });
    return response;
  }
//

  Future moodTrackerRepository(
    audioFil,
    reaction,
    outcome,
    better,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    String fileName = audioFil;

    print(fileName);

    FormData data = FormData.fromMap({
      "reason": await MultipartFile.fromFile(
        audioFil,
        filename: fileName,
      ),
      "reaction": reaction,
      "outcome": outcome,
      "better": better,
      "description": "mp4"
    });
    Map<String, dynamic> mainheader = {
      // "Content-type": "application/json",
      // "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Dio dio = Dio();

    var response = await dio.post(
      'https://app.telldovie.com/api/v1/store/mood',
      data: data,
      options: Options(headers: mainheader),
    );
    print(response.data);
    return response.data;
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
