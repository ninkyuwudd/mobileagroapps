import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/view/profile/daftartoko_view.dart';
import 'package:provider/provider.dart';

import '../../navigationbar.dart';

class Tokoditerima extends StatefulWidget {
  static const routename = "/Tokoditerima";
  const Tokoditerima({super.key});

  @override
  State<Tokoditerima> createState() => _TokoditerimaState();
}

class _TokoditerimaState extends State<Tokoditerima> {
  bool statuspersetujuan = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var getidxuser = Provider.of<UserProvider>(context,listen: false);
    print("idx: $getidxuser");
    navigatenext(getidxuser.curidx);
  }

  void navigatenext(int idx) async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      statuspersetujuan = true;
    });
    await Future.delayed(Duration(seconds: 2));
    // Navigator.pop(context);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BottomNavbar(
                  idx: idx,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: statuspersetujuan == false
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Menunggu pengecekan toko....")
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Selamat Toko Berhasil diterima"),
                  Text("Terimakasih"),
                ],
              ),
      ),
    );
  }
}
