import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';

class KalkulatorAnggur extends StatelessWidget {
  const KalkulatorAnggur({super.key});

  @override
  Widget build(BuildContext context) {
    var waktu = TextEditingController();
    var jumlah = TextEditingController();
    var pupuk_kandang ;
    var pupuk_kering ;
    return DoubleFiledparameter(
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
    );
  }
}
