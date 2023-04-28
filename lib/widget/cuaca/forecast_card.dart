import 'package:flutter/material.dart';


class FrCardWidget extends StatelessWidget {
  final String date;
  final String icon;
  final String temp;
  final String cuaca;
  
  FrCardWidget({required this.date,required this.icon,required this.temp,required this.cuaca});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 90,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(49, 100, 100, 100),
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                  ],
                ),
                child: Column(
                  children: [
                    Text(date
                        ,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Color.fromARGB(255, 47, 47, 47))),
                    SizedBox(
                      height: 5,
                    ),
                    
                                        Image.network(
                        "http://openweathermap.org/img/w/$icon.png"),
                        Text(temp),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      cuaca,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
  }
}