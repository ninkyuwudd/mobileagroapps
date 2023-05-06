import 'package:flutter/material.dart';



class RoundeFieldWhite extends StatelessWidget {
  final String title;
  final String hover;
  final TextEditingController valuenya;
  final bool check;
  RoundeFieldWhite({
    required this.valuenya,
    required this.title,
    required this.hover,
    required this.check
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(color: Color.fromARGB(255, 65, 65, 65),fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 10,),
                  TextField(
                    controller: valuenya,
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
                              check ? "$title tidak bisa kosong" : null),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  
                ],
              ),
    );
  }
}