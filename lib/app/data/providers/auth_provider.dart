import 'package:app_airbnb/app/core/config/config.dart';
import 'package:app_airbnb/app/data/models/request_token.dart';
import 'package:dio/dio.dart';

class AuthProvider {
  Future<RequestToken> auth({
    required String email,
    required String password,
  }) async {
    final dio = Dio();
    final response = await dio.post(
      "$kBaseUrl/api/user/auth",
      data: {
        "email": email,
        "password": password,
      },
    );
    print(response.data);
    return RequestToken.fromJson(response.data);
  }
}
