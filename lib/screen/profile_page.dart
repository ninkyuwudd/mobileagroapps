import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../provider/user_repo.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUserPage extends StatefulWidget {
  final int idx;
  ProfileUserPage({required this.idx});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  File? imagefile;

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

  @override
  Widget build(BuildContext context) {
    try {
      final usrprov = Provider.of<UserProvider>(context);
      usrprov.fethcdatauser();
      final akunnya = usrprov.akun;
      return SafeArea(
        child: Scaffold(
          body: Column(
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
                        Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 5, bottom: 5, right: 15),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Daftar Toko",
                              style: TextStyle(color: Colors.white),
                            )),
                        Expanded(
                          flex: 2,
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
                        Expanded(
                          child: Text(
                            '',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Spacer(),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 40),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 120,
                    child: Container(
                        child: imagefile == null
                            ? CircleAvatar(
                                backgroundImage:
                                    AssetImage("images/bebek@4x.png"),
                                radius: 70,
                              )
                            : CircleAvatar(
                                foregroundImage: FileImage(imagefile!),
                                radius: 70,
                              )),
                  ),
                  Positioned(
                      left: 100,
                      right: 0,
                      top: 220,
                      child:
                          GestureDetector(
                            onTap: (){
                              _getfromgallery();
                            },
                            child: CircleAvatar(child: Icon(Icons.edit,color: Colors.white,),backgroundColor: Colors.amber,))),
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
                  margin:
                      EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 10),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
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

              Container(
                margin:
                    EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 10),
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Change Password"),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        _getfromcamera();
                      },
                      child: const Image(
                          image: AssetImage("images/right_row_icon.png")),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, right: 25, left: 25),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
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
      );
    } catch (e) {
      print(e);
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
