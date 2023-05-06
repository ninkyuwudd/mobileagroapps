import 'package:mobileagroapps/model/cart_model.dart';


class OrderModel {
  final String id;
  final double jumlah;
  final List<CartModel> product;
  final DateTime dateTime;

  OrderModel({
    required this.id,
    required this.jumlah,
    required this.product,
    required this.dateTime
  });


}