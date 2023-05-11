import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/single_field_params.dart';

class KalkulatorKuda extends StatefulWidget {
  const KalkulatorKuda({super.key});

  @override
  State<KalkulatorKuda> createState() => _KalkulatorKudaState();
}

class _KalkulatorKudaState extends State<KalkulatorKuda> {
  var beratkuda = TextEditingController();
  var hijau ;
  var jagung;
  var bukil;
  var tetes;
  var jmlhpakan;
  @override
  Widget build(BuildContext context) {
    return SingleFiledparameter(fungsi: (){
      int berat = int.parse(beratkuda.text);
      hijau = ((1.8/100) * berat) * (35/100);
      jagung = ((1.8/100) * berat) * (65/100) * (20/100) * (78/100);
      bukil =((1.8/100) * berat) * (65/100) * (21.53/100);
      tetes = ((1.8/100) * berat) * (65/100) * (80/100) * (78.47/100);
      jmlhpakan = hijau + jagung + bukil + tetes;
    }, controller: beratkuda,judul: "Berat Kuda",);
  }
}