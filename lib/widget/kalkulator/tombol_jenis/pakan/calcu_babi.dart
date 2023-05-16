import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';
import 'package:mobileagroapps/widget/kalkulator/single_field_params.dart';

class KalkulatorBabi extends StatefulWidget {
  const KalkulatorBabi({super.key});

  @override
  State<KalkulatorBabi> createState() => _KalkulatorBabiState();
}

class _KalkulatorBabiState extends State<KalkulatorBabi> {
  var beratbabi = TextEditingController();
  double? hasil;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleFiledparameter(
            fungsi: () {
              double berat = double.parse(beratbabi.text);

              setState(() {
                if (berat < 6.8) {
                  hasil = berat * (0.5 / 100);
                } else if (6.8 <= berat && berat <= 11.4) {
                  hasil = berat * (2 / 100);
                } else if (11.4 <= berat && berat <= 22.7) {
                  hasil = berat * (6 / 100);
                } else if (22.7 <= berat && berat <= 36.4) {
                  hasil = berat * (8 / 100);
                } else if (36.4 <= berat && berat <= 54.5) {
                  hasil = berat * (14 / 100);
                } else if (54.5 <= berat && berat <= 77.3) {
                  hasil = berat * (20 / 100);
                } else if (77.3 <= berat && berat < 109) {
                  hasil = berat * (33 / 100);
                }else{
                  hasil = berat * (40 /100);
                }
              },
              
              );
              print(hasil);
            },
            controller: beratbabi,
            judul: "Berat Babi"),

          SizedBox(height: 20,),
          ResultCard(pupuk:hasil == null ? "-" : hasil!.toStringAsFixed(1), title: "Jumlah Pakan", img: "pupuk kering@4x.png")
      ],
    );
  }
}
