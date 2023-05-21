import 'package:flutter/foundation.dart';

class TokoModel with ChangeNotifier {
  final String id;
  final String namatoko;
  final String email;
  final String nomorhp;
  final String alamat;
  final String gambar;

  TokoModel({
    required this.id,
    required this.namatoko,
    required this.email,
    required this.nomorhp,
    required this.alamat,
    required this.gambar
  });

  factory TokoModel.fromJson(Map<String, dynamic> json) => TokoModel(
      id: json["id"],
      namatoko: json["namatoko"],
      email: json["email"],
      nomorhp: json["nomorhp"],
      alamat: json["alamat"],
      gambar: json['gambar']
      );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "namatoko" : namatoko,
    "email" : email,
    "nomorhp" : nomorhp,
    "alamat" : alamat,
    "gambar" : gambar
  };


}
