import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';


class KalkulatorSemangka extends StatelessWidget {
  const KalkulatorSemangka({super.key});

  @override
  Widget build(BuildContext context) {
        var waktu = TextEditingController();
    var jumlah = TextEditingController();
    return DoubleFiledparameter(fungsi: (){

    },finaljudul: "Semangka",controller2: jumlah,controller:waktu ,judul:"Umur" ,judul2: "Jumlah Tanaman",);
  }
}