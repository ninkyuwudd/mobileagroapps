import 'package:flutter/material.dart';
import 'package:mobileagroapps/provider/kalkulator_controller.dart';
import 'package:provider/provider.dart';

class CircleMenu extends StatelessWidget {
  List listmenu;
  String open;
  CircleMenu({required this.listmenu, required this.open});

  @override
  Widget build(BuildContext context) {
    var halaman = Provider.of<KalkulatorController>(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if(open == "kambing_1@4x.png"){
               halaman.gantihalamanpakan("kambing");
            }else if(open == "buah naga@4x.png"){
               halaman.gantihalamanpupuk("buahnaga");
            }
           
          },
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
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
            onTap: () {
              switch (i) {
                case "kambing_@4x.png":
                  {
                    print("kambing");
                    halaman.gantihalamanpakan("kambing");
                  }
                  break;
                case "sapi@4x.png":
                  {
                    print("sapi");
                    halaman.gantihalamanpakan("sapi");
                  }
                  break;
                case "kuda@4x.png":
                  {
                    print("kuda");
                    halaman.gantihalamanpakan("kuda");
                  }
                  break;
                case "babi@4x.png":
                  {
                    print("babi");
                    halaman.gantihalamanpakan("babi");
                  }
                  break;
                case "bebek@4x.png":
                  {
                    print("bebek");
                    halaman.gantihalamanpakan("bebek");
                  }
                  break;
                case "anggur@4x.png":
                  {
                    halaman.gantihalamanpupuk("anggur");
                  }
                  break;
                case "delima@4x.png":
                  { 
                    halaman.gantihalamanpupuk("delima");
                  }
                  break;
                case "apel@4x.png":
                  { 
                    halaman.gantihalamanpupuk("apel");
                  }
                  break;
                case "pisang@4x.png":
                  {
                    halaman.gantihalamanpupuk("pisang");
                  }
                  break;
                case "semangka@4x.png":
                  {
                    halaman.gantihalamanpupuk("semangka");
                  }
                  break;
                case "buah naga@4x.png" : {
                  halaman.gantihalamanpupuk("buahnaga");
                }
              }
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 97, 136, 95),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Image(
                    image: AssetImage("images/gembok.png"),
                    width: 20,
                  ),
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
