import 'package:flutter/material.dart';
import 'package:mobileagroapps/utils/images.dart';
import 'package:mobileagroapps/view/profile/daftartoko_view.dart';
import 'package:mobileagroapps/view/profile/pembayaran_premium_view.dart';
import 'package:mobileagroapps/widget/profile/list_fitur_premium.dart';

class DaftarPremium extends StatefulWidget {
  static const routename = "/daftarpremium";
  const DaftarPremium({super.key});

  @override
  State<DaftarPremium> createState() => _DaftarPremiumState();
}

class _DaftarPremiumState extends State<DaftarPremium> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paket Premium"),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(24, 0, 0, 0),
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: Offset(0, 5))
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(Images.diskon),
                        width: 150,
                      ),
                      Spacer(),
                      Text(
                        "Rp99.000",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Text(
                    "Rp 24.900",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20 - 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, PembayaranPremium.routename);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: 10, right: 25, left: 25, bottom: 10),
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, right: 20, left: 20),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          "Pilih Paket",
                          style: TextStyle(color: Colors.white),
                        )),
                      )),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20 - 25,
            ),
            Text(
              "Fitur",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20 - 25,
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  "Fitur kalkulator Pupuk",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20 - 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  FiturListPremium(judul: "Kalkulator semangka"),
                  FiturListPremium(judul: "Kalkulator pisang"),
                  FiturListPremium(judul: "Kalkulator delima"),
                  FiturListPremium(judul: "Kalkulator apel"),
                  FiturListPremium(judul: "Kalkulator anggur"),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20 - 25,
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  "Fitur kalkulator Pupuk",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20 - 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  FiturListPremium(judul: "Kalkulator semangka"),
                  FiturListPremium(judul: "Kalkulator pisang"),
                  FiturListPremium(judul: "Kalkulator delima"),
                  FiturListPremium(judul: "Kalkulator apel"),
                  FiturListPremium(judul: "Kalkulator anggur"),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20 - 25,
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  "Fitur Toko",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20 - 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  FiturListPremium(
                      judul: "Tidak ada batasan jumlah unggah Produk"),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
