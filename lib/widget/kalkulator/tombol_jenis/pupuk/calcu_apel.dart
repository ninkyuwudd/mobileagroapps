import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';
import 'package:mobileagroapps/widget/kalkulator/double_result.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

class KalkulatorApel extends StatefulWidget {
  const KalkulatorApel({super.key});

  @override
  State<KalkulatorApel> createState() => _KalkulatorApelState();
}

class _KalkulatorApelState extends State<KalkulatorApel> {
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
      if (1 <= umur && umur < 15) {
        pupukkandangsatuan = 20;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }else{}
    }

    ppkkering(int umur, int jumlah) {
      if (1 <= umur && umur <= 20) {
        pupukkeringsatuan = 1;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }

    }

    ppkkimia(int umur, int jumlah) {
      if (1 <= umur && umur <= 12) {
        pupukkimiasatuan = 500;
        pupukkimia = umur * (jumlah * pupukkimiasatuan) * 0.01;
      }
      if (7 <= umur && umur <= 8) {
        pupukkimiasatuan = 1;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
      if (7 <= umur && umur <= 8) {
        pupukkimiasatuan = 2;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
    }

    return Column(
      children: [
        DoubleFiledparameter(
          hint_01: "...tahun",
          hint_02: "...jumlah",
          fungsi: () {
            var umur = int.parse(waktu.text);
            var jmltanaman = int.parse(jumlah.text);
            ppkkandang(umur, jmltanaman);
            ppkkering(umur, jmltanaman);
            ppkkimia(umur, jmltanaman);
          },
          finaljudul: "Apel",
          controller2: jumlah,
          controller: waktu,
          judul: "Umur",
          judul2: "Jumlah Tanaman",
        ),
        SizedBox(
          height: 20,
        ),
        ResultCard(
            pupuk: pupukkandang == null ? "-" : "${pupukkandang.toString()}kg",
            title: "Pupuk Kandang",
            img: "pupuk kandang@4x.png"),
        SizedBox(height: 20,),
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
