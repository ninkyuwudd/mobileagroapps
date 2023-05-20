import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
import 'package:mobileagroapps/widget/tombolrounded_widget.dart';
import 'package:provider/provider.dart';

class TambahLokasi extends StatefulWidget {
  static const routename = "/tambahlokasi";

  // final int idx;
  // TambahLokasi({super.key, required this.idx});

  @override
  State<TambahLokasi> createState() => _TambahLokasiState();
}

class _TambahLokasiState extends State<TambahLokasi> {
  final firestoredb = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fethcdatauser();
  }

  var lokasi = TextEditingController();
  bool cek = false;
  @override
  Widget build(BuildContext context) {
    var loadidx = ModalRoute.of(context)?.settings.arguments as int;
    var loaduser = Provider.of<UserProvider>(context);
    var ambildata = loaduser.akun;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Tambah Lokasi Anda"),
          RoundeValueFieldWhiteValue(
              control: lokasi,
              title: "Lokasi",
              hover: "masukkan lokasi anda",
              check: cek),
          RoundedButtonWidget(
              text: "Tambah",
              fungsi: () {
                try{
                  firestoredb
                    .doc(ambildata[loadidx].id)
                    .update({"lokasi": lokasi.text});

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavbar(
                              idx: loadidx,
                            )));
                }catch(e){
                  print("masih ada eror");
                }
              },
              warnabg: Colors.green)
        ],
      ),
    );
  }
}
