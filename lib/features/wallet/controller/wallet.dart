import 'package:get/get.dart';

import '../model/wallet.dart';
import '../repository/wallet.dart';

class WalletController extends GetxController {
  final walletRepo = WalletRepository();
  RxBool isLoading = RxBool(false);
  var loadedValue = WalletBalanceResponseModel().obs;

  @override
  void onInit() {
    walletController();
    super.onInit();
  }

  Future walletController() async {
    try {
      isLoading(true);
      var result = await walletRepo.getWalletBalance();
      isLoading(false);
      loadedValue.value = walletBalanceResponseModelFromJson(result);
    } catch (e) {
      isLoading(true);
      throw Exception(e);
    }
  }
}
