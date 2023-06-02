import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileagroapps/model/cuaca_model.dart';


class CuacaProvider extends ChangeNotifier {
  cuacaData? _cuacadata;
  cuacaData? get cuacadata => _cuacadata;

  List<ForecastData>? _datacuacabesok = [];
  List<ForecastData>? get cuacafrData => _datacuacabesok;
  
  
  String _location = 'jember';

  void updateLocation(String location) {
    _location = location;
    notifyListeners();
  }
  
  Future<void> getCuacaAll() async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$_location&lang=id&appid=013006034e81b3f0cb0023ebff1c5634";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _cuacadata = cuacaData(
          cuacanya: (jsonData['weather'] as List)
              .map((kondisi) => KondisiCuaca(
                  id: kondisi['id'],
                  main: kondisi['main'],
                  description: kondisi['description'],
                  icon: kondisi['icon']))
              .toList(),
          main: MainData(
            temp: jsonData['main']['temp'],
            feelsLike: jsonData['main']['feels_like'],
            tempMin: jsonData['main']['temp_min'],
            tempMax: jsonData['main']['temp_max'],
            pressure: jsonData['main']['pressure'],
            humidity: jsonData['main']['humidity'],
            // seaLevel: jsonData['main']['sea_level'],
            // grndLevel: jsonData['main']['grnd_level'],
          ),
          kotanya: Namakota(Kota: jsonData["name"]));
      notifyListeners();
    } else {
      throw Exception("failed to load weather data");
    }
  }

  Future<void> getForecastCuaca() async {
    final url ="https://api.openweathermap.org/data/2.5/forecast?q=$_location&lang=id&appid=013006034e81b3f0cb0023ebff1c5634";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData["list"]);
      final cuacabesok = jsonData['list'] as List<dynamic>;
      final List<ForecastData> loadedcuaca = [];

      cuacabesok.forEach((element) {
        loadedcuaca.add(ForecastData.fromJson(element));
      },);

      _datacuacabesok = loadedcuaca;
       print(jsonData["list"]);
      notifyListeners();
    } else {
      throw Exception("failed to load weather data");
    }
  }
}
