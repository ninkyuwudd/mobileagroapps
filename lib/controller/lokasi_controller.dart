import 'package:flutter/material.dart';


class LokasiProvider extends ChangeNotifier {
  String _location = 'Jember';

  void updateLocation(String location) {
    _location = location;
    notifyListeners();
  }
  String get location => _location;
  // add other methods to fetch weather data here
}