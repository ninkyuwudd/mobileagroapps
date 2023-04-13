class cuacaData {
  final List<KondisiCuaca> cuacanya;
  final MainData main;

  cuacaData({required this.cuacanya, required this.main});
}

class KondisiCuaca {
  final int id;
  final String main;
  final String description;
  final String icon;

  KondisiCuaca({required this.id, required this.main, required this.description, required this.icon});
}

class MainData {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  MainData(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      required this.seaLevel,
      required this.grndLevel});

  // CuacaModel.fromJson(Map<String,dynamic> json){
  //   namakota = json["name"];
  //   temperatur = json["main"]["temp"];
  //   wind = json["wind"]["speed"];
  //   pressure = json["main"]["pressure"];
  //   humidity = json["main"]["humidity"];
  //   feelslike = json["main"]["feels_like"];
  // }
}
