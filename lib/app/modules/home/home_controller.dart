import 'package:app_airbnb/app/data/models/request_token.dart';
import 'package:app_airbnb/app/data/models/user_model.dart';
import 'package:app_airbnb/app/data/repositories/local/storage_repository.dart';
import 'package:app_airbnb/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Repositories
  final _userRepository = Get.find<UserRepository>();
  final _storageRepository = Get.find<StorageRepository>();

  //Instancias
  RequestToken _oRequestToken = RequestToken();

  //Variables
  List<UserModel> users = [];
  RxString name = RxString("");
  RxString adress = RxString("");

  @override
  void onInit() {
    _loadStorage();
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

  _loadStorage() async {
    _oRequestToken = await _storageRepository.getSession();
    users = await _userRepository.getInformation(
      token: _oRequestToken.requestToken ?? "",
      userId: _oRequestToken.idUser ?? 0,
    );

    name.value = users[0].name ?? "";
    adress.value = users[0].address ?? "No tengo dirección";
  }
}
