import 'package:flutter/material.dart';

class CardSpacer extends StatelessWidget {
  final String title;
  final String data;
  CardSpacer({required this.title,required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(title,style: TextStyle(color: Color.fromARGB(255, 51, 51, 51),fontWeight: FontWeight.bold),),
          Spacer(),
          Text(data),
        ],
      ),
    );
  }
}

