class ReservationModel {
  ReservationModel({
    this.id,
    this.idUser,
    this.idHouse,
    this.date,
    this.price,
    this.status,
  });

  int? id;
  int? idUser;
  int? idHouse;
  String? date;
  int? price;
  bool? status;

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      ReservationModel(
        id: json["id"],
        idUser: json["idUser"],
        idHouse: json["idHouse"],
        date: json["date"],
        price: json["price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idUser": idUser,
        "idHouse": idHouse,
        "date": date,
        "price": price,
        "status": status,
      };
}
