import 'package:flutter/material.dart';

class CircleMenu extends StatelessWidget {
  List listmenu;
  String open;
  CircleMenu({required this.listmenu,required this.open});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5),

              decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  
                  CircleAvatar(
                    child: Image(image: AssetImage("images/$open")),
                  ),
                ],
              ),
            ),
          ),
        for (var i in listmenu)
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5),

              decoration: BoxDecoration(color: Color.fromARGB(255, 97, 136, 95),borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Image(image: AssetImage("images/gembok.png"),width: 20,),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image(image: AssetImage("images/$i")),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
