import 'package:app_airbnb/app/core/theme/app_theme.dart';
import 'package:app_airbnb/app/data/models/request_token.dart';
import 'package:app_airbnb/app/data/repositories/auth_repository.dart';
import 'package:app_airbnb/app/global/load_spinner.dart';
import 'package:app_airbnb/app/routes/app_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //Repositories
  final _authRepository = Get.find<AuthRepository>();

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
        Get.offNamedUntil(AppRoutes.HOME, (_) => false);
      }
    } on DioError catch (e) {
      LoadSpinner.hide();
      Get.snackbar(
        "Message",
        e.response?.data["message"],
        backgroundColor: AppTheme.cyan,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }
}
