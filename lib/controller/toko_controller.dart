import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/toko_model.dart';

class TokoController with ChangeNotifier {
  List<TokoModel> _items = [];
  List<TokoModel> get items {
    return _items;
  }

  Future<void> getdatatoko() async {
    final tokodata = await FirebaseFirestore.instance.collection('toko').get();

    _items = tokodata.docs
        .map((doc) => TokoModel(
            id: doc.id,
            namatoko: doc["namatoko"],
            email: doc["email"],
            nomorhp: doc["nomorhp"],
            alamat: doc["alamat"],
            gambar: doc["gambar"]))
        .toList();
    notifyListeners();
  }
}
