import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final int price;
  final String image;
  final String idjenisproudk;
  final String idtoko;
  final int jumlah;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.idjenisproudk, required this.idtoko,
    required this.jumlah
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        idjenisproudk: json["idjenisproduk"],
        idtoko: json["idtoko"],
        jumlah: json["jumlah"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "image": image,
        "idjenisproduk" : idjenisproudk,
        "idtoko" : idtoko,
        "jumlah" : jumlah
    };

}