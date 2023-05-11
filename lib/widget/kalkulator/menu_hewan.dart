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
            halaman.gantihalamanpakan("kambing");
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
                case "Ayam@4x.png":
                  {
                    print("ayam");
                    halaman.gantihalamanpakan("ayam");
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
