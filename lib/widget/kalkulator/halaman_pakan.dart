import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobileagroapps/widget/kalkulator/menu_hewan.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

class KalkulatorPakan extends StatefulWidget {
  const KalkulatorPakan({super.key});

  @override
  State<KalkulatorPakan> createState() => _KalkulatorPakanState();
}

class _KalkulatorPakanState extends State<KalkulatorPakan> {
  var pakan_ampas;
  var pakan_rumput;
  TextEditingController pakanfield = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Kalkulator pakan",
            //   style: Theme.of(context).textTheme.titleLarge,
            // ),
            SizedBox(
              height: 20,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                child: CircleMenu(listmenu: [
                  "kambing_1@4x.png",
                  "Ayam@4x.png",
                  "kuda@4x.png",
                  "babi@4x.png",
                  "bebek@4x.png",
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: true,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(70, 100, 100, 100),
                      offset: const Offset(
                        1.0,
                        5.0,
                      ),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jumlah Kambing"),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: pakanfield,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                pakan_rumput = double.parse(pakanfield.text) *
                                    75 /
                                    100 *
                                    2.5 *
                                    7;
                                pakan_ampas = double.parse(pakanfield.text) *
                                    75 /
                                    100 *
                                    2 *
                                    7;
                              });
                            },
                            child: Text("hitung")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Jumlah Pakan"),
            SizedBox(
              height: 10,
            ),
            ResultCard(
              pupuk: "${pakan_rumput == null ? '-' : pakan_rumput}  Kg/minggu",
              title: "Pakan Rumput",
              img: "rumput@4x.png",
            ),

            SizedBox(
              height: 15,
            ),
            ResultCard(
              pupuk: "${pakan_ampas == null ? '-' : pakan_ampas}  Kg/minggu",
              title: "Pakan Fermentasi",
              img: "bekatul@4x.png",
            ),
          ],
        ),
      ),
    );
    ;
  }
}
