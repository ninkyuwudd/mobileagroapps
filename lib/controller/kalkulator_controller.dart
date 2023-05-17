import 'package:flutter/material.dart';



class KalkulatorController with ChangeNotifier {
  String halaman_pakan = "kambing";
  String halaman_pupuk = "buahnaga";

  void gantihalamanpakan(String halpakan) {
    halaman_pakan = halpakan;
    notifyListeners();
  }

  void gantihalamanpupuk(String halpupuk){
    halaman_pupuk = halpupuk;
    notifyListeners();
  }
}