import 'package:app_airbnb/app/data/models/user_model.dart';
import 'package:app_airbnb/app/data/repositories/user_repository.dart';
import 'package:app_airbnb/app/global/load_spinner.dart';
import 'package:app_airbnb/app/global/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //Repositories
  final _userRepository = Get.find<UserRepository>();

  //Instancias

  //Variables
  String _name = "";
  String _lastName = "";
  String _adress = "";
  String _email = "";
  String _password = "";

  void onChangeName(String value) => _name = value;
  void onChangeLastName(String value) => _lastName = value;
  void onChangeAdress(String value) => _adress = value;
  void onChangeEmail(String value) => _email = value;
  void onChangePassword(String value) => _password = value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void save() async {
    LoadSpinner.show();
    try {
      UserModel user = UserModel(
        name: _name,
        lastname: _lastName,
        address: _adress,
        email: _email,
        password: _password,
      );
      String response = await _userRepository.insertUser(user: user);
      LoadSpinner.hide();
      Snackbar.show(title: "Success", message: response);
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Message",
        message: e.response?.data["message"],
        type: 1,
      );
    }
  }
}
