import 'package:foodordering/core/data/repositories/shared_prefreance_repository.dart';
import 'package:foodordering/ui/shared/utils.dart';
import 'package:foodordering/ui/views/intro_view/intro_view.dart';
import 'package:foodordering/ui/views/landing_view/landing_view.dart';
import 'package:foodordering/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    if (storage.getOrderPlaced()) {
      cartService.clearCart();
      storage.setOrderPlaced(false);
    }
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (storage.getFirstLunch()) {
        Get.off(IntroView());
      } else {
        Get.off(storage.getLoggedIN() ? LandingView() : LandingView());
      }
      //Get.back();
      storage.setFirstLunch(false);
    });
    super.onInit();
  }
}
