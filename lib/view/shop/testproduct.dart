import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileagroapps/controller/pilihfile_controller.dart';
import 'package:mobileagroapps/controller/toko_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/widget/common_snackbar.dart';
import 'package:mobileagroapps/widget/popup_warning.dart';
import 'package:mobileagroapps/widget/rounded_value_filed_intcek.dart';
import 'package:provider/provider.dart';
import '../../widget/rounded_value_field.dart';

enum jenisproduk { pupuk, pakan }

class ProductView extends StatefulWidget {
  final String idtoko;
  final String namagambar;

  ProductView({required this.namagambar, required this.idtoko});

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

  Future<void> getImageurl() async {
    String get = "file/${widget.namagambar}";
    Reference storageReference = storage.ref().child(get);
    imageurl = await storageReference.getDownloadURL();
    setState(() {});
  }

  var nama = TextEditingController();

  var deskripsi = TextEditingController();

  var harga = TextEditingController();

  var gambar = TextEditingController();
  var jumlah = TextEditingController();

  bool cknama = false;

  bool ckdeskripsi = false;

  bool ckharga = false;
  bool ckintharga = false;

  bool ckjumlah = false;
  bool ckintjumlah = false;

  jenisproduk? _character = jenisproduk.pupuk;

  void loadingcontent() async {
    CircularProgressIndicator();
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      Navigator.pop(context);
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Submit Data Successfully',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var records = FirebaseFirestore.instance.collection("produk");
    var usrdata = Provider.of<UserProvider>(context);
    var loadtoko = Provider.of<TokoController>(context);
    var loadpickfile = Provider.of<PilihUploadfile>(context);

    getImageurl();
    // var loadproduk = Provider.of<ProductProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Tambah Barang"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                // Text(
                //   "Tambah Barang",
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  height: 10,
                ),
                RoundeValueFieldWhiteValue(
                    fungsi: (value) {
                      print(value);
                      if (value == "") {
                        setState(() {
                          cknama = true;
                        });
                      } else {
                        setState(() {
                          cknama = false;
                        });
                      }
                    },
                    control: nama,
                    title: "Nama Barang",
                    hover: "Isi nama barang",
                    check: cknama),
                RoundeValueFieldWhiteValue(
                    fungsi: (value) {
                      print(value);
                      if (value == "") {
                        setState(() {
                          ckdeskripsi = true;
                        });
                      } else {
                        setState(() {
                          ckdeskripsi = false;
                        });
                      }
                    },
                    control: deskripsi,
                    title: "Deskripsi",
                    hover: "isi deskripsi",
                    check: ckdeskripsi),
                RoundeValueFieldWhiteValueIntcek(
                    fungsi: (value) {
                      if (value != "" && int.tryParse(value) == null) {
                        print("salah input");
                        setState(() {
                          ckintharga = true;
                          ckharga = false;
                        });
                      } else if (value == "") {
                        print("kosong");
                        setState(() {
                          ckintharga = false;
                          ckharga = true;
                        });
                      } else {
                        print("oke");
                        setState(() {
                          ckintharga = false;
                          ckharga = false;
                        });
                      }
                    },
                    control: harga,
                    checkInt: ckintharga,
                    title: "Harga",
                    hover: "isi harga",
                    check: ckharga),
                RoundeValueFieldWhiteValueIntcek(
                    fungsi: (value) {
                      if (value != "" && int.tryParse(value) == null) {
                        print("salah input");
                        setState(() {
                          ckintjumlah = true;
                          ckjumlah = false;
                        });
                      } else if (value == "") {
                        print("kosong");
                        setState(() {
                          ckintjumlah = false;
                          ckjumlah = true;
                        });
                      } else {
                        print("oke");
                        setState(() {
                          ckintjumlah = false;
                          ckjumlah = false;
                        });
                      }
                    },
                    control: jumlah,
                    checkInt: ckintjumlah,
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
                            print(value);
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (nama.text.isEmpty ||
                              deskripsi.text.isEmpty ||
                              harga.text.isEmpty ||
                              jumlah.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) => PopupWarning(
                                    pesan: "Mohon isi semua data"));
                          } else {
                            getImageurl();
                            print(imageurl);
                            String value =
                                _character.toString().split('.').last;
                            String idjenis = "";
                            if (value == "pakan") {
                              idjenis = "uuOGJg6bqAgMKc522dFX";
                            } else {
                              idjenis = "qPGLHnd6lAt4f6a7q7AS";
                            }
                            String id = DateTime.now()
                                .millisecondsSinceEpoch
                                .toString();

                            records.doc().set({
                              "namaproduk": nama.text,
                              "deskripsi": deskripsi.text,
                              "harga": int.parse(harga.text),
                              "idtoko": widget.idtoko,
                              "idjenisproduk": idjenis,
                              "jumlah": int.parse(jumlah.text),
                              "gambar": imageurl,
                            });
                            // CommonSnackbar();

                            loadingcontent();
                            loadpickfile.clear();
                          }
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