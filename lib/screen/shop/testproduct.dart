import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/produkmodel.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/controller/user_repo.dart';
import 'package:mobileagroapps/widget/common_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../model/product_model.dart';
import '../../widget/rounded_value_field.dart';

enum jenisproduk { pupuk, pakan }

class ProductView extends StatefulWidget {

  final String namagambar;


  ProductView({required this.namagambar});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
FirebaseStorage storage = FirebaseStorage.instance;
String imageurl = "";
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getImageurl() async{
    String get ="file/${widget.namagambar}";
    Reference storageReference = storage.ref().child(get);
    imageurl = await storageReference.getDownloadURL();
    setState(() {
      
    });
  }

      var nama = TextEditingController();

    var deskripsi = TextEditingController();

    var harga = TextEditingController();

    var gambar = TextEditingController();
    var jumlah = TextEditingController();

    bool cknama = false;

    bool ckdeskripsi = false;

    bool ckharga = false;

    bool ckjumlah = false;

  jenisproduk? _character = jenisproduk.pupuk;

  @override
  Widget build(BuildContext context) {
    getImageurl();
    var records = FirebaseFirestore.instance.collection("produk");
    var usrdata = Provider.of<UserProvider>(context);
    // var loadproduk = Provider.of<ProductProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Tambah Barang",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                RoundeValueFieldWhiteValue(
                    control: nama,
                    title: "Nama Barang",
                    hover: "Isi nama barang",
                    check: cknama),
                RoundeValueFieldWhiteValue(
                    control: deskripsi,
                    title: "Deskripsi",
                    hover: "isi deskripsi",
                    check: ckdeskripsi),
                RoundeValueFieldWhiteValue(
                    control: harga,
                    title: "Harga",
                    hover: "isi harga",
                    check: ckharga),
                RoundeValueFieldWhiteValue(
                    control: jumlah,
                    title: "Jumlah",
                    hover: "isi jumlah",
                    check: ckjumlah),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Pakan'),
                      leading: Radio<jenisproduk>(
                        activeColor: Colors.green,
                        value: jenisproduk.pakan,
                        groupValue: _character,
                        onChanged: (jenisproduk? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Pupuk'),
                      leading: Radio<jenisproduk>(
                        activeColor: Colors.green,
                        value: jenisproduk.pupuk,
                        groupValue: _character,
                        onChanged: (jenisproduk? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print(imageurl);
                          String value = _character.toString().split('.').last;
                          String idjenis = "";
                          if (value == "pakan") {
                            idjenis = "qPGLHnd6lAt4f6a7q7AS";
                          } else {
                            idjenis = "qPGLHnd6lAt4f6a7q7AS";
                          }
                          String id =
                              DateTime.now().millisecondsSinceEpoch.toString();
        
                          records.doc().set({
                            "namaproduk": nama.text,
                            "deskripsi": deskripsi.text,
                            "harga": int.parse(harga.text),
                            "idadmin": usrdata.curuserid,
                            "idjenisproduk": idjenis,
                            "jumlah": int.parse(jumlah.text),
                            "gambar": imageurl,
                          });
                          CommonSnackbar();
                          Navigator.pop(context);
                        },
                        child: Text("Unggah Produk"))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}







//   List<ProdukModel> produkitem = [];
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchrecord();
//   }

//   fetchrecord() async {
//     var records = await  FirebaseFirestore.instance.collection("produk").get();
//     maprecord(records);
//   }

//   maprecord(QuerySnapshot<Map<String, dynamic>> productdata){
//        var _items = productdata.docs
//         .map((doc) => ProdukModel(
//           id: doc.id,
//           namaproduk: doc.data()["namaproduk"],
//           deskripsi: doc.data()["deskripsi"],
//           harga: doc.data()["harga"],
//           idadmin: doc.data()["idadmin"],
//           idjenisproduk: doc.data()["idjenisproduk"],
//           jumlah: doc.data()["jumlah"],
//           gambar: doc.data()["gambar"]
//           ))
//         .toList();
//         setState(() {
//           produkitem = _items;
//         });
//   }