import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';

class KalkulatorApel extends StatelessWidget {
  const KalkulatorApel({super.key});

  @override
  Widget build(BuildContext context) {
    var waktu = TextEditingController();
    var jumlah = TextEditingController();
    return Column(
      children: [
        DoubleFiledparameter(
          fungsi: () {},
          finaljudul: "Apel",
          controller2: jumlah,
          controller: waktu,
          judul: "Umur",
          judul2: "Jumlah Tanaman",
        ),
                SizedBox(
          height: 20,
        ),
        // ResultCard(
        //     pupuk: "${ == null ? '-' : }  Kg/tanaman",
        //     title: "Pupuk Kandang",
        //     img: "pupuk kandang@4x.png"),
        SizedBox(
          height: 20,
        ),
        // ResultCard(
        //     pupuk: "${pupuk_kering == null ? '-' : pupuk_kering}  Kg/tanaman",
        //     title: "Pupuk Kering",
        //     img: "pupuk kering@4x.png"),
      ],
    );
    
  }
}
