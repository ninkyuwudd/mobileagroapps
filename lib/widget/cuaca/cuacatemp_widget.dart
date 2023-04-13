import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cuaca_service.dart';
import 'item_card.dart';


class CuacaTempWidget extends StatefulWidget {
  final String main;
  final String description;
  CuacaTempWidget({required this.main,required this.description});

  @override
  State<CuacaTempWidget> createState() => _CuacaTempWidgetState();
}

class _CuacaTempWidgetState extends State<CuacaTempWidget> {
        @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CuacaProvider>(context,listen: false).getCuacaAll();
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Consumer<CuacaProvider>(builder: (context,cuacaProvider,_){
        final cuacaData = cuacaProvider.cuacadata!;
        return Column(
          children: [
                  Image(image: AssetImage("images/berawan.png",)),
                  Text("Hari ini ${widget.main}"),
                  Text(widget.description),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(86, 76, 175, 79),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: 
                    Column(
                      children: [
                        CardSpacer(title: "Temperatur min", data:"${((cuacaData.main.tempMin - 273.15).toStringAsFixed(0))}°ᶜ"),
                        CardSpacer(title: "Temperatur max", data:"${((cuacaData.main.tempMax - 273.15).toStringAsFixed(0))}°ᶜ"),
                        CardSpacer(title: "Tekanan", data:"${cuacaData.main.pressure}"),
                        CardSpacer(title: "Kelembapan", data:"${cuacaData.main.humidity}"),
                      ],
                    ),
                  )
          ],
        );
  }),
    );
  }
}
//cara manggil yg list
                // Text('Hari ini ${cuacaData.cuacanya.first.main}'),
                // Text('${cuacaData.cuacanya.first.description}'),
                // Text('Temperature: ${weatherData.main.temp}'),
                //   Text('Feels Like: ${weatherData.main.feelsLike}'),
                //   Text('Minimum Temperature: ${weatherData.main.tempMin}'),
                //   Text('Maximum Temperature: ${weatherData.main.tempMax}'),
                //   Text('Pressure: ${weatherData.main.pressure}'),
                //   Text('Humidity: ${weatherData.main.humidity}'),
                //   Text('Sea Level: ${weatherData.main.seaLevel}'),
                //   Text('Ground Level: ${weatherData.main.grndLevel}'),