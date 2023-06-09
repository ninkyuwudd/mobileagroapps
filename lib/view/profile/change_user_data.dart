import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileagroapps/controller/pilihfile_controller.dart';
import 'package:mobileagroapps/widget/popup_warning.dart';
// import 'package:mobileagroapps/model/user_model.dart';
import 'package:provider/provider.dart';
import '../../controller/user_controller.dart';
import '../../widget/rounded_value_field.dart';

enum Genderoption { pria, wanita }

class ProfileUserDataEditPage extends StatefulWidget {
  static const routename = "/myprofileedit";

  @override
  State<ProfileUserDataEditPage> createState() =>
      _ProfileUserDataEditPageState();
}

class _ProfileUserDataEditPageState extends State<ProfileUserDataEditPage> {
  Genderoption? _character = Genderoption.pria;

  File? imagefile;
  PlatformFile? pickfile;

  Future uploadfile() async {
    final path = 'file/${pickfile!.name}';
    final file = File(pickfile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickfile = result.files.first;
    });
  }

  _getfromgallery() async {
    PickedFile? pickfile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxHeight: 200,
      maxWidth: 200,
    );
    if (pickfile != null) {
      setState(() {
        imagefile = File(pickfile.path);
      });
    }
  }

  _getfromcamera() async {
    PickedFile? pickfile = await ImagePicker()
        // ignore: deprecated_member_use
        .getImage(source: ImageSource.camera, maxHeight: 200, maxWidth: 200);
    if (pickfile != null) {
      setState(() {
        imagefile = File(pickfile.path);
      });
    }
  }

  final txnama = TextEditingController();
  final txusername = TextEditingController();
  final txemail = TextEditingController();
  final txgender = TextEditingController();
  final txphone = TextEditingController();
  final txid = TextEditingController();
  String imglink = '';
  List? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      data = ModalRoute.of(context)?.settings.arguments as List;
      txnama.text = data![1].toString();
      txusername.text = data![2].toString();
      txemail.text = data![3].toString();
      txgender.text = data![4].toString();
      txphone.text = data![5].toString();
      txid.text = data![0].toString();
      imglink = data![6].toString();
    });
  }

  void navigatenext() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  FirebaseStorage storage = FirebaseStorage.instance;
  String imageurl = "";

  Future<void> getImageurl(String namagambar) async {
    String get = "file/${namagambar}";
    Reference storageReference = storage.ref().child(get);
    imageurl = await storageReference.getDownloadURL();
    setState(() {});
  }

  final firestoredb = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    final pilihfile = Provider.of<PilihUploadfile>(context);

    bool ckname = false;
    bool ckusername = false;
    bool ckemail = false;
    bool ckgender = false;
    bool ckphone = false;
    bool ckpass = false;
    final usrprov = Provider.of<UserProvider>(context);
    usrprov.fethcdatauser();
    final akunnya = usrprov.akun;

        if (pilihfile.pickfile != null) {
      getImageurl(pilihfile.pickfile!.name);
    } else {
      print("data masih kosong");
    }
    // final getdataakun = akunnya[int.parse(data.toString())];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(32),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/bg_profile.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 120,
                    child: 
                    Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image:pilihfile.pickfile == null ?DecorationImage(image: AssetImage("images/empty_profile.png")) :DecorationImage(
                                image: FileImage(File(pilihfile.pickfile!.path!)),
                                fit: BoxFit.cover),
                          ),
                        )
                    
                    // Container(
                      
                    //     child: 
                    //         ? CircleAvatar(
                    //             backgroundImage: AssetImage("images/empty_profile.png"),
                    //             radius: 70,
                    //           )
                    //         : CircleAvatar(
                    //             foregroundImage:
                    //                 FileImage(File(pilihfile.pickfile!.path!)),
                    //             radius: 70,
                    //           )),
                  ),
                  Positioned(
                      left: 100,
                      right: 0,
                      top: 220,
                      child: GestureDetector(
                          onTap: () {
                            // selectFile();
                            pilihfile.selectFile();
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.amber,
                          ))),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                        // SizedBox(width: 20,),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    margin: EdgeInsets.only(left: 15, top: 40),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(76, 100, 100, 100),
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                  ],
                ),
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundeValueFieldWhiteValue(
                        fungsi: (value) {
                          print(value);
                          if (value == "") {
                            setState(() {
                              ckname = true;
                            });
                          } else {
                            setState(() {
                              ckname = false;
                            });
                          }
                        },
                        control: txnama,

                        // valuenya: getdataakun
                        //     .nama
                        //     .toString(),
                        title: "Nama",
                        hover: "Masukkan nama",
                        check: ckname),
                    RoundeValueFieldWhiteValue(
                        fungsi: (value) {
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
                        control: txusername,
                        // valuenya: getdataakun
                        //     .username
                        //     .toString(),
                        title: "Username",
                        hover: "Masukkan Username",
                        check: ckusername),
                    RoundeValueFieldWhiteValue(
                        fungsi: (value) {
                          print(value);
                          if (value == "") {
                            setState(() {
                              ckemail = true;
                            });
                          } else {
                            setState(() {
                              ckemail = false;
                            });
                          }
                        },
                        control: txemail,
                        // valuenya: getdataakun
                        //     .email
                        //     .toString(),
                        title: "Email",
                        hover: "Masukkan Email",
                        check: ckemail),
                    Text(
                      "Jenis Kelamin",
                      style: TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text('Laki-laki'),
                          leading: Radio<Genderoption>(
                            activeColor: Colors.green,
                            value: Genderoption.pria,
                            groupValue: _character,
                            onChanged: (Genderoption? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Perempuan'),
                          leading: Radio<Genderoption>(
                            activeColor: Colors.green,
                            value: Genderoption.wanita,
                            groupValue: _character,
                            onChanged: (Genderoption? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    RoundeValueFieldWhiteValue(
                        fungsi: (value) {
                          print(value);
                          if (value == "") {
                            setState(() {
                              ckphone = true;
                            });
                          } else {
                            setState(() {
                              ckphone = false;
                            });
                          }
                        },
                        control: txphone,
                        // valuenya: getdataakun
                        //     .phone
                        //     .toString(),
                        title: "Phone",
                        hover: "Masukkan no hp",
                        check: ckphone),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (txnama.text.isEmpty ||
                      txusername.text.isEmpty ||
                      txemail.text.isEmpty ||
                      txgender.text.isEmpty ||
                      txphone.text.isEmpty) {
                        showDialog(context: context, builder: (context){
                          return PopupWarning(pesan: "Data ada yang kosong!");
                        });
                  } else {
                    String value = _character.toString().split('.').last;
                    pilihfile.uploadfile();
                    // await Future.delayed(Duration(seconds: 1));
                    getImageurl(pilihfile.pickfile!.name);
                    print(imageurl);

                    print(txid.text);
                    firestoredb.doc(txid.text).update({
                      "nama": txnama.text,
                      "username": txusername.text.trim(),
                      "email": txemail.text,
                      "gender": value,
                      "phone": txphone.text,
                      "gambar": imageurl
                    });

                    // pilihfile.uploadfile();



                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Submit Data Successfully',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, right: 25, left: 25),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
