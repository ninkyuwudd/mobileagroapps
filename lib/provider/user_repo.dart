import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/user_model.dart';

// class UserProvider extends ChangeNotifier {
//   List<UsersAkun> usersitem = [];
  // @override
  // void initState() {
  //   fetchRecord();
  //   super.initState();
  // }

//   fetchRecord() async {
//     var records = await FirebaseFirestore.instance.collection('users').get();
//     maprecord(records);
//   }

//   maprecord(QuerySnapshot<Map<String, dynamic>> records) {
//     var _list = records.docs
//         .map((item) => UsersAkun(n
//         ama: , username: username, email: email, gender: gender, phone: phone, password: password))
//         .toList();
//     setState(() {
//       usersitem = _list;
//     });
//   }
// }

