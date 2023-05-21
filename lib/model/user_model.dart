// import 'dart:convert';

// UsersAkun usersAUsersAkunFromJson(String str) => UsersAkun.fromJson(json.decode(str));

// String usersAUsersAkunToJson(UsersAkun data) => json.encode(data.toJson());

class UsersAkun {
  final String? id;
  final String? nama;
  final String? username;
  final String? email;
  final String? gender;
  final String? phone;
  final String? password;
  final String? status;
  final String? lokasi;
  final String? toko;

  UsersAkun({
    this.id,
    required this.nama,
    required this.username,
    required this.email,
    required this.gender,
    required this.phone,
    required this.password,
    required this.status,
    required this.lokasi,
    required this.toko
  });

  factory UsersAkun.fromJson(Map<String, dynamic> json) => UsersAkun(
      id: json["id"],
      nama: json['nama'],
      username: json['username'],
      email: json['email'],
      gender: json["gender"],
      phone: json["phone"],
      password: json["password"],
      status: json["status"],
      lokasi: json["lokasi"],
      toko: json["toko"]
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "username": username,
        "email": email,
        "gender": gender,
        "phone": phone,
        "password": password,
        "status": status,
        "lokasi" : lokasi,
        "toko" : toko
      };
}

class UserLocList {
  final String id;
  final String lokasi;

  UserLocList({required this.id, required this.lokasi});

  factory UserLocList.fromJson(Map<String, dynamic> json) =>
      UserLocList(id: json["id"], lokasi: json["lokasi"]);

  Map<String,dynamic> toJson() => {
    "lokasi" : lokasi
  };
}
