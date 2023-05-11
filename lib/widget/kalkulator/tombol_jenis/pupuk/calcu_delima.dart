import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';


class KalkulatorDelima extends StatelessWidget {
  const KalkulatorDelima({super.key});

  @override
  Widget build(BuildContext context) {
        var waktu = TextEditingController();
    var jumlah = TextEditingController();
    return DoubleFiledparameter(fungsi: (){

    },finaljudul: "Delima",controller2: jumlah,controller:waktu ,judul:"Umur" ,judul2: "Jumlah Tanaman",);
  }
}