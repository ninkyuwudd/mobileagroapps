import 'package:flutter/material.dart';
import 'package:mobileagroapps/screen/profile/daftartoko_view.dart';

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
    navigatenext();
  }

  void navigatenext() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, DaftarToko.routename);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Premium"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}