import 'package:flutter/material.dart';
import 'package:mobileagroapps/screen/profile/daftartoko_view.dart';
import 'package:mobileagroapps/screen/profile/premium_view.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../controller/user_controller.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUserPage extends StatefulWidget {
  final int idx;
  ProfileUserPage({required this.idx});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context,listen: false).fethcdatauser();
  }
  @override
  Widget build(BuildContext context) {
    try {
      final usrprov = Provider.of<UserProvider>(context,listen: false);
      final akunnya = usrprov.akun;
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
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
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 40),
                    ),
                    // Positioned(
                    //   left: 0,
                    //   right: 0,
                    //   top: 120,
                    //   child: Container(
                    //       child: imagefile == null
                    //           ? CircleAvatar(
                    //               backgroundImage:
                    //                   AssetImage("images/bebek@4x.png"),
                    //               radius: 70,
                    //             )
                    //           : CircleAvatar(
                    //               foregroundImage: FileImage(imagefile!),
                    //               radius: 70,
                    //             )),
                    // ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Image(
                          image: AssetImage("images/photoMainprofile.png")),
                    ),
                    // Positioned(
                    //     left: 100,
                    //     right: 0,
                    //     top: 220,
                    //     child:
                    //         GestureDetector(
                    //           onTap: (){
                    //             _getfromgallery();
                    //           },
                    //           child: CircleAvatar(child: Icon(Icons.edit,color: Colors.white,),backgroundColor: Colors.amber,))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  akunnya[widget.idx].nama.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 10,
                    ),
                    Text(akunnya[widget.idx].email.toString()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Expanded(child: ProfileData(idx: widget.idx,)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/myprofileedit', arguments: [
                      akunnya[widget.idx].id,
                      akunnya[widget.idx].nama,
                      akunnya[widget.idx].username,
                      akunnya[widget.idx].email,
                      akunnya[widget.idx].gender,
                      akunnya[widget.idx].phone,
                    ]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10, right: 25, left: 25, bottom: 10),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 20,
                        ),
                        Text("My Profile"),
                        const Spacer(),
                        const Image(
                            image: AssetImage("images/right_row_icon.png")),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, DaftarToko.routename);
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 10),
                    padding:
                        EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Daftar Toko"),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: const Image(
                              image: AssetImage("images/right_row_icon.png")),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: akunnya[widget.idx].status == "user"? false : true,
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 10),
                    padding:
                        EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.all_inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Daftar Produk"),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: const Image(
                              image: AssetImage("images/right_row_icon.png")),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DaftarPremium.routename);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10, right: 25, left: 25, bottom: 10),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 225, 0),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.all_inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Daftar Premium"),
                        const Spacer(),
                        Image(image: AssetImage("images/right_row_icon.png")),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, right: 25, left: 25),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 206, 84, 84),
                        borderRadius: BorderRadius.circular(20)),
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
                          "Sign Out",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      print(e);
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
