import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';


class KalkulatorPisang extends StatelessWidget {
  const KalkulatorPisang({super.key});

  @override
  Widget build(BuildContext context) {
        var waktu = TextEditingController();
    var jumlah = TextEditingController();
    return DoubleFiledparameter(fungsi: (){

    },finaljudul: "Pisang",controller2: jumlah,controller:waktu ,judul:"Umur" ,judul2: "Jumlah Tanaman",);
  }
}