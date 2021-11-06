import 'package:app_airbnb/app/data/providers/auth_provider.dart';
import 'package:app_airbnb/app/data/providers/local/storage_provider.dart';
import 'package:app_airbnb/app/data/providers/user_provider.dart';
import 'package:app_airbnb/app/data/repositories/auth_repository.dart';
import 'package:app_airbnb/app/data/repositories/local/storage_repository.dart';
import 'package:app_airbnb/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class DependecyInjection {
  static void load() {
    //Providers
    Get.put<AuthProvider>(AuthProvider());
    Get.put<UserProvider>(UserProvider());

    //Local
    Get.put<StorageProvider>(StorageProvider());

    //Repositories
    Get.put<AuthRepository>(AuthRepository());
    Get.put<UserRepository>(UserRepository());

    //Local
    Get.put<StorageRepository>(StorageRepository());
  }
}
