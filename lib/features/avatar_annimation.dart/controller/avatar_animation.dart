import 'package:get/get.dart';

import '../repository/avatar_repository.dart';

class AvatarAnimationController extends GetxController {
  final selectedItem = 0.obs;
  var earnPoint = AvatarPointEarnRepository();
  RxBool isLoading = RxBool(false);
  Future earnPointController() async {
    try {
      isLoading(false);
      await earnPoint.scorePoints();
      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }
}
