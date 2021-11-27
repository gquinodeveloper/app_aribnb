import 'package:app_airbnb/app/data/providers/auth_provider.dart';
import 'package:app_airbnb/app/data/providers/house_provider.dart';
import 'package:app_airbnb/app/data/providers/local/storage_provider.dart';
import 'package:app_airbnb/app/data/providers/reservation_provider.dart';
import 'package:app_airbnb/app/data/providers/user_provider.dart';
import 'package:app_airbnb/app/data/repositories/auth_repository.dart';
import 'package:app_airbnb/app/data/repositories/house_repository.dart';
import 'package:app_airbnb/app/data/repositories/local/storage_repository.dart';
import 'package:app_airbnb/app/data/repositories/reservation_repository.dart';
import 'package:app_airbnb/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class DependecyInjection {
  static void load() {
    //Providers
    Get.put<AuthProvider>(AuthProvider());
    Get.put<UserProvider>(UserProvider());
    Get.put<HouseProvider>(HouseProvider());
    Get.put<ReservationProvider>(ReservationProvider());

    //Local
    Get.put<StorageProvider>(StorageProvider());

    //Repositories
    Get.put<AuthRepository>(AuthRepository());
    Get.put<UserRepository>(UserRepository());
    Get.put<HouseRepository>(HouseRepository());
    Get.put<ReservationRepository>(ReservationRepository());

    //Local
    Get.put<StorageRepository>(StorageRepository());
  }
}
