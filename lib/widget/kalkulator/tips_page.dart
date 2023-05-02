import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/card.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  bool content01 = false;
  bool content02 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tips"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (content01 == false) {
                      content01 = true;
                    } else {
                      content01 = false;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(70, 100, 100, 100),
                        offset: const Offset(
                          1.0,
                          5.0,
                        ),
                        blurRadius: 7.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(width: 1)
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Tips Pupuk Tanaman",
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: content01,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(30, 76, 175, 79),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.only(
                          bottom: 10, left: 10, right: 10, top: 20),
                      child: Column(
                        children: [
                          CardTips(
                              nomor: "1",
                              subs:
                                  "Tanaman buah naga mudah beradaptasi terhadap lingkungan dan perubahan cuaca dengan maksimal kapasitas 400 tanaman per hektar."),
                          CardTips(
                              nomor: "2",
                              subs:
                                  "Tanaman buah naga tumbuh dengan curah hujan 60mm/bulan atau 720mm/tahun."),
                          CardTips(
                              nomor: "3",
                              subs:
                                  "Tanaman buah naga dapat tumbuh baik di dataran rendah kisaran 0-350m dpl."),
                          CardTips(
                              nomor: "4",
                              subs:
                                  "Suhu ideal untuk tanaman buah naga adalah 26-36 ° C."),
                          CardTips(
                              nomor: "5",
                              subs:
                                  "Kelembapan udara yang dibutuhkan tanaman buah naga adalah 70-90%."),
                          CardTips(
                              nomor: "6",
                              subs:
                                  "Gunakan tanah gembur yang banyak mengandung hara dan bahan organik atau dengan tingkat keasaman pH sekitar 6,5-7."),
                          CardTips(
                              nomor: "8",
                              subs:
                                  "Tanaman buah naga membutuhkan drainase tanah yang baik. Drainase tanah yang buruk akan membuat air menggenang terlalu lama dan membuat akar atau batang tanaman buah naga menjadi cepat busuk."),
                          CardTips(
                              nomor: "9",
                              subs:
                                  "Tanaman buah naga butuh sinar matahari penuh dengan intensitas sekitar 70-80%.")
                        ],
                      ))),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (content02 == false) {
                      content02 = true;
                    } else {
                      content02 = false;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),

                  // gradient:Gradient.linear(, Alignment.bottomRight,color)),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(70, 100, 100, 100),
                        offset: const Offset(
                          1.0,
                          5.0,
                        ),
                        blurRadius: 7.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    color: Colors.white,
                    // gradient: LinearGradient(colors: [
                    //   Colors.white,
                    //   Colors.green
                    // ],begin: Alignment.topRight,end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(width: 1)
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Tips Pakan Ternak",
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: content02,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(30, 76, 175, 79),
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 20),
                    child: Column(
                      children: [
                        CardTips(
                            nomor: "1",
                            subs:
                                "Membangun kandang kambing yang aman, yaitu jenis kandang panggung. Bangun kandang setidaknya 10 meter dari rumah menggunakan bahan yang kokoh dan memiliki area bukaan yang cukup. Sebab kandang kambing memerlukan pencahayaan yang cukup banyak agar tidak lembap dan mudah dibersihkan. "),
                        CardTips(
                            nomor: "2",
                            subs:
                                "Memperhatikan kebersihan kandang. Sebab kandang yang kotor dapat membuat kambing menjadi lebih mudah sakit."),
                        CardTips(
                            nomor: "3",
                            subs:
                                "Memberikan pakan yang baik, yaitu pakan hijau sekitar 5-7 kg setiap ekornya dalam satu hari. Beberapa jenis pakan yang bisa kamu berikan antara lain legum, pakan fermentasi, hingga rerumputan."),
                        CardTips(
                            nomor: "4",
                            subs:
                                "Memberikan pakan alternatif seperti daun nangka, daun mahoni, daun kayu palembang, dan sebagainya."),
                        CardTips(
                            nomor: "5",
                            subs:
                                "Dukung cara beternak kambing kamu dengan rutin melakukan pencatatan keuangan dan penganggaran agar usaha ternak berjalan lancar."),
                        CardTips(
                            nomor: "6",
                            subs:
                                "Memilih indukan kambing yang baik, yaitu memiliki postur yang tinggi dan besar dengan bagian ambing (udder) besar, puting ada dua, dalam kondisi sehat, dan disarankan untuk memilih kambing yang sudah pernah berkembangbiak sebanyak satu atau dua kali."),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
