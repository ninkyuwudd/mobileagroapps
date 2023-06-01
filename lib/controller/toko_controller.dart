import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/toko_model.dart';

class TokoController with ChangeNotifier {
  List<TokoModel> _items = [];
  List<TokoModel> get items {
    return _items;
  }
  String curtokoid = "";

  String nama = "";
  String alamat = "";
  String imgurl = "";

  void clear(){
    _items = [];
    notifyListeners();
  }


  Future<void> getdatatoko() async {
    final tokodata = await FirebaseFirestore.instance.collection('toko').get();

    _items = tokodata.docs
        .map((doc) => TokoModel(
            id: doc.id,
            namatoko: doc.data()["namatoko"],
            email: doc.data()["email"],
            nomorhp: doc.data()["nomorhp"],
            alamat: doc.data()["alamat"],
            gambar: doc.data()["gambar"]))
        .toList();
    notifyListeners();
  }


    Future<void> getmydatatoko(String idnya) async {
    final tokodata = await FirebaseFirestore.instance.collection('toko').where("id",isEqualTo: idnya).get();

    _items = tokodata.docs
        .map((doc) => TokoModel(
            id: doc.id,
            namatoko: doc.data()["namatoko"],
            email: doc.data()["email"],
            nomorhp: doc.data()["nomorhp"],
            alamat: doc.data()["alamat"],
            gambar: doc.data()["gambar"]))
        .toList();
    notifyListeners();
  }


  changedataid(String id){
    curtokoid = id;
    notifyListeners();
  }

  TokoModel finbyid(String id) {
    print("idnya : $id");
    final founditm = _items.firstWhere((toko) => toko.id == id);
    return founditm;
  }


  Future<void> fetchdatabyid(String id) async {
    try{
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('toko').doc(id).get();

      Map<String,dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;

      if(data != null){
        nama = data['namatoko'];
        alamat = data['alamat'];
        imgurl = data['gambar'];
        notifyListeners();
      }     
    }catch(e){
        print("error $e");
    }
  }
}
