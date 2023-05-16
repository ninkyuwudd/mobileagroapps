import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';
import 'package:mobileagroapps/widget/kalkulator/double_result.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';
import 'package:mobileagroapps/widget/kalkulator/single_field_params.dart';

class KalkulatorSapi extends StatefulWidget {
  const KalkulatorSapi({super.key});

  @override
  State<KalkulatorSapi> createState() => _KalkulatorSapiState();
}

class _KalkulatorSapiState extends State<KalkulatorSapi> {
  var berat = TextEditingController();
  double? hijauan;
  double? konsentrat;
  double? hijauankering;
  double? konsentratkering;
  hitungbasah(var berat) {
    hijauan = (60 / 100) * ((10 / 100) * berat);
    konsentrat = (40 / 100) * ((10 / 100) * berat);
  }

  hitungkering(var berat) {
    hijauankering = (60 / 100) * ((3 / 100) * berat);
    konsentratkering = (40 / 100) * ((3 / 100) * berat);
  }

  var kering;
  var basah;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleFiledparameter(
          fungsi: () {
            hitungbasah(int.parse(berat.text));
            hitungkering(int.parse(berat.text));
          },
          controller: berat,
          judul: "Berat Sapi",
        ),
        SizedBox(height: 20),
        ResultDouble(
          value: hijauan == null ? "-" : hijauan!.toStringAsFixed(1),
          value2: hijauan == null ? "-" : konsentrat!.toStringAsFixed(1),
          judul: "Hijauan",
          judul2: "Konsentrat",
          gambar: "pupuk kering@4x.png",
          gambar2: "pupuk kering@4x.png",
          kategori: "Basah: 60:40",
        ),
        SizedBox(height: 20),
        ResultDouble(
            value: konsentrat == null ? "-" : hijauankering!.toStringAsFixed(1),
            value2:
                hijauan == null ? "-" : konsentratkering!.toStringAsFixed(1),
            judul: "Hijauan",
            gambar: "pupuk kering@4x.png",
            judul2: "Konsentrat",
            gambar2: "pupuk kering@4x.png",
            kategori: "Kering: 60:40"),
      ],
    );
  }
}
