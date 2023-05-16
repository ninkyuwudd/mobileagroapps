import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/product_model.dart';
import 'package:mobileagroapps/model/produkmodel.dart';

// import '../model/cart_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProdukModel> _items = [];

  List<ProdukModel> get items {
    return _items;
  }

  Future<void> fetchdataproduct() async {
    final productdata =
        await FirebaseFirestore.instance.collection('produk').get();

    _items = productdata.docs
        .map((doc) => ProdukModel(
            id: doc.id,
            namaproduk: doc["namaproduk"],
            deskripsi: doc["deskripsi"],
            harga: doc["harga"],
            idadmin: doc["idadmin"],
            idjenisproduk: doc["idjenisproduk"],
            jumlah: doc["jumlah"],
            gambar: doc["gambar"]))
        .toList();
    notifyListeners();
  }

  Future<void> filterpupuk() async {
    final productdata = await FirebaseFirestore.instance.collection('produk');
    QuerySnapshot snapshot = await productdata
        .where('idjenisproduk', isEqualTo: "qPGLHnd6lAt4f6a7q7AS")
        .get();
    _items = snapshot.docs
        .map((doc) => ProdukModel(
            id: doc.id,
            namaproduk: doc["namaproduk"],
            deskripsi: doc["deskripsi"],
            harga: doc["harga"],
            idadmin: doc["idadmin"],
            idjenisproduk: doc["idjenisproduk"],
            jumlah: doc["jumlah"],
            gambar: doc["gambar"]))
        .toList();
    notifyListeners();
  }

    Future<void> filterpakan() async {
    final productdata = await FirebaseFirestore.instance.collection('produk');
    QuerySnapshot snapshot = await productdata
        .where('idjenisproduk', isEqualTo: "uuOGJg6bqAgMKc522dFX")
        .get();
    _items = snapshot.docs
        .map((doc) => ProdukModel(
            id: doc.id,
            namaproduk: doc["namaproduk"],
            deskripsi: doc["deskripsi"],
            harga: doc["harga"],
            idadmin: doc["idadmin"],
            idjenisproduk: doc["idjenisproduk"],
            jumlah: doc["jumlah"],
            gambar: doc["gambar"]))
        .toList();
    notifyListeners();
  }

  ProdukModel finbyid(String id) {
    print("idnya : $id");
    return _items.firstWhere((prod) => prod.id == id);
  }

  void additem(String title, int price, String description, String image) {
    final newitemdata = Product(
        id: DateTime.now().millisecond.toString(),
        title: title,
        description: description,
        price: price,
        image: image);
    // _items.add(newitemdata);
    notifyListeners();
  }

  void hapus(int index) {
    print("manggil hapus");
    _items.removeAt(index);
    notifyListeners();
  }
}
