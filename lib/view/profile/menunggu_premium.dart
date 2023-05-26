import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/view/profile/daftartoko_view.dart';
import 'package:provider/provider.dart';

class PremiumWait extends StatefulWidget {
  static const routename = "/premiumwait";
  const PremiumWait({super.key});

  @override
  State<PremiumWait> createState() => _PremiumWaitState();
}

class _PremiumWaitState extends State<PremiumWait> {

  var statuspembayaran = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatenext();

  }

  void navigatenext() async{
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      statuspembayaran = true;
    });
    await Future.delayed(Duration(seconds: 2));
    var dbuser = FirebaseFirestore.instance.collection("users");
    var iduser = Provider.of<UserProvider>(context,listen: false).curuserid;
    dbuser.doc(iduser).update({
      "status" : "premium"
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child:statuspembayaran == false ? Column(
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