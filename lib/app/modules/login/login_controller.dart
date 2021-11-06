import 'package:app_airbnb/app/core/theme/app_theme.dart';
import 'package:app_airbnb/app/data/models/request_token.dart';
import 'package:app_airbnb/app/data/repositories/auth_repository.dart';
import 'package:app_airbnb/app/data/repositories/local/storage_repository.dart';
import 'package:app_airbnb/app/global/load_spinner.dart';
import 'package:app_airbnb/app/global/snackbar.dart';
import 'package:app_airbnb/app/routes/app_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //Repositories
  final _authRepository = Get.find<AuthRepository>();
  final _storageRepository = Get.find<StorageRepository>();

  //Instancias
  RequestToken _oRequestToken = RequestToken();

  //Variables
  late String _email = ""; // = "gqcrispin@gmail.com";
  late String _password = ""; // = "123456";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void onChangeEmail(String value) => _email = value;
  void onChangePassword(String value) => _password = value;

  auth() async {
    LoadSpinner.show();
    try {
      _oRequestToken = await _authRepository.auth(
        email: _email,
        password: _password,
      );
      LoadSpinner.hide();
      if (_oRequestToken.success == true) {
        await _storageRepository.setSession(request: _oRequestToken);
        Get.offNamedUntil(AppRoutes.HOME, (_) => false);
      }
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Error",
        message: e.response?.data["message"],
        type: 1,
      );
    }
  }
}
