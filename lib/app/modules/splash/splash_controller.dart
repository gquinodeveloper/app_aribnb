import 'package:app_airbnb/app/routes/app_route.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _loadLogin();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  _loadLogin() async {
    await Future.delayed(
      Duration(seconds: 2),
      () {
        Get.offNamed(AppRoutes.LOGIN);
        //Get.toNamed(AppRoutes.LOGIN);
      },
    );
  }
}
