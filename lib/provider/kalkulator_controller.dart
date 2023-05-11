import 'package:flutter/material.dart';



class KalkulatorController with ChangeNotifier {
  String halaman_pakan = "kambing";

  void gantihalamanpakan(String halpakan) {
    halaman_pakan = halpakan;
    notifyListeners();
  }
}