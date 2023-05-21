import 'package:flutter/foundation.dart';

class ProdukModel with ChangeNotifier {
  final String id;
  final String namaproduk;
  final String deskripsi;
  final int harga;
  final String idtoko;
  final String idjenisproduk;
  final int jumlah;
  final String gambar;
  bool jnspupuk;


  ProdukModel({
    required this.id,
    required this.namaproduk,
    required this.deskripsi,
    required this.harga,
    required this.idtoko,
    required this.idjenisproduk,
    required this.jumlah,
    required this.gambar,
    this.jnspupuk = false,
  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) => ProdukModel(
        id: json["id"],
        namaproduk: json["namaproduk"],
        deskripsi: json["deskripsi"],
        harga: json["harga"],
        idtoko: json["idtoko"],
        idjenisproduk: json["idjenisproduk"],
        jumlah: json["jumlah"],
        gambar: json["gambar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "namaproduk": namaproduk,
        "deskripsi": deskripsi,
        "harga": harga,
        "idtoko" : idtoko,
        "idjenisproduk" : idjenisproduk,
        "jumlah" : jumlah,
        "gambar": gambar,
    };



}