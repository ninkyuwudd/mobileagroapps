import 'package:flutter/material.dart';
import 'package:mobileagroapps/view/profile/daftartoko_view.dart';
import 'package:mobileagroapps/view/profile/uploadberhasil_view.dart';

class MenungguPersetujuanToko extends StatefulWidget {
  static const routename = "/MenungguPersetujuanToko";
  const MenungguPersetujuanToko({super.key});

  @override
  State<MenungguPersetujuanToko> createState() =>
      _MenungguPersetujuanTokoState();
}

class _MenungguPersetujuanTokoState extends State<MenungguPersetujuanToko> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatenext();
  }

  void navigatenext() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, Tokoditerima.routename);
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
            CircularProgressIndicator(),
            SizedBox(
              height: 15,
            ),
            Text("Menunggu Persutujuan....")
          ],
        ),
      ),
    );
  }
}
