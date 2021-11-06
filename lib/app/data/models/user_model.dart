class UserModel {
  UserModel({
    this.idUser,
    this.name,
    this.lastname,
    this.address,
    this.email,
    this.password,
  });

  int? idUser;
  String? name;
  String? lastname;
  String? address;
  String? email;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["idUser"],
        name: json["name"],
        lastname: json["lastname"],
        address: json["address"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "name": name,
        "lastname": lastname,
        "address": address,
        "email": email,
        "password": password,
      };
}
