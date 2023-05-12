import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';


class KalkulatorSemangka extends StatefulWidget {
  const KalkulatorSemangka({super.key});

  @override
  State<KalkulatorSemangka> createState() => _KalkulatorSemangkaState();
}

class _KalkulatorSemangkaState extends State<KalkulatorSemangka> {
  @override
  Widget build(BuildContext context) {
        var waktu = TextEditingController();
    var jumlah = TextEditingController();
    return DoubleFiledparameter(fungsi: (){
      
    },finaljudul: "Semangka",controller2: jumlah,controller:waktu ,judul:"Umur" ,judul2: "Jumlah Tanaman",);
  }
}