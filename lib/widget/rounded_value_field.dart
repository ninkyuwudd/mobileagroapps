import 'package:flutter/material.dart';



class RoundeValueFieldWhiteValue extends StatelessWidget {
  final TextEditingController control;
  final String title;
  final String hover;
  final Function(String) fungsi;
  // final String valuenya;
  final bool check;
  RoundeValueFieldWhiteValue({
    required this.control,
    // required this.valuenya,
    required this.title,
    required this.hover,
    required this.check,
    required this.fungsi
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(color: Color.fromARGB(255, 83, 83, 83),fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 10,),
                  TextFormField(
                    onChanged:(value) => fungsi(value),
                    controller: control,
                    // initialValue: valuenya,
                    decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                      hintText: hover,
                      fillColor: Colors.white,
                      filled: true,
              
                      errorText:
                              check ? "$title tidak bisa kosong!" : null),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  
                ],
              ),
    );
  }
}