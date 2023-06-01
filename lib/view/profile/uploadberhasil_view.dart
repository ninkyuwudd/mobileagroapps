import 'package:flutter/material.dart';
import 'package:mobileagroapps/view/profile/daftartoko_view.dart';

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
    navigatenext();
  }

  void navigatenext() async{
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      statuspersetujuan = true;
    });
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child:statuspersetujuan == false ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           CircularProgressIndicator(),
            SizedBox(
              height: 15,
            ),
          
            Text("Menunggu menyelesaikan pembayaran....")
          ],
        ): Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           Icon(Icons.check_circle,color: Colors.green,size: 80,),
            SizedBox(
              height: 15,
            ),
          Text("Pembayaran Berhasil!"),
            Text("Terimakasih!"),
            
          ],
        ),
      ),
      
    );
  }
}