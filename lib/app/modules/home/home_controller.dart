import 'package:app_airbnb/app/data/models/house_model.dart';
import 'package:app_airbnb/app/data/models/request_token.dart';
import 'package:app_airbnb/app/data/models/user_model.dart';
import 'package:app_airbnb/app/data/repositories/house_repository.dart';
import 'package:app_airbnb/app/data/repositories/local/storage_repository.dart';
import 'package:app_airbnb/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Repositories
  final _userRepository = Get.find<UserRepository>();
  final _storageRepository = Get.find<StorageRepository>();
  final _houseRepository = Get.find<HouseRepository>();

  //Instancias
  RequestToken _oRequestToken = RequestToken();

  //Variables
  List<UserModel> users = [];
  RxString name = RxString("");
  RxString address = RxString("");
  RxInt _isSelectedIndex = RxInt(0);
  RxInt get isSelectedIndex => _isSelectedIndex;
  RxList<HouseModel> houses = RxList<HouseModel>([]);

  @override
  void onInit() {
    _loadStorage();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  selectedIndex(int index) {
    isSelectedIndex.value = index;
  }

  _loadStorage() async {
    _oRequestToken = await _storageRepository.getSession();
    users = await _userRepository.getInformation(
      token: _oRequestToken.requestToken ?? "",
      userId: _oRequestToken.idUser ?? 0,
    );

    name.value = users[0].name ?? "";
    address.value = users[0].address ?? "No tengo dirección";

    _loadHouses();
  }

  _loadHouses() async {
    try {
      houses.value = await _houseRepository.getHouses(
        token: "${_oRequestToken.requestToken}",
      );

      print("Houses: ${houses.length}");
    } catch (e) {
      print(e.toString());
    }
  }
}
