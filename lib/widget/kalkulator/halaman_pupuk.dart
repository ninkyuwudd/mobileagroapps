import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/menu_hewan.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

class KalkulatorPupuk extends StatefulWidget {
  const KalkulatorPupuk({super.key});

  @override
  State<KalkulatorPupuk> createState() => _KalkulatorPupukState();
}

class _KalkulatorPupukState extends State<KalkulatorPupuk> {
  bool tampilkandang = false;
  bool tampilkebun = true;
  var kandang_hektar;
  var pupuk_kimia_cair;
  var pupuk_kimia;
  TextEditingController pupuk = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //               Text(
              //   "Kalkulator pupuk",
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
                  "buah naga@4x.png",
                  "anggur@4x.png",
                  "delima@4x.png",
                  "apel@4x.png",
                  "pir@4x.png",
                  "pisang@4x.png",
                  "semangka@4x.png"
                  
                ]),
                ),
              ),
                            SizedBox(
                height: 15,
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
                      
                      Text("Luas lahan(hektar)"),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: pupuk,
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
                                  kandang_hektar =
                                      double.parse(pupuk.text) *
                                          400 *
                                          0.125;
                                  pupuk_kimia_cair = double.parse(pupuk.text) *
                                          400 *
                                          2;
                                  pupuk_kimia = double.parse(pupuk.text) *
                                          400 *
                                          0.25;
                                });

                                print(kandang_hektar);
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
              Text("Pupuk Organik(pupuk kandang)"),
              SizedBox(
                height: 10,
              ),
              ResultCard(pupuk: "${pupuk_kimia_cair == null ? '-' : pupuk_kimia_cair}  Kg", title: "Pupuk Kandang",img: "pupuk kandang@4x.png",),
              SizedBox(
                height: 15,
              ),
              Text("Pupuk Kimia"),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ResultCard(title: "Pupuk Cair",pupuk: "${pupuk_kimia_cair == null ? '-' : pupuk_kimia_cair}  Liter",img: "pupuk cair@4x.png",)
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ResultCard(title: "Pupuk Kering",pupuk: "${pupuk_kimia == null ? '-' : pupuk_kimia}  Kg",img: "pupuk kering@4x.png",)
                  )
                ],
              ),
            ],
          ),
        ),
      );
  }
}