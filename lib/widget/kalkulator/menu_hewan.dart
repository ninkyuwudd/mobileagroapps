import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/kalkulator_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:provider/provider.dart';

class CircleMenu extends StatefulWidget {
  List listmenu;
  String open;
  int idx;
  CircleMenu({required this.listmenu, required this.open, required this.idx});

  @override
  State<CircleMenu> createState() => _CircleMenuState();
}

class _CircleMenuState extends State<CircleMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fethcdatauser();
  }

  @override
  Widget build(BuildContext context) {
    var halaman = Provider.of<KalkulatorController>(context);
    var userakun = Provider.of<UserProvider>(context, listen: false);
    var loaduser = userakun.akun;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.open == "kambing_1@4x.png") {
              halaman.gantihalamanpakan("kambing");
            } else if (widget.open == "buah naga@4x.png") {
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
                  child: Image(image: AssetImage("images/${widget.open}")),
                ),
              ],
            ),
          ),
        ),
        for (var i in widget.listmenu)
          GestureDetector(
            onTap: () {
              if (loaduser[widget.idx].status == "premium") {
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
                  case "buah naga@4x.png":
                    {
                      halaman.gantihalamanpupuk("buahnaga");
                    }
                }
              }else{
                
              }
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: loaduser[widget.idx].status == "premium"
                      ? Colors.green
                      : Color.fromARGB(255, 97, 136, 95),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Visibility(
                    visible:
                        loaduser[widget.idx].status == "premium" ? false : true,
                    child: Image(
                      image: AssetImage("images/gembok.png"),
                      width: 20,
                    ),
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
