import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/cuaca_controller.dart';
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
                  // Image(image: AssetImage("images/berawan.png",)),

                  SizedBox(height: 20,),
                  Container(
          
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(30, 76, 175, 79),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: 
                    Column(
                      children: [
                        
                        CardSpacer(title: "Temperatur min", data:"${((cuacaData.main.tempMin - 273.15).toStringAsFixed(0))}°ᶜ"),
                        Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                        CardSpacer(title: "Temperatur max", data:"${((cuacaData.main.tempMax - 273.15).toStringAsFixed(0))}°ᶜ"),
                                                Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                        CardSpacer(title: "Tekanan", data:"${cuacaData.main.pressure} hPs"),
                                                Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                        CardSpacer(title: "Kelembapan", data:"${cuacaData.main.humidity}%"),
                      ],
                    ),
                  )
          ],
        );
  }),
    );
  }
}
