import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/order_model.dart';

import '../model/cart_model.dart';

class Orderproivder with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get Order {
    return _orders;
  }

  void fetchdataorder() async {
    QuerySnapshot<Map<String, dynamic>> orderdata =
        await FirebaseFirestore.instance.collection('order').get();
    _orders = orderdata.docs
        .map((doc) => OrderModel(
            id: doc.id,
            jumlah: doc.data()["jumlah"],
            product: doc.data()["product"],
            dateTime: doc.data()["datetime"]))
        .toList();
    notifyListeners();
  }

  void clear(){
    _orders = [];
    notifyListeners();
  }

  void addorder(List<CartModel> cartproduct, int total) {
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
