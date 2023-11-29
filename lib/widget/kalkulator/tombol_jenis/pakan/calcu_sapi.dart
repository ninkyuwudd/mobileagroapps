import 'package:flutter/material.dart';
import 'package:mobileagroapps/utils/images.dart';
import 'package:mobileagroapps/widget/kalkulator/double_field_params.dart';
import 'package:mobileagroapps/widget/kalkulator/double_result.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';
import 'package:mobileagroapps/widget/kalkulator/single_field_params.dart';

import '../../../popup_warning.dart';

class KalkulatorSapi extends StatefulWidget {
  const KalkulatorSapi({super.key});

  @override
  State<KalkulatorSapi> createState() => _KalkulatorSapiState();
}

class _KalkulatorSapiState extends State<KalkulatorSapi> {
  var berat = TextEditingController();
  double? hijauan;
  double? konsentrat;
  double? hijauankering;
  double? konsentratkering;
  hitungbasah(var berat) {
    setState(() {
      hijauan = (60 / 100) * ((10 / 100) * berat);
      konsentrat = (40 / 100) * ((10 / 100) * berat);
    });
  }

  hitungkering(var berat) {
    setState(() {
      hijauankering = (60 / 100) * ((3 / 100) * berat);
      konsentratkering = (40 / 100) * ((3 / 100) * berat);
    });
  }

  var kering;
  var basah;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleFiledparameter(
          hint: "Kg",
          fungsi: () {
            if (berat.text.contains(",")) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return PopupWarning(
                        pesan: "tidak bisa mengunnakan koma (',')");
                  });
            } else {
              print("gas");

              hitungbasah(int.parse(berat.text));
              hitungkering(int.parse(berat.text));
            }
          },
          controller: berat,
          judul: "Berat Sapi",
        ),
        SizedBox(height: 20),
        ResultDouble(
          value: hijauan == null ? "-" : hijauan!.toStringAsFixed(1),
          value2: hijauan == null ? "-" : konsentrat!.toStringAsFixed(1),
          judul: "Hijauan",
          judul2: "Konsentrat",
          gambar: Images.rumput4x,
          gambar2: Images.konsentrat,
          kategori: "Basah: 60:40",
        ),
        SizedBox(height: 20),
        ResultDouble(
            value: konsentrat == null ? "-" : hijauankering!.toStringAsFixed(1),
            value2:
                hijauan == null ? "-" : konsentratkering!.toStringAsFixed(1),
            judul: "Hijauan",
            gambar: Images.rumput4x,
            judul2: "Konsentrat",
            gambar2: Images.konsentrat,
            kategori: "Kering: 60:40"),
      ],
    );
  }
}
