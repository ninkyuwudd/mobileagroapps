import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/single_field_params.dart';

class KalkulatorKuda extends StatefulWidget {
  const KalkulatorKuda({super.key});

  @override
  State<KalkulatorKuda> createState() => _KalkulatorKudaState();
}

class _KalkulatorKudaState extends State<KalkulatorKuda> {
  var beratkuda = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleFiledparameter(fungsi: (){
      print(beratkuda);
    }, controller: beratkuda,judul: "Berat Kuda",);
  }
}