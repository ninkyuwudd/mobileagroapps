import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/single_field_params.dart';



class KalkulatorBebek extends StatefulWidget {
  const KalkulatorBebek({super.key});

  @override
  State<KalkulatorBebek> createState() => _KalkulatorBebekState();
}

class _KalkulatorBebekState extends State<KalkulatorBebek> {
  var umurbebek = TextEditingController();
  var em;
  var pr;
  var lmk;
  var kls;
  var ffr;
  @override
  Widget build(BuildContext context) {
    int umur = int.parse(umurbebek.text);
    return SingleFiledparameter(fungsi: (){
      if(1 <= umur && umur <= 12){
        em = 2900;
        pr = "18-19";
        lmk = 10;
        kls = 0.9;
        ffr = 0.45;
      }else if(12 <= umur && umur <= 22){
        em = 2900;
        pr = "15-17";
        lmk = 7;
        kls = 1.0;
        ffr = 0.4;
      }else if(umur >= 22){
        em = 2600;
        pr = "16-18";
        lmk = 4;
        kls = 3.4;
        ffr = 0.34;
      }else{
        print("salah input");
      }
    }, controller: umurbebek, judul: "Umur Bebek");
  }
}