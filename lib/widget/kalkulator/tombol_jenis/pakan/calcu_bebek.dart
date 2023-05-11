import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/single_field_params.dart';



class KalkulatorBebek extends StatefulWidget {
  const KalkulatorBebek({super.key});

  @override
  State<KalkulatorBebek> createState() => _KalkulatorBebekState();
}

class _KalkulatorBebekState extends State<KalkulatorBebek> {
  var umurbebek = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleFiledparameter(fungsi: (){
      
    }, controller: umurbebek, judul: "Umur Bebek");
  }
}