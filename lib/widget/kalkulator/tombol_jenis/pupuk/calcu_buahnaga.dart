import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

import '../../double_field_params.dart';

class KalkulatorBuahnaga extends StatefulWidget {
  const KalkulatorBuahnaga({super.key});

  @override
  State<KalkulatorBuahnaga> createState() => _KalkulatorBuahnagaState();
}

class _KalkulatorBuahnagaState extends State<KalkulatorBuahnaga> {
  var pupukkandang;
  var pupukkandangsatuan;
  var pupukkering;
  var pupukkeringsatuan;
  var pupukkimia;
  var pupukkimiasatuan;
  var jumlah = TextEditingController();
  var waktu = TextEditingController();

     ppkkandang(int umur, int jumlah) {
      if (0 <= umur && umur <= 2) {
        pupukkandangsatuan = 10;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }
      if (3 <= umur && umur <= 5) {
        pupukkandangsatuan = 15;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }
      if (6 <= umur && umur < 8) {
        pupukkandangsatuan = 300;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }
      if (8 <= umur && umur <= 12) {
        pupukkandangsatuan = 500;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }
      if (13 <= umur && umur <= 17) {
        pupukkandangsatuan = 750;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }
      if (18 <= umur && umur <= 25) {
        pupukkandangsatuan = 1000;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }
    }

    ppkkering(int umur, int jumlah) {
      if (0 <= umur && umur <= 2) {
        pupukkeringsatuan = 10;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
      if (3 <= umur && umur <= 5) {
        pupukkeringsatuan = 25;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
      if (6 <= umur && umur < 8) {
        pupukkeringsatuan = 300;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
      if (8 <= umur && umur <= 12) {
        pupukkeringsatuan = 500;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
      if (13 <= umur && umur <= 17) {
        pupukkeringsatuan = 750;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
      if (18 <= umur && umur <= 25) {
        pupukkeringsatuan = 1000;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
    }

    ppkkimia(int umur, int jumlah) {
      if (1 <= umur && umur <= 5) {
        pupukkimiasatuan = 5;
        pupukkimia = umur * (jumlah * pupukkimiasatuan) * 0.01;
      }
      if (6 <= umur && umur <= 10) {
        pupukkimiasatuan = 10;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
      if (11 <= umur && umur <= 25) {
        pupukkimiasatuan = 5;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
    } 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: true,
          child: DoubleFiledparameter(
                  hint_01: "...bulan",
                  hint_02: "...jumlah tanaman",
                  fungsi: () {
                                var umur = int.parse(waktu.text);
            var jmltanaman = int.parse(jumlah.text);
                    setState(() {
                      ppkkandang(umur,jmltanaman);
                      ppkkering(umur, jmltanaman);
                      ppkkimia(umur, jmltanaman);
                    });
                  },
                  finaljudul: "Buah Naga",
                  controller2: jumlah,
                  controller: waktu,
                  judul: "Umur",
                  judul2: "Jumlah Tanaman",
                ),
        ),
        SizedBox(
          height: 20,
        ),
        Text("Pupuk Organik(pupuk kandang)"),
        SizedBox(
          height: 10,
        ),
        ResultCard(
          pupuk: "${pupukkandang == null ? '-' : pupukkandang}  Kg",
          title: "Pupuk Kandang",
          img: "pupuk kandang@4x.png",
        ),
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
                child: ResultCard(
              title: "Cair",
              pupuk:
                  "${pupukkimia == null ? '-' : pupukkimia}  Liter",
              img: "pupuk cair@4x.png",
            )),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: ResultCard(
              title: "Kering",
              pupuk: "${pupukkering == null ? '-' : pupukkering}  Kg",
              img: "pupuk kering@4x.png",
            ))
          ],
        ),
      ],
    );
  }
}
