import 'package:app_airbnb/app/data/providers/auth_provider.dart';
import 'package:app_airbnb/app/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class DependecyInjection {
  static void load() {
    //Providers
    Get.put<AuthProvider>(AuthProvider());

    //Repositories
    Get.put<AuthRepository>(AuthRepository());
  }
}
