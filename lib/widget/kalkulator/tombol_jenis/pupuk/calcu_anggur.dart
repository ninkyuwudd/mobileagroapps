import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';
import 'package:mobileagroapps/widget/kalkulator/double_result.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

class KalkulatorAnggur extends StatefulWidget {
  const KalkulatorAnggur({super.key});

  @override
  State<KalkulatorAnggur> createState() => _KalkulatorAnggurState();
}

class _KalkulatorAnggurState extends State<KalkulatorAnggur> {
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

    return Column(
      children: [
        DoubleFiledparameter(
          fungsi: () {
            var umur = int.parse(waktu.text);
            var jmltanaman = int.parse(jumlah.text);
            ppkkandang(umur, jmltanaman);
            ppkkering(umur, jmltanaman);
            ppkkimia(umur, jmltanaman);
          },
          finaljudul: "Anggur",
          controller2: jumlah,
          controller: waktu,
          judul: "Umur",
          judul2: "Jumlah Tanaman",
        ),
        SizedBox(
          height: 20,
        ),
        ResultCard(
            pupuk: pupukkandang == null ? "-" : "${pupukkandang.toString()}gr",
            title: "Pupuk Kandang",
            img: "pupuk kandang@4x.png"),
        SizedBox(
          height: 20,
        ),
        ResultDouble(
            value: pupukkering == null ? "-" : "${pupukkering.toString()}gr",
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
