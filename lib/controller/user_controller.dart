import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<UsersAkun> _usrakun = [];

  List<UsersAkun> get akun => _usrakun;

  List<UserLocList> _usrloc = [];
  List<UserLocList> get lokasi => _usrloc;

  String curuserid = "";

  int curidx = 0;

  void fethcdatauser() async {
    QuerySnapshot<Map<String, dynamic>> usrdataloc = await FirebaseFirestore.instance.collection('users').get();
        
    _usrakun = usrdataloc.docs
        .map((doc) => UsersAkun(
            id: doc.id,
            nama: doc['nama'],
            username: doc.data()['username'],
            email: doc.data()['email'],
            gender: doc.data()['gender'],
            phone: doc.data()['phone'],
            password: doc.data()['password'],
            status: doc.data()['status'],
            lokasi: doc.data()['lokasi'],
            toko: doc.data()['toko']
            ))
        .toList();
        notifyListeners();
  }

  void fetchdatauserlocation(var id) async{
    QuerySnapshot<Map<String, dynamic>> usrdataloclist = await FirebaseFirestore.instance.collection('users').doc(id).collection("private data").get();

    _usrloc = usrdataloclist.docs.map((locs) => UserLocList(id: locs.id, lokasi: locs['lokasi'])).toList();
    notifyListeners();


  }

  changedataid(String id){
    curuserid = id;
    notifyListeners();
  }

    changedataidx(int idx){
    curidx= idx;
    notifyListeners();
  }
}
