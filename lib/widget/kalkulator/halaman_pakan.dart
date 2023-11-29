import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobileagroapps/controller/kalkulator_controller.dart';
import 'package:mobileagroapps/utils/images.dart';

import 'package:mobileagroapps/widget/kalkulator/menu_hewan.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pakan/calcu_sapi.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pakan/calcu_babi.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pakan/calcu_bebek.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pakan/calcu_kambing.dart';
import 'package:mobileagroapps/widget/kalkulator/tombol_jenis/pakan/calcu_kuda.dart';
import 'package:provider/provider.dart';

class KalkulatorPakan extends StatefulWidget {
  final int idx;
  const KalkulatorPakan({super.key, required this.idx});

  @override
  State<KalkulatorPakan> createState() => _KalkulatorPakanState();
}

class _KalkulatorPakanState extends State<KalkulatorPakan> {
  @override
  Widget build(BuildContext context) {
    var halaman = Provider.of<KalkulatorController>(context);
    var pghewan = halaman.halaman_pakan;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                child: CircleMenu(
                  listmenu: [
                    Images.sapi,
                    Images.kuda,
                    Images.babi4x,
                    Images.bebek4x
                  ],
                  open: Images.kambing_1,
                  idx: widget.idx,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: pghewan == "kambing"
                    ? Kalkulatorkambing()
                    : pghewan == "sapi"
                        ? KalkulatorSapi()
                        : pghewan == "kuda"
                            ? KalkulatorKuda()
                            : pghewan == "babi"
                                ? KalkulatorBabi()
                                : pghewan == "bebek"
                                    ? KalkulatorBebek()
                                    : Container()),
          ],
        ),
      ),
    );
  }
}
