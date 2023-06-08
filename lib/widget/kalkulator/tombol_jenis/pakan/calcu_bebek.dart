import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_result.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';
import 'package:mobileagroapps/widget/kalkulator/single_field_params.dart';
import 'package:mobileagroapps/widget/popup_warning.dart';

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
    return Column(
      children: [
        SingleFiledparameter(
          hint: "...bulan",
            fungsi: () {
              if(umurbebek.text.contains(",")){
                showDialog(context: context, builder: (context){
                  return PopupWarning(pesan: "tidak bisa mengunnakan koma (',')");
                });
              }else{
                int umur = int.parse(umurbebek.text);
              setState(() {
                if (1 <= umur && umur <= 12) {
                  em = 2900;
                  pr = "18-19";
                  lmk = 10;
                  kls = 0.9;
                  ffr = 0.45;
                } else if (12 <= umur && umur <= 22) {
                  em = 2900;
                  pr = "15-17";
                  lmk = 7;
                  kls = 1.0;
                  ffr = 0.4;
                } else if (umur >= 22) {
                  em = 2600;
                  pr = "16-18";
                  lmk = 4;
                  kls = 3.4;
                  ffr = 0.34;
                } else {
                  print("salah input");
                }
              });
              }
              
            },
            controller: umurbebek,
            judul: "Umur Bebek"),
        ResultDouble(
            value: em == null ? "-" : "${em.toString()} kkal/kg",
            value2: pr == null ? "-" : "$pr%",
            judul: "EM",
            gambar: "iconpakan/bebek.png",
            judul2: "Protein",
            gambar2: "iconpakan/bebek.png",
            kategori: ""),
        ResultDouble(
            value: lmk == null ? "-" : "${lmk.toString()}%",
            value2: kls == null ? "-" : "${kls.toString()}%",
            judul: "Lemak",
            gambar: "iconpakan/bebek.png",
            judul2: "Kalsium",
            gambar2: "iconpakan/bebek.png",
            kategori: ""),
            SizedBox(height: 20,),
          ResultCard(pupuk: ffr == null ? "-" :"${ffr.toString()}%", title: "Fosfor", img: "rumput@4x.png")
      ],
    );
  }
}
