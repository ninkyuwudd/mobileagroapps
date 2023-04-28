import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/login/rounded_field_white.dart';
import 'package:mobileagroapps/widget/profile_data.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../provider/cuaca_service.dart';
import '../provider/user_repo.dart';

class ProfileUserDataEditPage extends StatefulWidget {
  // final int idx;
  // ProfileUserDataEditPage({required this.idx});

  static const routename = "/myprofileedit";

  @override
  State<ProfileUserDataEditPage> createState() =>
      _ProfileUserDataEditPageState();
}

class _ProfileUserDataEditPageState extends State<ProfileUserDataEditPage> {
  @override
  Widget build(BuildContext context) {
    bool ckname = false;
    bool ckusername = false;
    bool ckemail = false;
    bool ckgender = false;
    bool ckphone = false;
    bool ckpass = false;

    final int? data = ModalRoute.of(context)?.settings.arguments as int;
    final usrprov = Provider.of<UserProvider>(context);
    usrprov.fethcdatauser();
    final akunnya = usrprov.akun;
    return Consumer<CuacaProvider>(builder: (context, cuacaProvider, _) {
      final cuacabesok = cuacaProvider.cuacafrData!;
      if (cuacabesok == null || cuacabesok.isEmpty) {
        return Text("load data...");
      }
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      top: 0,
                      child: Image(
                          image: AssetImage("images/photoMainprofile.png")),
                    ),
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
                            'Profile',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))
                          // SizedBox(width: MediaQuery.of(context).size.width / 6,)
                        ],
                      ),
                      margin: EdgeInsets.only(left: 15, top: 40),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      RoundeValueFieldWhite(
                          valuenya: akunnya[int.parse(data.toString())]
                              .nama
                              .toString(),
                          title: "Nama",
                          hover: "masukkan nama anda...",
                          check: ckname),
                      RoundeValueFieldWhite(
                          valuenya: akunnya[int.parse(data.toString())]
                              .username
                              .toString(),
                          title: "Username",
                          hover: "masukkan Username anda...",
                          check: ckusername),
                      RoundeValueFieldWhite(
                          valuenya: akunnya[int.parse(data.toString())]
                              .email
                              .toString(),
                          title: "Email",
                          hover: "masukkan email anda...",
                          check: ckemail),
                      RoundeValueFieldWhite(
                          valuenya: akunnya[int.parse(data.toString())]
                              .gender
                              .toString(),
                          title: "Gender",
                          hover: "gender anda...",
                          check: ckgender),
                      RoundeValueFieldWhite(
                          valuenya: akunnya[int.parse(data.toString())]
                              .phone
                              .toString(),
                          title: "Phone",
                          hover: "mauskkan nomor hp anda...",
                          check: ckphone),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
