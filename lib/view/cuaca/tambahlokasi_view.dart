import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/cuaca_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
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
  bool ckusername = false;

  var lokasi = TextEditingController();
  bool cek = false;
  @override
  Widget build(BuildContext context) {
    var loadcuaca = Provider.of<CuacaProvider>(context);
    var loadidx = ModalRoute.of(context)?.settings.arguments as int;
    var loaduser = Provider.of<UserProvider>(context);
    var ambildata = loaduser.akun;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tambah Lokasi Anda",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RoundeValueFieldWhiteValue(
                fungsi:(value) {
                        print(value);
                        if (value == "") {
                          setState(() {
                            ckusername = true;
                          });
                        } else {
                          setState(() {
                            ckusername = false;
                          });
                        }

                      },
                control: lokasi,
                title: "",
                hover: "masukkan lokasi anda",
                check: cek),
            GestureDetector(
              onTap: () {
                try {
                  if (lokasi.text.isEmpty) {
                    setState(() {
                      cek = true;
                    });
                  }else{
                    setState(() {
                      cek = false;
                    });
                    firestoredb
                      .doc(ambildata[loadidx].id)
                      .update({"lokasi": lokasi.text});
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavbar(
                        idx: loadidx,
                      ),
                    ),
                  );
                  loadcuaca.updateLocation(lokasi.text);
                  }
                  
                } catch (e) {
                  print("masih ada eror");
                }
              },
              child: Container(
                margin:
                    EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 10),
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Text("Tambahkan", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
