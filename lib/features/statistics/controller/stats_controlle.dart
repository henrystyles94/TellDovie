import 'package:get/get.dart';

import '../model/statistic_model.dart';
import '../repository/stats.dart';

class StatController extends GetxController {
  final statRepo = StatisticsRepository();
  RxBool isLoading = RxBool(false);
  var loadedStats = StatisticsResponseModel().obs;
  @override
  void onInit() {
    statsController();
    super.onInit();
  }

  Future statsController() async {
    try {
      isLoading(true);
      var result = await statRepo.statsRepo();
      isLoading(false);
      loadedStats.value = statisticsResponseModelFromJson(result);
    } catch (e) {
      isLoading(false);
    }
  }
}
