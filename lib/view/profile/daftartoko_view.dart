import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/pilihfile_controller.dart';
import 'package:mobileagroapps/controller/toko_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/view/profile/uploadberhasil_view.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
import 'package:phone_number/phone_number.dart';
import 'package:provider/provider.dart';

class DaftarToko extends StatefulWidget {
  static const routename = "/daftartoko";

  const DaftarToko({super.key});

  @override
  State<DaftarToko> createState() => _DaftarTokoState();
}

class _DaftarTokoState extends State<DaftarToko> {
  FirebaseStorage storage = FirebaseStorage.instance;
  String imageurl = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TokoController>(context, listen: false).getdatatoko();
    Provider.of<UserProvider>(context, listen: false).fethcdatauser();
  }

    Future<void> getImageurl(String namaimg) async{
    String get ="file/$namaimg";
    Reference storageReference = storage.ref().child(get);
    imageurl = await storageReference.getDownloadURL();
    setState((){
      
    });
  }

  var namatoko = TextEditingController();
  var emailtoko = TextEditingController();
  var nomorhp = TextEditingController();
  var alamat = TextEditingController();
  
  bool textemail = true;
  bool phnumber = true;

  bool namatokock = false;
  bool emailtokock = false;
  bool nomorhpck = false;
  bool alamatck = false;

  @override
  Widget build(BuildContext context) {
    // var loadtoko = Provider.of<TokoController>(context, listen: false);
    var dbtoko = FirebaseFirestore.instance.collection("toko");
    var dbuser = FirebaseFirestore.instance.collection("users");
    // var loaduser = Provider.of<UserProvider>(context, listen: false);
    var getid = ModalRoute.of(context)?.settings.arguments as String;
    // var gettoko = loadtoko.items;
    // var getuser = loaduser.akun;
    var imgcontroller = Provider.of<PilihUploadfile>(context);
    // print(imgcontroller.pickfile?.name);
    if(imgcontroller.pickfile != null){
      getImageurl(imgcontroller.pickfile!.name);
    }else{
      print("data masih kosong");
    }
    

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
                                                  fungsi:(value) {
                        print(value);
                        if (value == "") {
                          setState(() {
                            namatokock= true;
                          });
                        } else {
                          setState(() {
                            namatokock= false;
                          });
                        }

                      },
                  control: namatoko,
                  title: "Nama Toko",
                  hover: "masukkan nama toko...",
                  check: namatokock),
              Text(
                "Email",
                style: TextStyle(
                    color: Color.fromARGB(255, 67, 67, 67),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      emailtokock = true;
                    });
                  } else {
                    emailtokock = false;
                  }
                  setState(() {
                    textemail = EmailValidator.validate(value);
                  });
                },
                controller: emailtoko,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: "masukkan email...",
                    fillColor: Colors.white,
                    filled: true,
                    errorText: emailtokock
                        ? "email tidak bisa kosong"
                        : textemail
                            ? null
                            : "email tidak valid"),
              ),
              Text(
                "Nomor Hp",
                style: TextStyle(
                    color: Color.fromARGB(255, 67, 67, 67),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) async {
                  if (value.isEmpty) {
                    setState(() {
                      nomorhpck = true;
                    });
                  } else {
                    nomorhpck = false;
                  }

                  bool chvalidnumb =
                      await PhoneNumberUtil().validate('+62$value');
                  setState(() {
                    phnumber = chvalidnumb;
                  });

                  print(phnumber);
                },
                keyboardType: TextInputType.number,
                controller: nomorhp,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: "masukkan nomor hp...",
                    fillColor: Colors.white,
                    filled: true,
                    errorText: nomorhpck
                        ? "nomor hp tidak bisa kosong"
                        : phnumber
                            ? null
                            : "nomor hp tidak valid"),
              ),
              SizedBox(height: 5,),
              RoundeValueFieldWhiteValue(
                                                  fungsi:(value) {
                        print(value);
                        if (value == "") {
                          setState(() {
                            alamatck = true;
                          });
                        } else {
                          setState(() {
                            alamatck = false;
                          });
                        }

                      },
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
                    print("nice");
                   setState(() {
                      if (namatoko.text.isEmpty) {
                      namatokock = true;
                    } else {
                      namatokock = false;
                    }
                    if (alamat.text.isEmpty) {
                      alamatck = true;
                    } else {
                      alamatck = false;
                    }
                    if (emailtoko.text.isEmpty) {
                      emailtokock = true;
                    } else {
                      emailtokock = false;
                    }
                    if (nomorhp.text.isEmpty) {
                      nomorhpck = true;
                    } else {
                      nomorhpck = false;
                    }
                   });
                    if (nomorhpck == false &&
                        emailtokock == false &&
                        alamatck == false &&
                        namatokock == false) {
                      imgcontroller.uploadfile();
                      var newDocRef = await dbtoko.add({
                        "namatoko": namatoko.text,
                        "email": emailtoko.text,
                        "nomorhp": nomorhp.text,
                        "alamat": alamat.text,
                        "gambar": imageurl
                      });
                      String newId = newDocRef.id;
                      dbuser
                          .doc(getid)
                          .update({"toko": newId, "status": "admin"});
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Submit Data Successfully',
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ));
                                          Navigator.pushReplacementNamed(
                        context, Tokoditerima.routename);
                    }

                    // });


                  },
                  child: Text("Upload file"))
            ],
          ),
        ),
      ),
    );
  }
}
