import 'dart:convert';

import 'package:app_airbnb/app/core/config/config.dart';
import 'package:app_airbnb/app/data/models/request_token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageProvider {
  final FlutterSecureStorage _storage = Get.put(FlutterSecureStorage());

  Future<void> setSession({required RequestToken request}) async {
    await _storage.write(key: kKeyAuth, value: jsonEncode(request.toJson()));
  }

  Future<RequestToken> getSession() async {
    String value = await _storage.read(key: kKeyAuth) ?? "";
    print(value);
    return RequestToken.fromJson(jsonDecode(value));
  }
}
