import 'package:app_airbnb/app/modules/detail/detail_binding.dart';
import 'package:app_airbnb/app/modules/detail/detail_page.dart';
import 'package:app_airbnb/app/modules/home/home_binding.dart';
import 'package:app_airbnb/app/modules/home/home_page.dart';
import 'package:app_airbnb/app/modules/login/login_binding.dart';
import 'package:app_airbnb/app/modules/login/login_page.dart';
import 'package:app_airbnb/app/modules/signup/signup_binding.dart';
import 'package:app_airbnb/app/modules/signup/signup_page.dart';
import 'package:app_airbnb/app/modules/splash/splash_binding.dart';
import 'package:app_airbnb/app/modules/splash/splash_page.dart';
import 'package:app_airbnb/app/routes/app_route.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAIL,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}
