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

  List<ProdukModel> jumlahProduk = [];

  var setfilter;

  gantifilter(String filter){
    setfilter = filter;
    notifyListeners();
  }

  void clear(){
    _items = [];
    notifyListeners();
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
            idjenisproduk: doc["idjenisproduk"],
            idtoko: doc["idtoko"],
            jumlah: doc["jumlah"],
            gambar: doc["gambar"]))
        .toList();
    notifyListeners();
  }

  Future<void> updateDataProduct(String id,String namaproduk,int harga,String deskripsi,int jumlah) async{
        try{
                  final productdata =
        await FirebaseFirestore.instance.collection('produk');
        productdata.doc(id).update({
          "namaproduk" : namaproduk,
          "harga" : harga,
          "deskripsi" : deskripsi,
          "jumlah" : jumlah
        });

        }catch(e){
          print(e);
        }
  }

    Future<void> updateDataStok(String id,int jumlah) async{
        try{
                  final productdata =
        await FirebaseFirestore.instance.collection('produk');
        productdata.doc(id).update({
          "jumlah" : jumlah
        });

        }catch(e){
          print(e);
        }
  }

    Future<void> fetchdataproductsendiri(String iduser) async {
    final productdata =
        await FirebaseFirestore.instance.collection('produk').where('idtoko',isNotEqualTo: iduser).get();

    _items = productdata.docs
        .map((doc) => ProdukModel(
            id: doc.id,
            namaproduk: doc["namaproduk"],
            deskripsi: doc["deskripsi"],
            harga: doc["harga"],
            idjenisproduk: doc["idjenisproduk"],
            idtoko: doc["idtoko"],
            jumlah: doc["jumlah"],
            gambar: doc["gambar"]))
        .toList();
    notifyListeners();
  }

  Future<void> filterpupuk(String idtoko) async {
    final productdata = await FirebaseFirestore.instance.collection('produk').where("idtoko",isNotEqualTo: idtoko).where('idjenisproduk', isEqualTo: "qPGLHnd6lAt4f6a7q7AS")
        .get();

    _items = productdata.docs
        .map((doc) => ProdukModel(
            id: doc.id,
            namaproduk: doc["namaproduk"],
            deskripsi: doc["deskripsi"],
            harga: doc["harga"],
            idtoko: doc["idtoko"],
            idjenisproduk: doc["idjenisproduk"],
            jumlah: doc["jumlah"],
            gambar: doc["gambar"]))
        .toList();
    notifyListeners();
  }

  Future<void> filterpakan(String idtoko) async {
    final productdata = await FirebaseFirestore.instance.collection('produk').where("idtoko",isNotEqualTo: idtoko).where('idjenisproduk', isEqualTo: "uuOGJg6bqAgMKc522dFX")
        .get();

    _items = productdata.docs
        .map((doc) => ProdukModel(
            id: doc.id,
            namaproduk: doc["namaproduk"],
            deskripsi: doc["deskripsi"],
            harga: doc["harga"],
            idtoko: doc["idtoko"],
            idjenisproduk: doc["idjenisproduk"],
            jumlah: doc["jumlah"],
            gambar: doc["gambar"]))
        .toList();
    notifyListeners();
  }

  Future<void> filtertprodukoko(String idtoko) async {
    final productdata = await FirebaseFirestore.instance.collection('produk').where('idtoko', isNotEqualTo:idtoko)
        .get();
    _items = productdata.docs
        .map((doc) => ProdukModel(
            id: doc.id,
            namaproduk: doc["namaproduk"],
            deskripsi: doc["deskripsi"],
            harga: doc["harga"],
            idtoko: doc["idtoko"],
            idjenisproduk: doc["idjenisproduk"],
            jumlah: doc["jumlah"],
            gambar: doc["gambar"]))
        .toList();
    notifyListeners();
  }


    Future<void> filtertoko(String idtoko) async {
    final productdata = await FirebaseFirestore.instance.collection('produk').where('idtoko', isEqualTo:idtoko)
        .get();
    _items = productdata.docs
        .map((doc) => ProdukModel(
            id: doc.id,
            namaproduk: doc["namaproduk"],
            deskripsi: doc["deskripsi"],
            harga: doc["harga"],
            idtoko: doc["idtoko"],
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

  void additem(String title, int price, String description, String image, String idjenisproduk,String idtoko,int jumlah) {
    final newitemdata = Product(
        id: DateTime.now().millisecond.toString(),
        title: title,
        description: description,
        price: price,
        image: image,
        idjenisproudk: idjenisproduk,
        idtoko: idtoko,
        jumlah: jumlah
        );
    // _items.add(newitemdata);
    notifyListeners();
  }

  // void deleteitem()async{

  //   await productdata.
  
  // }

  Future<void> deleteitem(String id)async{
    try{
      final FirebaseFirestore productdata = await FirebaseFirestore.instance;
      final DocumentReference documentReference = productdata.collection('produk').doc(id);
      await documentReference.delete();
      print("produk berhasil dihapus");
    }catch(e){
      print("produk gagal dihapus");
    }
  }

  void hapus(int index) {
    print("manggil hapus");
    _items.removeAt(index);
    notifyListeners();
  }
}
