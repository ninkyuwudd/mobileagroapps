import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileagroapps/view/profile/menunggu_premium.dart';
import 'package:mobileagroapps/widget/tombolrounded_widget.dart';
import 'package:provider/provider.dart';

import '../../controller/keranjang_controller.dart';
import '../../controller/order_controller.dart';
import '../../controller/user_controller.dart';

class PembayaranPremium extends StatefulWidget {
  static const routename = "/pembayaranPremium";

  // const PembayaranPremium({super.key});

  @override
  State<PembayaranPremium> createState() => _PembayaranPremiumState();
}

class _PembayaranPremiumState extends State<PembayaranPremium> {
  final dborder = FirebaseFirestore.instance.collection("order");
  final dbproduk = FirebaseFirestore.instance.collection('produk');
  final dbcustomer = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final loaduser = Provider.of<UserProvider>(context);
    loaduser.fethcdatauser;
    final loaduserid = loaduser.curuserid;
    // final data = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text("Pembayaran"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(34, 0, 0, 0),
                  blurRadius: 2,
                  spreadRadius: 2)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(
              height: 20,
            ),
            Text(
              "Total Pembayaran",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text("Rp24.900"),
            Divider(),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, PremiumWait.routename);
                },
                child: Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 10),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Bayar",
                    style: TextStyle(color: Colors.white),
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
