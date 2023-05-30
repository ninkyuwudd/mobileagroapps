import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/controller/toko_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/view/shop/edit_produk_view.dart';
import 'package:mobileagroapps/view/shop/unggah_gambar.dart';
import 'package:mobileagroapps/widget/popup_warning.dart';
import 'package:mobileagroapps/widget/popup_widget.dart';
import 'package:provider/provider.dart';

class ListProdukView extends StatefulWidget {
  static const routename = "/listproduk";
  const ListProdukView({super.key});

  @override
  State<ListProdukView> createState() => _ListProdukViewState();
}

class _ListProdukViewState extends State<ListProdukView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var loaduser = Provider.of<UserProvider>(context, listen: false);
    loaduser.fethcdatauser();
    var getuser = loaduser.akun;
    Provider.of<UserProvider>(context, listen: false).fethcdatauser();
    // var getidx = ModalRoute.of(context)?.settings.arguments as int;
    // Provider.of<ProductProvider>(context,listen: false).filtertoko(getuser[getidx].toko.toString());
    Future.delayed(Duration.zero, () {
      var getidx = ModalRoute.of(context)?.settings.arguments as int;
      Provider.of<ProductProvider>(context, listen: false)
          .filtertoko(getuser[getidx].toko.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var getidx = ModalRoute.of(context)?.settings.arguments as int;

    var loaduser = Provider.of<UserProvider>(context);
    var getuser = loaduser.akun;

    var getidxtoko = ModalRoute.of(context)?.settings.arguments as int;
    var loadproduk = Provider.of<ProductProvider>(context);
    var getproduk = loadproduk.items;

    var loadtoko = Provider.of<TokoController>(context);
    var gettoko = loadtoko.items;

    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar Produk Anda"),
          actions: [
            IconButton(
                onPressed: () {
                  if (getproduk.length > 3 &&
                      getuser[getidx].status == "premium") {
                    Navigator.pushNamed(context, UnggahGambar.routename,
                        arguments: getuser[getidxtoko].toko);
                  } else if (getproduk.length <= 3) {
                    Navigator.pushNamed(context, UnggahGambar.routename,
                        arguments: getuser[getidxtoko].toko);
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return PopupWarning(pesan: "upgrade premium untuk unggah lebih banyak produk");
                        });
                  }
                },
                icon: Icon(
                  Icons.add,
                )),
          ],
        ),
        body: ListView.builder(
            itemCount: getproduk.length,
            itemBuilder: (ctx, idx) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditProdukView.routename,
                      arguments: getproduk[idx].id);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(18, 0, 0, 0),
                            blurRadius: 2,
                            spreadRadius: 4)
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(getproduk[idx].gambar),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: Text(getproduk[idx].namaproduk),
                          trailing: Icon(Icons.edit),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
