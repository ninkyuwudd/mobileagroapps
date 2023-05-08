import 'package:flutter/material.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
import 'package:provider/provider.dart';



class AddProductPage extends StatelessWidget {
  // const AddProductPage({super.key});

  static const routename = "/addproduk";

  var nama = TextEditingController();
  var deskripsi = TextEditingController();
  var harga = TextEditingController();
  var gambar = TextEditingController();


  bool cknama = false;
  bool ckdeskripsi = false;
  bool ckharga = false;
  bool ckgambar = false;

  @override
  Widget build(BuildContext context) {
    var loadproduk = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Produk"),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              RoundeValueFieldWhiteValue(control:nama , title: "Nama Barang", hover: "Isi nama barang", check: cknama),
              RoundeValueFieldWhiteValue(control: deskripsi, title: "Deskripsi", hover: "isi deskripsi", check: ckdeskripsi),
              RoundeValueFieldWhiteValue(control: harga, title: "Harga", hover: "isi harga", check: ckharga),
              RoundeValueFieldWhiteValue(control: gambar, title: "Gambar", hover: "isi gambar", check: ckgambar),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                loadproduk.additem(nama.text,int.parse(harga.text), deskripsi.text, gambar.text);
              }, child: Text("Tambah"))
            ],
          ),
        ),
      ),
    );
    
  }
}