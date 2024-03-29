import 'package:flutter/material.dart';
import 'package:mobileagroapps/utils/images.dart';
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
      if (0 <= umur) {
        pupukkandangsatuan = 200;
        pupukkandang = umur * (jumlah * pupukkandangsatuan);
      }
    }

    ppkkering(int umur, int jumlah) {
      if (0 <= umur) {
        pupukkeringsatuan = 78;
        pupukkering = umur * (jumlah * pupukkeringsatuan);
      }
    }

    ppkkimia(int umur, int jumlah) {
      if (0 <= umur && umur < 12) {
        pupukkimiasatuan = 500;
        pupukkimia = umur * (jumlah * pupukkimiasatuan) * 0.01;
      }
      if (12 <= umur && umur < 36) {
        pupukkimiasatuan = 750;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
      if (36 <= umur) {
        pupukkimiasatuan = 1000;
        pupukkimia = umur * (jumlah * pupukkimiasatuan);
      }
    }

    return Column(
      children: [
        DoubleFiledparameter(
          hint_01: "...bulan",
          hint_02: "...jumlah tanaman",
          fungsi: () {
            setState(() {
              var umur = int.parse(waktu.text);
              var jmltanaman = int.parse(jumlah.text);
              ppkkandang(umur, jmltanaman);
              ppkkering(umur, jmltanaman);
              ppkkimia(umur, jmltanaman);
            });
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
            pupuk: pupukkandang == null ? "-" : "${pupukkandang.toString()} ml",
            title: "Pupuk Kandang",
            img: Images.pupuk_kandang),
        SizedBox(
          height: 20,
        ),
        ResultDouble(
            value: pupukkering == null ? "-" : "${pupukkering.toString()} ml",
            value2: pupukkimia == null ? "-" : "${pupukkimia.toString()} ml",
            judul: "kering",
            gambar: Images.pupuk_kering,
            judul2: "Cair",
            gambar2: Images.pupuk_cair,
            kategori: "Pupuk Kimia")
      ],
    );
  }
}
