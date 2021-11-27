import 'package:app_airbnb/app/data/models/house_model.dart';
import 'package:app_airbnb/app/data/models/request_token.dart';
import 'package:app_airbnb/app/data/models/reservation_model.dart';
import 'package:app_airbnb/app/data/repositories/local/storage_repository.dart';
import 'package:app_airbnb/app/data/repositories/reservation_repository.dart';
import 'package:app_airbnb/app/global/load_spinner.dart';
import 'package:app_airbnb/app/global/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  //Repositories
  final _storageRepository = Get.find<StorageRepository>();
  final _reservationRepository = Get.find<ReservationRepository>();

  //Instancias
  RequestToken _oRequestToken = RequestToken();
  HouseModel houseModel = HouseModel();

  //Variable
  String _date = "";

  @override
  void onInit() {
    _loadStorage();
    this.houseModel = Get.arguments as HouseModel;
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

  void onChangeDate(String value) => _date = value;

  _loadStorage() async {
    _oRequestToken = await _storageRepository.getSession();
  }

  save() async {
    try {
      LoadSpinner.show();
      String response = await _reservationRepository.saveReservation(
        token: "${_oRequestToken.requestToken}",
        reservationModel: ReservationModel(
          idUser: _oRequestToken.idUser,
          idHouse: houseModel.idHouse,
          price: houseModel.price,
          date: _date,
        ),
      );
      LoadSpinner.hide();
      Get.back();
      Snackbar.show(
        title: "Success",
        message: response,
      );
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
