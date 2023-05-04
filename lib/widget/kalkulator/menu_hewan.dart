import 'package:flutter/material.dart';


class CircleMenu extends StatelessWidget {

  List listmenu;
  CircleMenu({required this.listmenu});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(var i in listmenu)GestureDetector(
          onTap: (){
            
          },
          child: Container(
            margin: EdgeInsets.only(left: 15),
            child: CircleAvatar(
              child: Image(image: AssetImage("images/$i")),
            ),
          ),
        )
      ],
    );
  }
}