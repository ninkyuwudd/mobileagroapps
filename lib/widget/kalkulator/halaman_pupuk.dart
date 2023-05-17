import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/kalkulator_controller.dart';
import 'package:mobileagroapps/widget/kalkulator/menu_hewan.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pupuk/calcu_anggur.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pupuk/calcu_apel.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pupuk/calcu_buahnaga.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pupuk/calcu_delima.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pupuk/calcu_pisang.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pupuk/calcu_semangka.dart';
import 'package:provider/provider.dart';

class KalkulatorPupuk extends StatefulWidget {
  const KalkulatorPupuk({super.key});

  @override
  State<KalkulatorPupuk> createState() => _KalkulatorPupukState();
}

class _KalkulatorPupukState extends State<KalkulatorPupuk> {
  bool tampilkandang = false;
  bool tampilkebun = true;

  @override
  Widget build(BuildContext context) {
    var halaman = Provider.of<KalkulatorController>(context);
    var pgpupuk = halaman.halaman_pupuk;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //               Text(
            //   "Kalkulator pupuk",
            //   style: Theme.of(context).textTheme.titleLarge,
            // ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                child: CircleMenu(
                  listmenu: [
                    "anggur@4x.png",
                    "delima@4x.png",
                    "apel@4x.png",
                    "pisang@4x.png",
                    "semangka@4x.png"
                  ],
                  open: "buah naga@4x.png",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                child: pgpupuk == "anggur"
                    ? KalkulatorAnggur()
                    : pgpupuk == "delima"
                        ? KalkulatorDelima()
                        : pgpupuk == "apel"
                            ? KalkulatorApel()
                            : pgpupuk == "pisang"
                                ? KalkulatorPisang()
                                : pgpupuk == "semangka"
                                    ? KalkulatorSemangka()
                                    : pgpupuk == "buahnaga"
                                        ? KalkulatorBuahnaga()
                                        : Container())
          ],
        ),
      ),
    );
  }
}
