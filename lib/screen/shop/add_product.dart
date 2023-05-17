import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/pilihfile_controller.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
import 'package:mobileagroapps/widget/shop/user_product_item.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  // const AddProductPage({super.key});

  static const routename = "/addproduk";

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  FirebaseStorage firebaseFirestore = FirebaseStorage.instance;

  Future<List> loadimage() async {
    List<Map> files = [];
    final ListResult result = await firebaseFirestore.ref('file/').listAll();
    final List<Reference> allfiles = result.items;
    await Future.forEach(allfiles, (Reference file) async {
      final String fileurl = await file.getDownloadURL();
      final String bckurl = file.name;
      // final forestRef = firebaseFirestore.ref('folderbaru/${widget.usr_Login}/');
      final metadata = await file.getMetadata();
      final sizenya = metadata.size;

      final timenya = metadata.timeCreated.toString();
// Get metadata properties

      files.add({
        "url": fileurl,
        "path": file.fullPath,
        "name": bckurl,
        "size": sizenya,
        "date": timenya
      });
    });
    print(files);
    return files;
  }

  var nama = TextEditingController();

  var deskripsi = TextEditingController();

  var harga = TextEditingController();

  var gambar = TextEditingController();

  bool cknama = false;

  bool ckdeskripsi = false;

  bool ckharga = false;

  bool ckgambar = false;
  var gambarproduk;

  @override
  Widget build(BuildContext context) {
    var loadproduk = Provider.of<ProductProvider>(context);
    var pilihfile = Provider.of<PilihUploadfile>(context);

    void _show(BuildContext ctx) {
      showModalBottomSheet(
          isScrollControlled: true,
          elevation: 10,
          // backgroundColor: Colors.amber,
          context: ctx,
          builder: (ctx) => Container(
                height: MediaQuery.of(context).size.height - 100,
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Tambah Barang",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    // RoundeValueFieldWhiteValue(
                    //     control: gambar,
                    //     title: "Gambar",
                    //     hover: "isi gambar",
                    //     check: ckgambar),
                    Row(
                      children: [
                        Container(
                            child: gambarproduk == null
                                ? CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/bebek@4x.png"),
                                    radius: 70,
                                  )
                                : CircleAvatar(
                                    foregroundImage:
                                        FileImage(File(gambarproduk)),
                                    radius: 70,
                                  )),
                        TextButton(
                            onPressed: () {
                              pilihfile.selectFile();
                              pilihfile.uploadfile;
                              print(pilihfile.pickfile);
                              setState(() {
                                gambarproduk = pilihfile.pickfile!.path!;
                              });
                            },
                            child: Text("Upload Gambar"))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                        future: loadimage(),
                        builder: (context, AsyncSnapshot snapshot) {
                          final Map file = snapshot.data![snapshot.data.length];
                          for(var i = 0; i < snapshot.data.length; i++){
                            final Map file = snapshot.data![i];
                            String getimg = pilihfile.pickfile!.name;
                            if (snapshot.hasData && getimg == file['url'] ) {
                            return ElevatedButton(
                                onPressed: () {
                                  pilihfile.uploadfile();
                                  // loadproduk.additem(nama.text, int.parse(harga.text),
                                  //     deskripsi.text, url);
                                  
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Submit Data Successfully',
                                        textAlign: TextAlign.center,
                                      ),
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 2),
                                      // action: SnackBarAction(label: "UNDO", onPressed: (){
                                      //   cart.removeSingleItem(product.id);
                                      // }),
                                    ),
                                  );
                                },
                                child: Text("Tambah"));
                                
                          } 
                          }
                          return CircularProgressIndicator();
                        }),
                  ],
                ),
              ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Produk"),
        actions: [
          IconButton(
              onPressed: () {
                _show(context);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: loadproduk.items.length,
            itemBuilder: (_, i) => Column(children: [
                  // UserProductItem(
                  //     idx: i,
                  //     title: loadproduk.items[i].title,
                  //     imageurl: loadproduk.items[i].image),
                  Divider()
                ])),
      ),
    );
  }
}
