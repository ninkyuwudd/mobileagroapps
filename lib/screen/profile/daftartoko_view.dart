import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/pilihfile_controller.dart';
import 'package:mobileagroapps/controller/toko_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/screen/profile/uploadtoko_view.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
import 'package:provider/provider.dart';

class DaftarToko extends StatefulWidget {
  static const routename = "/daftartoko";

  const DaftarToko({super.key});

  @override
  State<DaftarToko> createState() => _DaftarTokoState();
}

class _DaftarTokoState extends State<DaftarToko> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TokoController>(context, listen: false).getdatatoko();
    Provider.of<UserProvider>(context, listen: false).fethcdatauser();
  }

  var namatoko = TextEditingController();
  var emailtoko = TextEditingController();
  var nomorhp = TextEditingController();
  var alamat = TextEditingController();

  bool namatokock = false;
  bool emailtokock = false;
  bool nomorhpck = false;
  bool alamatck = false;

  @override
  Widget build(BuildContext context) {
    var loadtoko = Provider.of<TokoController>(context, listen: false);
    var dbtoko = FirebaseFirestore.instance.collection("toko");
    var dbuser = FirebaseFirestore.instance.collection("users");
    var loaduser = Provider.of<UserProvider>(context, listen: false);
    var getid = ModalRoute.of(context)?.settings.arguments as String;
    var gettoko = loadtoko.items;
    var getuser = loaduser.akun;
    var imgcontroller = Provider.of<PilihUploadfile>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Toko"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundeValueFieldWhiteValue(
                  control: namatoko,
                  title: "Nama Toko",
                  hover: "masukkan nama toko...",
                  check: namatokock),
              RoundeValueFieldWhiteValue(
                  control: emailtoko,
                  title: "Email Toko",
                  hover: "masukkan email...",
                  check: emailtokock),
              RoundeValueFieldWhiteValue(
                  control: nomorhp,
                  title: "Nomor hp",
                  hover: "masukkan nomor hp...",
                  check: nomorhpck),
              RoundeValueFieldWhiteValue(
                  control: alamat,
                  title: "Alamat Toko",
                  hover: "masukkan alamat",
                  check: alamatck),
              Text(
                "Pilih Gambar Toko",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                      child: imgcontroller.pickfile == null
                          ? CircleAvatar(
                              backgroundImage:
                                  AssetImage("images/bebek@4x.png"),
                              radius: 70,
                            )
                          : CircleAvatar(
                              foregroundImage: FileImage(
                                  File(imgcontroller.pickfile!.path!)),
                              radius: 70,
                            )),
                  SizedBox(
                    width: 15,
                  ),
                  TextButton(
                      onPressed: () {
                        imgcontroller.selectFile();
                      },
                      child: Text("Pilih gambar")),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity,
                        48), // Atur lebar sesuai kebutuhan Anda
                  ),
                  onPressed: () async {
                    imgcontroller.uploadfile();
                    var newDocRef = await dbtoko.add({
                      "namatoko": namatoko.text,
                      "email": emailtoko.text,
                      "nomorhp": nomorhp.text,
                      "alamat": alamat.text,
                      "gambar": ""
                    });
                    String newId = newDocRef.id;
                    dbuser.doc(getid).update({
                      "toko" : newId,
                      "status" : "admin"
                    });

                    // });
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Submit Data Successfully',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ));

                    // Navigator.pushReplacementNamed(
                    //     context, MenungguPersetujuanToko.routename);
                  },
                  child: Text("Upload file"))
            ],
          ),
        ),
      ),
    );
  }
}
