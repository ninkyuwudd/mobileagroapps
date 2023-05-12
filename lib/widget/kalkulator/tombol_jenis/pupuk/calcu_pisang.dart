import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';

class KalkulatorPisang extends StatefulWidget {
  const KalkulatorPisang({super.key});

  @override
  State<KalkulatorPisang> createState() => _KalkulatorPisangState();
}

class _KalkulatorPisangState extends State<KalkulatorPisang> {
    var waktu = TextEditingController();
    var jumlah = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var umur = int.parse(waktu.text);
    var jmltanaman = int.parse(jumlah.text);
    ppkkandang(int umur,int jumlah) {
      if (0 <= umur && umur <= 1) {
      
      }
      if (2 <= umur && umur <= 6) {

      }
    }
    ppkkering(int umur,int jumlah){
        if (0 <= umur && umur <= 1) {}
        if (2 <= umur && umur <= 12) {}
    }
    ppkkimia(int umur,int jumlah){
        if (1 <= umur && umur <= 6) {}
        if (7 <= umur && umur <= 8) {}
        if (7 <= umur && umur <= 8) {}
    }

    return DoubleFiledparameter(
      fungsi: () {
        ppkkandang(umur,jmltanaman);
        ppkkering(umur,jmltanaman);
        ppkkimia(umur,jmltanaman);


      },
      finaljudul: "Pisang",
      controller2: jumlah,
      controller: waktu,
      judul: "Umur",
      judul2: "Jumlah Tanaman",
    );
  }
}
