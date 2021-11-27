import 'dart:convert';

import 'package:app_airbnb/app/core/config/config.dart';
import 'package:app_airbnb/app/data/models/reservation_model.dart';
import 'package:dio/dio.dart';

class ReservationProvider {
  Future<String> saveReservation({
    required String token,
    required ReservationModel reservationModel,
  }) async {
    final _dio = Dio();
    final _response = await _dio.post(
      kBaseUrl + "/api/reservation/register",
      options: Options(
        headers: {
          "auth": token,
        },
      ),
      data: json.encode(reservationModel.toJson()),
    );

    return _response.data["message"];
  }
}
