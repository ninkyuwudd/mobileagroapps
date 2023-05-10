import 'package:mobileagroapps/model/cart_model.dart';


class OrderModel {
  final String id;
  final int jumlah;
  final List<CartModel> product;
  final DateTime dateTime;

  OrderModel({
    required this.id,
    required this.jumlah,
    required this.product,
    required this.dateTime
  });

    factory OrderModel.fromJson(Map<String, dynamic> json) =>
      OrderModel(id: json["id"], jumlah: json["jumlah"],product: json["product"],dateTime: json["datetime"]);

  Map<String,dynamic> toJson() => {
    "id" : id,
    "jumlah" : jumlah,
    "product" : product,
    "datetime" : dateTime

  };
}