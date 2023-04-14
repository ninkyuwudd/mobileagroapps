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
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(30, 76, 175, 79),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Consumer<CuacaProvider>(builder: (context, cuacaProvider, _) {
          final cuacabesok = cuacaProvider.cuacafrData!;
          if (cuacabesok == null || cuacabesok.isEmpty) {
            return Text("load data...");
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(DateFormat.MMMd().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            cuacabesok[0].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                    Text((double.parse(cuacabesok[0].temp) - 273.15)
                        .toStringAsFixed(1)),
                        SizedBox(height: 10,),
                        Text(cuacabesok[0].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(DateFormat.MMMd().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            cuacabesok[8].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                    Text((double.parse(cuacabesok[8].temp) - 273.15)
                        .toStringAsFixed(1)),
                        SizedBox(height: 10,),
                        Text(cuacabesok[8].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(DateFormat.MMMd().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            cuacabesok[15].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                    Text((double.parse(cuacabesok[15].temp) - 273.15)
                        .toStringAsFixed(1)),
                        SizedBox(height: 10,),
                         Text(cuacabesok[15].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(DateFormat.MMMd().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            cuacabesok[23].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                    Text((double.parse(cuacabesok[23].temp) - 273.15)
                        .toStringAsFixed(1)),
                        SizedBox(height: 10,),
                         Text(cuacabesok[23].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(DateFormat.MMMd().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            cuacabesok[31].dt * 1000)),style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5,),
                    Text((double.parse(cuacabesok[31].temp) - 273.15)
                        .toStringAsFixed(1)),
                        SizedBox(height: 10,),
                         Text(cuacabesok[31].weather[0]['description'],maxLines: 2,overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
