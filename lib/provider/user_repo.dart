import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<UsersAkun> _usrakun = [];

  List<UsersAkun> get akun => _usrakun;

  void fethcdatauser() async {
    QuerySnapshot<Map<String, dynamic>> usrdataloc =
        await FirebaseFirestore.instance.collection('users').get();
        
    _usrakun = usrdataloc.docs
        .map((doc) => UsersAkun(
            nama: doc['nama'],
            username: doc.data()['username'],
            email: doc.data()['email'],
            gender: doc.data()['gender'],
            phone: doc.data()['phone'],
            password: doc.data()['password']))
        .toList();
        notifyListeners();
  }
}
