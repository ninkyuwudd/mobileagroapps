import 'package:flutter/material.dart';
import 'package:mobileagroapps/view/profile/daftartoko_view.dart';

class Tokoditerima extends StatefulWidget {
  static const routename = "/Tokoditerima";
  const Tokoditerima({super.key});

  @override
  State<Tokoditerima> createState() => _TokoditerimaState();
}

class _TokoditerimaState extends State<Tokoditerima> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatenext();
  }

  void navigatenext() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Text("Selamat!"),
            Text("Toko anda berhasil dibuat")
          ],
        ),
      ),
      
    );
  }
}