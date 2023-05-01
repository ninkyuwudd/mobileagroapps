import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/screen/login_page.dart';
import 'package:mobileagroapps/widget/login/rounded_field_white.dart';
import 'package:provider/provider.dart';

import '../provider/user_repo.dart';

enum Genderoption { pria, wanita }

class RegisterPage extends StatefulWidget {
  // const RegisterPage({super.key});
  static const routename = "/register";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Genderoption? _character = Genderoption.pria;

  bool ckname = false;
  bool ckusername = false;
  bool ckusenamevalid = true;
  bool ckemail = false;
  bool ckgender = false;
  bool ckphone = false;
  bool ckpass = false;
  bool textemail = true;

  TextEditingController nama = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final firestoredb = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    final usrprov = Provider.of<UserProvider>(context);
    usrprov.fethcdatauser();
    final akunnya = usrprov.akun;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 128, 211, 131),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Register",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundeFieldWhite(
                        check: ckname,
                        valuenya: nama,
                        title: "Nama",
                        hover: "masukkan nama.."),
                    Text(
                      "Username",
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
                        for (var i = 0; i < akunnya.length; i++) {
                          print(akunnya[i].username);
                          if (value == akunnya[i].username) {
                            setState(() {
                              ckusenamevalid = false;
                            });

                            print("akun sudah digunakan");
                            break;
                          } else {
                            setState(() {
                              ckusenamevalid = true;
                            });
                          }
                        }
                      },
                      // controller: username,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "masukkan username...",
                          fillColor: Colors.white,
                          filled: true,
                          errorText: ckusername
                              ? "username Can't be empty!"
                              : ckusenamevalid
                                  ? null
                                  : "username sudah digunakan!!"),
                    ),
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
                            ckemail = true;
                          });
                        } else {
                          ckemail = false;
                        }

                        textemail =EmailValidator.validate(value);
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "masukkan email...",
                          fillColor: Colors.white,
                          filled: true,
                          errorText: ckemail
                              ? "email Can't be empty!"
                              : textemail
                                  ? null
                                  : "email tidak valid"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                    RoundeFieldWhite(
                        check: ckphone,
                        valuenya: phone,
                        title: "Phone",
                        hover: "masukkan phone.."),
                    RoundeFieldWhite(
                        check: ckpass,
                        valuenya: password,
                        title: "Password",
                        hover: "masukkan password.."),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50)),
                    onPressed: () {
                      String value = _character.toString().split('.').last;
                      // print(value);
                      try {
                        if (password.text.isEmpty) {
                          setState(() {
                            ckpass = true;
                          });
                        } else {
                          ckpass = false;
                        }

                        if (nama.text.isEmpty) {
                          setState(() {
                            ckname = true;
                          });
                        } else {
                          ckname = false;
                        }

                        if (gender.text.isEmpty) {
                          setState(() {
                            ckgender = true;
                          });
                        } else {
                          ckgender = false;
                        }

                        if (phone.text.isEmpty) {
                          setState(() {
                            ckphone = true;
                          });
                        } else {
                          ckphone = false;
                        }
                        if (EmailValidator.validate(email.text) == true &&
                            nama.text.isNotEmpty &&
                            password.text.isNotEmpty &&
                            phone.text.isNotEmpty &&
                            username.text.isNotEmpty) {
                          String id =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          firestoredb.doc(id).set({
                            "nama": nama.text,
                            "username": username.text.trim(),
                            "email": email.text,
                            "gender": value,
                            "phone": phone.text,
                            "password": password.text
                          });
                          firestoredb
                              .doc(id)
                              .collection('private data')
                              .doc(id)
                              .set({"id": id});
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }
                      } catch (e) {
                        print("salah $e");
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
