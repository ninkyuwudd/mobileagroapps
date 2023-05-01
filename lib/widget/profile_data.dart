import 'package:flutter/material.dart';
import 'package:mobileagroapps/provider/user_repo.dart';
import 'package:provider/provider.dart';



class ProfileData extends StatelessWidget {
  final int idx;
  ProfileData({required this.idx});

  @override
  Widget build(BuildContext context) {
    final usrprov = Provider.of<UserProvider>(context);
    usrprov.fethcdatauser();
    final akunnya = usrprov.akun;
    return Text(akunnya[idx].nama.toString());
    // return ListView.builder(
    //   itemCount: usrprov.akun.length,
    //   itemBuilder: (context, index) {
    //     final akunnya = usrprov.akun;
    //     return ListTile(
    //       title: Text(akunnya[idx].nama.toString(),style: TextStyle(color: Colors.amber),),
    //     );
    //   },
    // );
  }
}