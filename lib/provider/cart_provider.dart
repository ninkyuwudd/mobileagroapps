import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _items = {};
  Map<String, CartModel> get items {
    return _items;
  }

  
}