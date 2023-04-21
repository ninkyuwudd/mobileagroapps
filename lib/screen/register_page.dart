import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/screen/login_page.dart';
import 'package:mobileagroapps/widget/login/rounded_field_white.dart';

class RegisterPage extends StatefulWidget {
  // const RegisterPage({super.key});
  static const routename = "/register";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool ckname = false;
  bool ckusername = false;
  bool ckemail = false;
  bool ckgender = false;
  bool ckphone = false;
  bool ckpass = false;

  TextEditingController nama = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final firestoredb = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
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
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundeFieldWhite(
                        check: ckusername,
                        valuenya: nama,
                        title: "Nama",
                        hover: "masukkan nama.."),
                    RoundeFieldWhite(
                        check: ckusername,
                        valuenya: username,
                        title: "Username",
                        hover: "masukkan username.."),
                    RoundeFieldWhite(
                        check: ckemail,
                        valuenya: email,
                        title: "Email",
                        hover: "masukkan email.."),
                    RoundeFieldWhite(
                        check: ckgender,
                        valuenya: gender,
                        title: "Gender",
                        hover: "masukkan gender.."),
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
                      try {
                        if (username.text.isEmpty) {
                          setState(() {
                            ckusername = true;
                          });
                        } else {
                          setState(() {
                            ckusername = false;
                          });
                        }

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

                        if (email.text.isEmpty) {
                          setState(() {
                            ckemail = true;
                          });
                        } else {
                          ckemail = false;
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

                        if (ckemail != true &&
                            ckgender != true &&
                            ckname != true &&
                            ckpass != true &&
                            ckphone != true &&
                            ckusername != true) {
                          String id =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          firestoredb.doc(id).set({
                            "nama": nama.text,
                            "username": username.text.trim(),
                            "email": email.text,
                            "gender": gender.text,
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
