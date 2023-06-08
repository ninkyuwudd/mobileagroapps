import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';
import 'package:mobileagroapps/widget/kalkulator/double_result.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

class KalkulatorSemangka extends StatefulWidget {
  const KalkulatorSemangka({super.key});

  @override
  State<KalkulatorSemangka> createState() => _KalkulatorSemangkaState();
}

class _KalkulatorSemangkaState extends State<KalkulatorSemangka> {
  var waktu = TextEditingController();
  var jumlah = TextEditingController();
  var pupukkandang;
  var pupukkandangsatuan;
  var pupukkering;
  var pupukkeringsatuan;
  var pupukkimia;
  var pupukkimiasatuan;
  @override
  Widget build(BuildContext context) {
    ppkkandang(int umur, int jumlah) {
      if (1 <= umur && umur <= 2) {
        pupukkandangsatuan = 1;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }
      if (2 <= umur && umur <= 15) {
        pupukkandangsatuan = 1.5;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }
    }

    ppkkering(int umur, int jumlah) {
      if (0 <= umur && umur <= 7) {
        pupukkeringsatuan = 4.5;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
      if (8 <= umur && umur <= 14) {
        pupukkeringsatuan = 8.5;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
      if (15 <= umur && umur <= 21) {
        pupukkeringsatuan = 27.5;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
      if (22 <= umur && umur <= 35) {
        pupukkeringsatuan = 21;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
      if (36 <= umur && umur <= 120) {
        pupukkeringsatuan = 10;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
    }

    ppkkimia(int umur, int jumlah) {
      if (1 <= umur && umur <= 6) {
        pupukkimiasatuan = 300;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
      if (7 <= umur && umur <= 8) {
        pupukkimiasatuan = 400;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
      if (7 <= umur && umur <= 8) {
        pupukkimiasatuan = 500;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
    }

    return Column(
      children: [
        DoubleFiledparameter(
          hint_01: "...hari",
          hint_02: "...jumlah",
          fungsi: () {
            var umur = int.parse(waktu.text);
            var jmltanaman = int.parse(jumlah.text);
            ppkkandang(umur, jmltanaman);
            ppkkering(umur, jmltanaman);
            ppkkimia(umur, jmltanaman);
          },
          finaljudul: "Semangka",
          controller2: jumlah,
          controller: waktu,
          judul: "Umur",
          judul2: "Jumlah Tanaman",
        ),
        SizedBox(height: 20,),
        ResultCard(
            pupuk: pupukkandang == null ? "-" : "${pupukkandang.toString()}kg",
            title: "Pupuk Kandang",
            img: "pupuk kandang@4x.png"),
        SizedBox(
          height: 20,
        ),
        ResultDouble(

            value: pupukkering == null ? "-" : "${pupukkering.toString()}kg",
            value2: pupukkimia == null ? "-" : "${pupukkimia.toString()} liter",
            judul: "kering",
            gambar: "pupuk kering@4x.png",
            judul2: "Cair",
            gambar2: "pupuk cair@4x.png",
            kategori: "Pupuk Kimia")
      ],
    );
  }
}
