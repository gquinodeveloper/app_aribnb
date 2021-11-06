import 'package:app_airbnb/app/data/models/user_model.dart';
import 'package:app_airbnb/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

class UserRepository {
  final _apiProvider = Get.find<UserProvider>();

  Future<String> insertUser({
    required UserModel user,
  }) =>
      _apiProvider.insertUser(user: user);

  Future<List<UserModel>> getInformation({
    required String token,
    required int userId,
  }) =>
      _apiProvider.getInformation(token: token, userId: userId);
}
