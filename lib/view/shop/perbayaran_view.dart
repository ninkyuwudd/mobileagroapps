import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/controller/toko_controller.dart';
import 'package:mobileagroapps/view/shop/menunggu_pembayaran.dart';
import 'package:mobileagroapps/widget/rounded_button_gree.dart';
import 'package:mobileagroapps/widget/tombolrounded_widget.dart';
import 'package:provider/provider.dart';

import '../../controller/keranjang_controller.dart';
import '../../controller/order_controller.dart';
import '../../controller/user_controller.dart';
import '../../widget/shop/cart_item.dart';

class Pembayaran extends StatefulWidget {
  static const routename = "/pembayaran";

  // const Pembayaran({super.key});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  final dborder = FirebaseFirestore.instance.collection("order");

  final dbproduk = FirebaseFirestore.instance.collection('produk');

  final dbcustomer = FirebaseFirestore.instance.collection("users");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<ProductProvider>(context, listen: false).fetchdataproduct();
  }

  @override
  Widget build(BuildContext context) {
    final loadproduk = Provider.of<ProductProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    final getcart = cart.items;
    final loaduser = Provider.of<UserProvider>(context);
    loaduser.fethcdatauser;
    final data = ModalRoute.of(context)?.settings.arguments as int;
    final loadtoko = Provider.of<TokoController>(context);
    

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text("Pembayaran"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(58, 0, 0, 0),
                blurRadius: 2,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Jenis Transaksi"),
                      Spacer(),
                      Text("Transfer bank")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Nomor HP"),
                      Spacer(),
                      Text(loadtoko.nomorhp)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Nama Bank"), Spacer(), Text("BRI")],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Nomor Rekening"),
                      Spacer(),
                      Text("12345654567890")
                    ],
                  ),
                  Divider(),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text("Total Pembayaran"),
                        Text(
                          "Rp$data",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Divider(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            RoundedButtonGreen(
                fungsi: () {
                  for (var x = 0; x < cart.items.length; x++) {
                    int jumlahPerbarang =
                        cart.items.values.toList()[x].quantity;

                    var produkdata =
                        loadproduk.finbyid(cart.pesanansemetara[x]);
                    print(
                        "produk ${produkdata.namaproduk}, jumlah :${produkdata.jumlah}");

                    loadproduk.updateDataStok(cart.items.values.toList()[x].id,
                        produkdata.jumlah - jumlahPerbarang);
                    print(
                        "produk ${produkdata.namaproduk}, jumlah :${produkdata.jumlah}");
                  }
                  dborder.doc().set({
                    "idcustomer": loaduser.curuserid,
                    "idproduk": cart.items.keys.toList(),
                    "date": DateFormat.yMMMd().format(DateTime.now())
                  });
                  Provider.of<Orderproivder>(context, listen: false)
                      .addorder(cart.items.values.toList(), cart.totalamount);
                  cart.clear();
                  cart.clearIdPesananSementara();
                  Navigator.pushReplacementNamed(
                      context, MenungguBayarToko.routename);
                },
                text: "Bayar"),
            // RoundedButtonWidget(
            //   text: "Selesai",
            //   fungsi: () {
            //     for (var x = 0; x < cart.items.length; x++) {
            //       int jumlahPerbarang = cart.items.values.toList()[x].quantity;

            //       var produkdata = loadproduk.finbyid(cart.pesanansemetara[x]);
            //       print(
            //           "produk ${produkdata.namaproduk}, jumlah :${produkdata.jumlah}");

            //       loadproduk.updateDataStok(cart.items.values.toList()[x].id,
            //           produkdata.jumlah - jumlahPerbarang);
            //       print(
            //           "produk ${produkdata.namaproduk}, jumlah :${produkdata.jumlah}");
            //     }
            //     dborder.doc().set({
            //       "idcustomer": loaduser.curuserid,
            //       "idproduk": cart.items.keys.toList(),
            //       "date": DateFormat.yMMMd().format(DateTime.now())
            //     });
            //     Provider.of<Orderproivder>(context, listen: false)
            //         .addorder(cart.items.values.toList(), cart.totalamount);
            //     cart.clear();
            //     cart.clearIdPesananSementara();
            //     Navigator.pop(context);
            //   },
            //   warnabg: Colors.white,
            //   icon: Icons.done,
            //   warnatxt: Colors.black,
            // ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Text(
                "Barang yang dibeli",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: getcart.length,
              itemBuilder: (ctx, i) => CartItemCard(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
