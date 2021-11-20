import 'package:app_airbnb/app/core/config/config.dart';
import 'package:app_airbnb/app/data/models/house_model.dart';
import 'package:dio/dio.dart';

class HouseProvider {
  Future<List<HouseModel>> getHouses({
    required String token,
  }) async {
    final dio = Dio();
    final response = await dio.get(
      "$kBaseUrl/api/house/houses/1/6",
      options: Options(
        headers: {"auth": token},
      ),
    );
    return (response.data["result"] as List)
        .map((json) => HouseModel.fromJson(json))
        .toList();
  }
}
