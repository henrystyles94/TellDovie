import 'package:dovie/features/home/repository/affirmation.dart';
import 'package:get/get.dart';

import '../../../constants/models/affirmation_mode.dart';

class AffirmationController extends GetxController {
  bool clicked = false;
  RxInt selectedReaction = RxInt(-1);
  RxBool isLoading = RxBool(false);
  final affirmationRepository = AffirmationRepository();
  final affirmationModel = AffirmationResponseMode().obs;
  @override
  void onInit() {
    getAffirmationController();
    super.onInit();
  }

  Future getAffirmationController() async {
    try {
      isLoading(true);
      var result = await affirmationRepository.getALLAffrimations();
      isLoading(false);
      affirmationModel.value = affirmationResponseModeFromJson(result);
    } catch (e) {
      isLoading(false);
    }
  }
}
