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
  static const menukambing = [
    'Kambing dewasa',
    'Induk dikawinkan',
    'Induk bunting',
    'Induk menyusui > 2 anak',
    'Induk menyusui 1 anak',
    'Anak kambing'
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItem = menukambing
      .map((val) => DropdownMenuItem(
            child: Text(val),
            value: val,
          ))
      .toList();
  String? _btnSelectVal;

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
                ListTile(
                  trailing: DropdownButton(
                      value: _btnSelectVal,
                      items: _dropDownMenuItem,
                      hint: const Text("Pilih Umur"),
                      onChanged: (String? newval) {
                        if (newval != null) {
                          setState(() {
                            _btnSelectVal = newval;
                          });
                        }
                      }),
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
                            if (_btnSelectVal == null ||
                                pakanfield.text == "") {
                                  print("kosong");
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return PopupWarning(
                                        pesan: "Data tidak boleh kosong !");
                                  });
                            } else {
                              setState(() {
                              int jumlah = int.parse(pakanfield.text);
                              print("tidak kkosong");
                              print(_btnSelectVal);
                              if (_btnSelectVal ==
                                  "Anak Lepas sapih (sedang tumbuh)") {
                                pakan_rumput = 1.0 * jumlah;
                                pakan_ampas = 1 * jumlah;
                              } else if (_btnSelectVal == "Kambing dewasa") {
                                pakan_rumput = 1.5 * jumlah;
                                pakan_ampas = 0.5 * jumlah;
                              } else if (_btnSelectVal ==
                                      "Induk yang dikawinkan" ||
                                  _btnSelectVal == "Induk bunting 3 bulan" ||
                                  _btnSelectVal == "Induk menyusui > 2 anak") {
                                pakan_rumput = 1.5 * jumlah;
                                pakan_ampas = 2-3 * jumlah;
                              } else if (_btnSelectVal ==
                                  "Induk menyusui anak tunggal") {
                                pakan_rumput = 1.5 * jumlah;
                                pakan_ampas = 1 * jumlah;
                              } else if (_btnSelectVal == "Anak kambing") {
                                pakan_rumput = 0.5 * jumlah;
                                pakan_ampas = 0.25 * jumlah;
                              }
                              });
                            }
                          });
                          print(pakan_rumput);
                          print(pakan_ampas);
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
          pupuk: "${pakan_rumput == null ? '-' : pakan_rumput}  Kg/hari",
          title: "Pakan Rumput",
          img: "rumput@4x.png",
        ),
        SizedBox(
          height: 15,
        ),
        ResultCard(
          pupuk: "${pakan_ampas == null ? '-' : pakan_ampas}  Kg/hari",
          title: "Pakan Fermentasi",
          img: "bekatul@4x.png",
        ),
      ],
    );
  }
}
