import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/user_model.dart';
import 'package:provider/provider.dart';
import '../provider/user_repo.dart';
import '../widget/kalkulator/rounded_value_field.dart';

class ProfileUserDataEditPage extends StatefulWidget {

  static const routename = "/myprofileedit";

  @override
  State<ProfileUserDataEditPage> createState() =>
      _ProfileUserDataEditPageState();
}

class _ProfileUserDataEditPageState extends State<ProfileUserDataEditPage> {
  
  
  final txnama = TextEditingController();
  final txusername = TextEditingController();
  final txemail = TextEditingController();
  final txgender = TextEditingController();
  final txphone = TextEditingController();
  final txid = TextEditingController();
  List? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask((){
    data = ModalRoute.of(context)?.settings.arguments as List;
    txnama.text = data![1].toString();
    txusername.text = data![2].toString();
    txemail.text = data![3].toString();
    txgender.text = data![4].toString();
    txphone.text = data![5].toString();
    txid.text = data![0].toString();
    });

  }
  

final firestoredb = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    bool ckname = false;
    bool ckusername = false;
    bool ckemail = false;
    bool ckgender = false;
    bool ckphone = false;
    bool ckpass = false;
    final usrprov = Provider.of<UserProvider>(context);
    usrprov.fethcdatauser();
    final akunnya = usrprov.akun;
    
    // final getdataakun = akunnya[int.parse(data.toString())];

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
                    child:
                        Image(image: AssetImage("images/photoMainprofile.png")),
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
                  children: [
                    RoundeValueFieldWhiteValue(
                        control: txnama,

                        // valuenya: getdataakun
                        //     .nama
                        //     .toString(),
                        title: "Nama",
                        hover: "Masukkan nama",
                        check: ckname),
                    RoundeValueFieldWhiteValue(
                        control: txusername,
                        // valuenya: getdataakun
                        //     .username
                        //     .toString(),
                        title: "Username",
                        hover: "Masukkan Username",
                        check: ckusername),
                    RoundeValueFieldWhiteValue(
                        control: txemail,
                        // valuenya: getdataakun
                        //     .email
                        //     .toString(),
                        title: "Email",
                        hover: "Masukkan Email",
                        check: ckemail),
                    RoundeValueFieldWhiteValue(
                        control: txgender,
                        title: "Gender",
                        hover: "Masukkan Gender",
                        check: ckgender),
                    RoundeValueFieldWhiteValue(
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
                onTap: () {
                  print(txid.text);
                  firestoredb.doc(txid.text).update({
                    "nama": txnama.text,
                    "username": txusername.text.trim(),
                    "email": txemail.text,
                    "gender": txgender.text,
                    "phone": txphone.text,
                  });
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