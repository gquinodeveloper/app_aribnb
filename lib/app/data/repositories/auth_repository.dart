import 'package:app_airbnb/app/data/models/request_token.dart';
import 'package:app_airbnb/app/data/providers/auth_provider.dart';
import 'package:get/get.dart';

class AuthRepository {
  final _apiProvider = Get.find<AuthProvider>();

  Future<RequestToken> auth({
    required String email,
    required String password,
  }) =>
      _apiProvider.auth(email: email, password: password);
}
