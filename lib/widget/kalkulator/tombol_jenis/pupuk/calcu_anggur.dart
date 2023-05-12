import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

class KalkulatorAnggur extends StatefulWidget {
  const KalkulatorAnggur({super.key});

  @override
  State<KalkulatorAnggur> createState() => _KalkulatorAnggurState();
}

class _KalkulatorAnggurState extends State<KalkulatorAnggur> {
  var waktu = TextEditingController();
  var jumlah = TextEditingController();
  var pupuk_kandang;
  var pupuk_kering;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DoubleFiledparameter(
          fungsi: () {
            var umur = int.parse(waktu.text);
            var jmltanaman = int.parse(jumlah.text);
            if (0 <= umur && umur <= 2) {}
            if (3 <= umur && umur <= 5) {}
            if (6 <= umur && umur <= 8) {}
            if (9 <= umur && umur <= 12) {}
            if (13 <= umur && umur <= 17) {}
            if (18 <= umur && umur <= 25) {}
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
            pupuk: "${pupuk_kandang == null ? '-' : pupuk_kandang}  Kg/tanaman",
            title: "Pupuk Kandang",
            img: "pupuk kandang@4x.png"),
        SizedBox(
          height: 20,
        ),
        ResultCard(
            pupuk: "${pupuk_kering == null ? '-' : pupuk_kering}  Kg/tanaman",
            title: "Pupuk Kering",
            img: "pupuk kering@4x.png"),
      ],
    );
  }
}
