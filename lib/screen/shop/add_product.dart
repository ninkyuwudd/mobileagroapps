import 'package:flutter/material.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
import 'package:mobileagroapps/widget/shop/user_product_item.dart';
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
                      Text("Tambah Barang",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
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
                          control: gambar,
                          title: "Gambar",
                          hover: "isi gambar",
                          check: ckgambar),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            loadproduk.additem(nama.text, int.parse(harga.text),
                                deskripsi.text, gambar.text);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
                          child: Text("Tambah")),
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
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.builder(
                shrinkWrap: true,
                itemCount: loadproduk.items.length,
                itemBuilder: (_, i) => Column(children: [
                      UserProductItem(
                        idx : i,
                          title: loadproduk.items[i].title,
                          imageurl: loadproduk.items[i].image),
                      Divider()
                    ])),
      ),
      
      
    );
  }
}
