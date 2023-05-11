import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/product_model.dart';

// import '../model/cart_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: "Pupuk Kandang nomor satu di jagat raya",
        description:
            "Ini adalah pupuk kandang ori dari lampung,harga perkilo yagesyak ",
        price: 3000,
        image:
            "https://tse1.mm.bing.net/th?id=OIP.ZlpdscivWEuu-Q-J8qQGsgHaE9&pid=Api&P=0"),
    Product(
        id: 'p2',
        title: "Pupuk Kimia",
        description: "ini adalah pupuk kimia untuk buah naga",
        price: 5000,
        image:
            "https://belajartani.com/wp-content/uploads/2016/09/urea-bersusidi.jpg")
  ];

  List<Product> get items {
    return _items;
  }

  void fetchdataproduct() async {
    QuerySnapshot<Map<String, dynamic>> productdata =
        await FirebaseFirestore.instance.collection('product').get();

    _items = productdata.docs
        .map((doc) => Product(
            id: doc.id,
            title: doc.data()["title"],
            description: doc.data()["description"],
            price: doc.data()["price"],
            image: ""))
        .toList();
        notifyListeners();
  }

  Product finbyid(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void additem(String title, int price, String description, String image) {
    final newitemdata = Product(
        id: DateTime.now().millisecond.toString(),
        title: title,
        description: description,
        price: price,
        image: image);
    _items.add(newitemdata);
    notifyListeners();
  }

  void hapus(int index) {
    print("manggil hapus");
    _items.removeAt(index);
    notifyListeners();
  }
}
