import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/controller/toko_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/screen/shop/unggah_gambar.dart';
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
    var loaduser = Provider.of<UserProvider>(context, listen: false);
    var getuser = loaduser.akun;
    var getidx = ModalRoute.of(context)?.settings.arguments as int;
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
                Navigator.pushNamed(context, UnggahGambar.routename,arguments:getuser[getidx].toko );
              },
              icon: Icon(
                Icons.add,
              )),
        ],
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
