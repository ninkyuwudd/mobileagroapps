import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_repo.dart';

class ProfileUserPage extends StatefulWidget {
  final int idx;
  ProfileUserPage({required this.idx});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
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
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 15, top: 40),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child:
                        Image(image: AssetImage("images/photoMainprofile.png")),
                  ),
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
                  Navigator.pushNamed(context, '/myprofileedit',
                      arguments: widget.idx);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, right: 25, left: 25,bottom: 10),
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
                margin: EdgeInsets.only(top: 10, right: 25, left: 25,bottom: 10),
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
                      onTap: () {},
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
