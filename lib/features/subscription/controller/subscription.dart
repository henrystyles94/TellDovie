import 'package:get/get.dart';

import '../model/sub_plans.dart';
import '../repository/subscriptions.dart';

class SubscriptionController extends GetxController {
  RxBool isLoading = RxBool(false);
  final subRepository = SubscriptionRepository();
  var loadedPlans = SubcriptionPlanResponseModel().obs;

  @override
  void onInit() {
    getPlansController();
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
}
