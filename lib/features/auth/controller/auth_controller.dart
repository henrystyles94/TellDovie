import 'package:dovie/features/auth/repository/auth_repository.dart';
import 'package:dovie/features/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final authRepository = AuthRepository();
  RxBool isLoading = RxBool(false);
  RxBool isTextEmpty = RxBool(true);
  Future loginUserController(String email, password) async {
    try {
      isLoading(true);
      await authRepository.loginUser(email, password);
      isLoading(false);
      Get.offAllNamed('bottomNavPage');
    } catch (e) {
      isLoading(false);
      SnackBarWidget().failureSnackBar('$e');
    }
  }
}
