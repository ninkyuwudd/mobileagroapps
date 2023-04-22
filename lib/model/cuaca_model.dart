class cuacaData {
  final List<KondisiCuaca> cuacanya;
  final MainData main;
  final Namakota kotanya;

  cuacaData(
      {required this.cuacanya, required this.main, required this.kotanya});
}

class cuacaForecastData {
  final List<ForecastData> cuacabesok;
  cuacaForecastData({required this.cuacabesok});
}

class KondisiCuaca {
  final int id;
  final String main;
  final String description;
  final String icon;

  KondisiCuaca(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});
}

class MainData {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  // final int seaLevel;
  // final int grndLevel;

  MainData(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      // required this.seaLevel,
      // required this.grndLevel
      });
}

class ForecastData {
  final List<dynamic> weather;
  final int dt;
  final String temp;
  final String feelsLike;
  final String tempMin;
  final String tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  ForecastData(
      {
      required this.weather,
      required this.dt,
      required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      required this.seaLevel,
      required this.grndLevel});
  factory ForecastData.fromJson(Map<String, dynamic> json) {
    return ForecastData(
      weather: json['weather'],
      dt: json['dt'],
      temp: json['main']['temp'].toString(),
      feelsLike: json['main']['feels_like'].toString(),
      tempMin: json['main']['temp_min'].toString(),
      tempMax: json['main']['temp_max'].toString(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      seaLevel: json['main']['sea_level'],
      grndLevel: json['main']['grnd_level'],
    );
  }
}

// class FrKondisiCuaca {
//   final int id;
//   final String main;
//   final String description;
//   final String icon;

//   FrKondisiCuaca(
//       {required this.id,
//       required this.main,
//       required this.description,
//       required this.icon});

//     factory FrKondisiCuaca.fromJson(Map<String, dynamic> json){

//     } 
  
// }

class Namakota {
  final String Kota;

  Namakota({
    required this.Kota,
  });
}
