import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';


class KalkulatorSapi extends StatefulWidget {
  const KalkulatorSapi({super.key});

  @override
  State<KalkulatorSapi> createState() => _KalkulatorSapiState();
}

class _KalkulatorSapiState extends State<KalkulatorSapi> {
  var berat = TextEditingController();
  var jumlah = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DoubleFiledparameter(finaljudul: "Sapi", fungsi: (){

        }, controller: berat, controller2: jumlah, judul: "Berat Sapi", judul2: "Jumlah ")
      ],
    );
  }
}