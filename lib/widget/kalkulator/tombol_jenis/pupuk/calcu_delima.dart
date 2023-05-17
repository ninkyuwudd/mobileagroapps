import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';
import 'package:mobileagroapps/widget/kalkulator/double_result.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

class KalkulatorDelima extends StatefulWidget {
  const KalkulatorDelima({super.key});

  @override
  State<KalkulatorDelima> createState() => _KalkulatorDelimaState();
}

class _KalkulatorDelimaState extends State<KalkulatorDelima> {
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
      if (0 <= umur && umur <= 5) {
        pupukkandangsatuan = 200;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }

    }

    ppkkering(int umur, int jumlah) {
      if (0 <= umur && umur <= 5) {
        pupukkeringsatuan = 78;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }

    }

    ppkkimia(int umur, int jumlah) {
      if (0 <= umur && umur < 1) {
        pupukkimiasatuan = 500;
        pupukkimia = umur * (jumlah * pupukkimiasatuan) * 0.01;
      }
      if (1 <= umur && umur <= 3) {
        pupukkimiasatuan = 750;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
      if (3 <= umur && umur <= 5) {
        pupukkimiasatuan = 1000;
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
          finaljudul: "Delima",
          controller2: jumlah,
          controller: waktu,
          judul: "Umur",
          judul2: "Jumlah Tanaman",
        ),
        SizedBox(
          height: 20,
        ),
        ResultCard(
            pupuk: pupukkandang == null ? "-" : "${pupukkandang.toString()}ml",
            title: "Pupuk Kandang",
            img: "pupuk kandang@4x.png"),
        SizedBox(
          height: 20,
        ),
        ResultDouble(
            value: pupukkering == null ? "-" : "${pupukkering.toString()}ml",
            value2: pupukkimia == null ? "-" : "${pupukkimia.toString()} ml",
            judul: "kering",
            gambar: "pupuk kering@4x.png",
            judul2: "Cair",
            gambar2: "pupuk cair@4x.png",
            kategori: "Pupuk Kimia")
      ],
    );
  }
}
