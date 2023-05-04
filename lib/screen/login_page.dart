import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/user_model.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/widget/login/rounded_field_white.dart';

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
  List<UsersAkun> usersitem = [];
  @override
  void initState() {
    fetchRecord();
    super.initState();
  }

  fetchRecord() async {
    var records = await FirebaseFirestore.instance.collection('users').get();
    maprecord(records);
  }

  maprecord(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map((item) => UsersAkun(
            // id: item["id"],
            nama: item['nama'],
            username: item['username'],
            email: item['email'],
            gender: item["gender"],
            phone: item["phone"],
            password: item["password"],
            status: item["status"]
            ))
        .toList();
    setState(() {
      usersitem = _list;
    });
  }

  var i = 0;

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RoundeFieldWhite(
                              valuenya: username,
                              title: "Username",
                              hover: "masukkan username..",
                              check: usercheck ,
                              ),
                                            Text("Password",style: TextStyle(color: Color.fromARGB(255, 65, 65, 65),fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 10,),
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
                                errorText:
                                    passcheck ? "Username Can't be empty!" : null),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
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
                            
                            if (password.text.isNotEmpty & username.text.isNotEmpty) {
                              for (var i = 0; i < usersitem.length; i++) {
                                print(usersitem[i].username);
                                if (username.text == usersitem[i].username &&
                                    password.text == usersitem[i].password) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BottomNavbar(idx: i,)));
                                      notallowedalert = false;
                                      break;
                                }else{
                                  notallowedalert = true;
                                }
                              }
                            }else{
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
                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)
                              )),
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
