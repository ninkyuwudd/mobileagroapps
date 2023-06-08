import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/double_result.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';
import 'package:mobileagroapps/widget/kalkulator/single_field_params.dart';

import '../../../popup_warning.dart';

class KalkulatorKuda extends StatefulWidget {
  const KalkulatorKuda({super.key});

  @override
  State<KalkulatorKuda> createState() => _KalkulatorKudaState();
}

class _KalkulatorKudaState extends State<KalkulatorKuda> {
  var beratkuda = TextEditingController();
  double hijau = 0;
  double jagung = 0;
  double bukil = 0;
  double tetes = 0;
  double jmlhpakan = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleFiledparameter(
          hint: " Kg",
          fungsi: () {
            var berat = double.parse(beratkuda.text);
            if (beratkuda.text.contains(",")) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return PopupWarning(
                        pesan: "tidak bisa mengunnakan koma (',')");
                  });
            } else {
              setState(() {
              hijau = ((1.8 / 100) * berat) * (35 / 100);
              jagung =
                  ((1.8 / 100) * berat) * (65 / 100) * (20 / 100) * (78 / 100);
              bukil = ((1.8 / 100) * berat) * (65 / 100) * (21.53 / 100);
              tetes = ((1.8 / 100) * berat) *
                  (65 / 100) *
                  (80 / 100) *
                  (78.47 / 100);
              jmlhpakan = hijau + jagung + bukil + tetes;
                
              });
            }
          },
          controller: beratkuda,
          judul: "Berat Kuda",
        ),
        SizedBox(height: 20),
        ResultDouble(
            value: hijau == 0 ? "-" : hijau.toStringAsFixed(1),
            value2: jagung == 0 ? "-" : jagung.toStringAsFixed(1),
            judul: "Hijau",
            gambar: "iconpakan/Rumput@4x.png",
            judul2: "Jagung",
            gambar2: "iconpakan/jaggung@4x.png",
            kategori: "Komposisi"),
        ResultDouble(
            value: bukil == 0 ? "-" : bukil.toStringAsFixed(1),
            value2: tetes == 0 ? "-" : tetes.toStringAsFixed(1),
            judul: "Bukil",
            gambar: "iconpakan/bukil.png",
            judul2: "Tetes",
            gambar2: "iconpakan/tetees2.png",
            kategori: " "),
        SizedBox(
          height: 15,
        ),
        ResultCard(
            pupuk: jmlhpakan == 0 ? "-" : "${jmlhpakan.toStringAsFixed(1)} Kg",
            title: "Jumlah Pakan",
            img: "bekatul@4x.png")
      ],
    );
  }
}
