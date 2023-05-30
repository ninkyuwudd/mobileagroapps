import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/widget/tombolrounded_widget.dart';
import 'package:provider/provider.dart';

import '../../controller/keranjang_controller.dart';
import '../../controller/order_controller.dart';
import '../../controller/user_controller.dart';

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
    Provider.of<ProductProvider>(context,listen: false).fetchdataproduct();
  }

  @override
  Widget build(BuildContext context) {
      final loadproduk = Provider.of<ProductProvider>(context);
        final cart = Provider.of<CartProvider>(context);
    final loaduser = Provider.of<UserProvider>(context);
    loaduser.fethcdatauser;
    final data = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text("Pembayaran"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2,
          )
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Total Pembayaran",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text("Rp$data"),
            Divider(),
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
                        Text(
                          "Cara Pembayaran",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            RoundedButtonWidget(
              text: "Selesai",
              fungsi: () {
                dborder.doc().set({
                  "idcustomer": loaduser.curuserid,
                  "idproduk": cart.items.keys.toList(),
                  "date": DateFormat.yMMMd().format(DateTime.now())
                });
                Provider.of<Orderproivder>(context, listen: false)
                    .addorder(cart.items.values.toList(), cart.totalamount);
                cart.clear();
                Navigator.pop(context);
              },
              warnabg: Colors.white,
              icon: Icons.done,
              warnatxt: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
