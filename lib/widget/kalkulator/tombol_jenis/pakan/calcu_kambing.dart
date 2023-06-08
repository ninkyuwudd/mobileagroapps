import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

import '../../../popup_warning.dart';

class Kalkulatorkambing extends StatefulWidget {
  const Kalkulatorkambing({super.key});

  @override
  State<Kalkulatorkambing> createState() => _KalkulatorkambingState();
}

class _KalkulatorkambingState extends State<Kalkulatorkambing> {
  var pakan_ampas;
  var pakan_rumput;
  TextEditingController pakanfield = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                Text(
                  "Kambing",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: pakanfield,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "jumlah kambing...",
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
                            if (pakanfield.text.contains(",")) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return PopupWarning(
                                        pesan:
                                            "tidak bisa mengunnakan koma (',')");
                                  });
                            } else {
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
                            }
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
    );
  }
}
