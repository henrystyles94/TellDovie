import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/sub_plans.dart';
import '../model/subscription_status.dart';
import '../repository/subscriptions.dart';

class SubscriptionController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxBool checkingSubStatus = RxBool(false);
  final subRepository = SubscriptionRepository();
  var loadedPlans = SubcriptionPlanResponseModel().obs;
  var loadedStatus = StatusResponseModel().obs;
  RxInt isTapped = RxInt(0);
  @override
  void onInit() {
    getPlansController();
    subscriptionStatusController();
    super.onInit();
  }

  getPlansController() async {
    try {
      isLoading(true);
      var result = await subRepository.getSubscriptionPlans();
      isLoading(false);
      loadedPlans.value = subcriptionPlanResponseModelFromJson(result);
    } catch (e) {
      isLoading(false);
      // rehrow e;
    }
  }

  // //subscriptionStatus
  subscriptionStatusController() async {
    try {
      checkingSubStatus(true);
      var result = await subRepository.checkStatus();
      checkingSubStatus(false);
      loadedStatus.value = statusResponseModelFromJson(result);
    } catch (e) {
      checkingSubStatus(false);
    }
  }
}
