import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _items = {};
  Map<String, CartModel> get items {
    return _items;
  }

  var pesanansemetara = [];

  int get itemcount {
    return _items.length;
  }

  int get totalamount {
    var total = 0;
    _items.forEach((key, cartitem) {
      total += cartitem.price * cartitem.quantity;
    });
    return total;
  }

  void additem(String productid, int price, String title) {
    if (_items.containsKey(productid)) {
      _items.update(
          productid,
          (cartitemada) => CartModel(
              id: cartitemada.id,
              title: cartitemada.title,
              price: cartitemada.price,
              quantity: cartitemada.quantity + 1));
    } else {
      _items.putIfAbsent(
          productid,
          () => CartModel(
              id: productid,
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }


  void removeitem(String productid) {
    _items.remove(productid);
    notifyListeners();
  }

  void remosingleitem(String productid) {
    var value = _items[productid]?.quantity ?? 0;
    if (!_items.containsKey(productid)) {
      return;
    }
    if (value > 1) {
      _items.update(
          productid,
          (cartitemada) => CartModel(
              id: cartitemada.id,
              title: cartitemada.title,
              price: cartitemada.price,
              quantity: cartitemada.quantity - 1));
    }else{
      _items.remove(productid);
    }
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }

  void addIdPesananSementara(String id){
    pesanansemetara.add(id);
    notifyListeners();
  }

  void clearIdPesananSementara(){
    pesanansemetara = [];
    notifyListeners();
  }
}
