import 'package:dovie/constants/themes/colors.dart';
import 'package:get/get.dart';

class SnackBarWidget {
  void succesSnackBar(String message) {
    Get.snackbar('Successfully', message, backgroundColor: AppColors.buttonColor, colorText: AppColors.black);
  }
   void failureSnackBar(String message) {
    Get.snackbar('Opps', message, backgroundColor: AppColors.black, colorText: AppColors.whiteColor);
  }


}
