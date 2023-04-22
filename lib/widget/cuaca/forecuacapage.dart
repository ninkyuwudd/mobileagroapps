import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/cuaca_service.dart';

class ForecastCuacaPage extends StatefulWidget {
  const ForecastCuacaPage({super.key});

  @override
  State<ForecastCuacaPage> createState() => _ForecastCuacaPageState();
}

class _ForecastCuacaPageState extends State<ForecastCuacaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CuacaProvider>(context, listen: false).getForecastCuaca();
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<CuacaProvider>(builder: (context, cuacaProvider, _) {
          final cuacabesok = cuacaProvider.cuacafrData!;
          if (cuacabesok == null || cuacabesok.isEmpty) {
            return Text("load data...");
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                width: 90,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber
                ),
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(DateFormat.MMMd().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                cuacabesok[0].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                                SizedBox(height: 5,),
                        Text((double.parse(cuacabesok[0].temp) - 273.15)
                            .toStringAsFixed(1) + "°ᶜ"),
                            SizedBox(height: 10,),
                            Text(cuacabesok[0].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)
                      ],
                    ),
              ),
                
              Container(
                width: 90,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber
                ),
                child: Column(
                      children: [
                        Text(DateFormat.MMMd().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                cuacabesok[8].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                                SizedBox(height: 5,),
                        Text((double.parse(cuacabesok[8].temp) - 273.15)
                            .toStringAsFixed(1) + "°ᶜ"),
                            SizedBox(height: 10,),
                            Text(cuacabesok[8].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)
                      ],
                    ),
              ),
                
              Container(
                width: 90,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber
                ),
                child: Column(
                      children: [
                        Text(DateFormat.MMMd().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                cuacabesok[15].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                                SizedBox(height: 5,),
                        Text((double.parse(cuacabesok[15].temp) - 273.15)
                            .toStringAsFixed(1) + "°ᶜ"),
                            SizedBox(height: 10,),
                             Text(cuacabesok[15].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)
                      ],
                    ),
              ),
              
              Container(
                width: 90,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber
                ),
                child: Column(
                      children: [
                        Text(DateFormat.MMMd().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                cuacabesok[23].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                                SizedBox(height: 5,),
                        Text((double.parse(cuacabesok[23].temp) - 273.15)
                            .toStringAsFixed(1) + "°ᶜ"),
                            SizedBox(height: 10,),
                             Text(cuacabesok[23].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)
                      ],
                    ),
              ),
                
              Container(
                width: 90,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber
                ),
                child: Column(
                      children: [
                        Text(DateFormat.MMMd().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                cuacabesok[31].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                                SizedBox(height: 5,),
                        Text((double.parse(cuacabesok[31].temp) - 273.15)
                            .toStringAsFixed(1) + "°ᶜ"),
                            SizedBox(height: 10,),
                             Text(cuacabesok[31].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)
                      ],
                    ),
              ),
              
              ],
            ),
          );
        });
  }
}
