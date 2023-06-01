import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/user_model.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/view/cuaca/tambahlokasi_view.dart';
import 'package:mobileagroapps/widget/login/rounded_field_white.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});
  static const routename = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();
  bool _obscuretext = true;
  bool usercheck = false;
  bool notallowedalert = false;
  bool passcheck = false;
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fethcdatauser();
  }

  var i = 0;

  @override
  Widget build(BuildContext context) {
    final usrprov = Provider.of<UserProvider>(context);
    final akunnya = usrprov.akun;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 128, 211, 131),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 40),
            child: Column(
              children: [
                Image(
                  image: AssetImage(
                    "images/logo.png",
                  ),
                  width: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RoundeFieldWhite(
                            valuenya: username,
                            title: "Username",
                            hover: "masukkan username..",
                            check: usercheck,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(
                                color: Color.fromARGB(255, 65, 65, 65),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: password,
                            obscureText: _obscuretext,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscuretext = !_obscuretext;
                                      });
                                    },
                                    icon: const Icon(Icons.remove_red_eye)),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                hintText: 'Masukkan password ...',
                                errorText: passcheck
                                    ? "password tidak bisa kosong!"
                                    : null),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        child: Text(
                          "Username atau Password Salah !",
                          style: TextStyle(color: Colors.red),
                        ),
                        visible: notallowedalert,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50)),
                          onPressed: () {
                            if (username.text.isEmpty) {
                              setState(() {
                                usercheck = true;
                              });
                            } else {
                              setState(() {
                                usercheck = false;
                              });
                            }

                            if (password.text.isEmpty) {
                              setState(() {
                                passcheck = true;
                              });
                            } else {
                              passcheck = false;
                            }

                            if (password.text.isNotEmpty &
                                username.text.isNotEmpty) {
                              for (var i = 0; i < akunnya.length; i++) {
                                print(akunnya[i].username);
                                if (username.text == akunnya[i].username &&
                                    password.text == akunnya[i].password) {
                                  print(akunnya[i].id.toString());
                                  usrprov
                                      .changedataid(akunnya[i].id.toString());

                                  if (akunnya[i].lokasi == '') {
                                    Navigator.pushReplacementNamed(
                                        context, TambahLokasi.routename,
                                        arguments: i);
                                  } else {
                                    usrprov.changedataidx(i);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BottomNavbar(
                                                  idx: i,
                                                )));
                                    notallowedalert = false;
                                  }
                                  break;
                                } else {
                                  notallowedalert = true;
                                }
                              }
                            } else {
                              print("salah");
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("don't have account?"),
                          Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              child: Text("SignUp",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
