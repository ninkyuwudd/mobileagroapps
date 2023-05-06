import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/order_model.dart';

import '../model/cart_model.dart';

class Orderproivder with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get Order {
    return _orders;
  }

  void addorder(List<CartModel> cartproduct, double total) {
    _orders.insert(
        0,
        OrderModel(
            id: DateTime.now().millisecond.toString(),
            jumlah: total,
            product: cartproduct,
            dateTime: DateTime.now()));
            notifyListeners();
  }
}
