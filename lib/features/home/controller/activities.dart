import 'package:dovie/features/home/presentation/calming_journal.dart';
import 'package:dovie/features/home/repository/activities.dart';
import 'package:dovie/features/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

import '../../../constants/models/affirmation_mode.dart';
import '../model/info_hub.dart';
import '../model/lessons.dart';

class ActivityController extends GetxController {
  bool clicked = false;
  RxInt selectedReaction = RxInt(-1);
  RxBool isLoading = RxBool(false);
  RxBool loadingInfo = RxBool(false);
  RxBool loadingLessons = RxBool(false);
  RxBool sendingJournal = RxBool(false);
  RxBool tracking = RxBool(false);
  final activityRepo = ActivitiesRepository();
  final affirmationModel = AffirmationResponseMode().obs;
  final loadedinfoModel = InfoHubResponseMode().obs;
  final loadedLessonModel = LessonHubResponseModel().obs;
  @override
  void onInit() {
    getAffirmationController();
    informationHubController();
    getLessonController();
    super.onInit();
  }

  Future getAffirmationController() async {
    try {
      isLoading(true);
      var result = await activityRepo.getALLAffrimations();
      isLoading(false);
      affirmationModel.value = affirmationResponseModeFromJson(result);
    } catch (e) {
      isLoading(false);
    }
  }

  Future informationHubController() async {
    try {
      loadingInfo(true);
      var result = await activityRepo.getInformationHubRepository();
      loadingInfo(false);
      loadedinfoModel.value = infoHubResponseModeFromJson(result);
    } catch (e) {
      loadingInfo(false);
    }
  }

  Future getLessonController() async {
    try {
      loadingLessons(true);
      var result = await activityRepo.lessonsRepository();
      loadingLessons(false);
      loadedLessonModel.value = lessonHubResponseModelFromJson(result);
    } catch (e) {
      loadingLessons(false);
    }
  }

  Future calmingJournalController(
      String reason, reaction, outcome, better) async {
    try {
      sendingJournal(true);
      var result = await activityRepo.calmingJournalRepository(
          reason, reaction, outcome, better);
      sendingJournal(false);
      SnackBarWidget().succesSnackBar(result['message']);
    } catch (e) {
      sendingJournal(false);
    }
  }

  Future moodTracker(String reaction, reason, better) async {
    try {
      tracking(true);
      var result =
          await activityRepo.moodTrackerRepository(reaction, reason, better);
      tracking(false);
      SnackBarWidget().succesSnackBar(result['message']);
    } catch (e) {
      tracking(false);
    }
  }
}
