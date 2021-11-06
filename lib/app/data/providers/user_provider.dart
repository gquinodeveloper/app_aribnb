import 'dart:convert';

import 'package:app_airbnb/app/core/config/config.dart';
import 'package:app_airbnb/app/data/models/user_model.dart';
import 'package:dio/dio.dart';

class UserProvider {
  Future<String> insertUser({
    required UserModel user,
  }) async {
    final _dio = Dio();
    final response = await _dio.post(
      "$kBaseUrl/api/user/register",
      data: json.encode(user.toJson()),
    );

    return response.data["message"];
  }

  Future<List<UserModel>> getInformation({
    required String token,
    required int userId,
  }) async {
    final _dio = Dio();

    Map<String, dynamic> headers = {
      "auth": token,
    };
    final response = await _dio.get(
      "$kBaseUrl/api/user/information/$userId",
      options: Options(
        headers: headers,
      ),
    );

    return (response.data["information"] as List)
        .map((json) => UserModel.fromJson(json))
        .toList();
  }
}
