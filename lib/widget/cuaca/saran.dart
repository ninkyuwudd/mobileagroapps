import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cuaca_service.dart';

class SaranTernakKebun extends StatefulWidget {
  const SaranTernakKebun({super.key});

  @override
  State<SaranTernakKebun> createState() => _SaranTernakKebunState();
}

class _SaranTernakKebunState extends State<SaranTernakKebun> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CuacaProvider>(context, listen: false).getForecastCuaca();
  }

  @override
  Widget build(BuildContext context) {
    String pupuk = "";
    String pakan = "";
    return Consumer<CuacaProvider>(builder: (context, cuacaProvider, _) {
      final cuacabesok = cuacaProvider.cuacafrData!;
      avgcuacaharian(int awal, int akhir) {
        int count = 0;
        for (int i = awal; i <= akhir; i++) {
          String current = cuacabesok[i].weather[0]['description'];

          if (current.contains("hujan rintik-rintik")) {
            print("$current pada $i");
          } else if (current.contains("hujan")) {
            print("$current pada $i");
            count++;
          }
        }
        if (count >= 1) {
          print("hari ini akan terjadi hujan deras/sedang");
        } else {
          print("hari ini tidak terjadi hujan");
        }
        ;
        return count;
      }

      int total = 0;
      total += avgcuacaharian(0, 6);
      total += avgcuacaharian(7, 14);
      total += avgcuacaharian(15, 21);
      total += avgcuacaharian(22, 29);
      total += avgcuacaharian(30, 36);
      print(total);

      if (total >= 1) {
        print("sepertinya pake pupuk semprot dulu gan");
        pupuk = "pupuk semprot";
        pakan = "Rumput";
      } else {
        print("cuaca cerah lur, pupuk kandang cocok iki");
        pakan = "Fermentasi";
        pupuk = "pupuk kandang";
      }

      if (cuacabesok == null || cuacabesok.isEmpty) {
        return Text("Loading Saran....");
      }
      // final String kondisi = cuacabesok[0].weather[0]['description'];
      // final String kondisi2 = cuacabesok[7].weather[0]['description'];
      // final String kondisi3 = cuacabesok[15].weather[0]['description'];
      // final String kondisi4 = cuacabesok[23].weather[0]['description'];
      // final String kondisi5 = cuacabesok[31].weather[0]['description'];

      // if (kondisi.contains("hujan") &&
      //     kondisi2.contains("hujan") &&
      //     kondisi3.contains("hujan") &&
      //     kondisi4.contains("hujan") &&
      //     kondisi5.contains("hujan")) {
      //   print("pupuk semprot");
      // } else {
      //   print("pupuk kandang");
      // }
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromARGB(30, 76, 175, 79),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Peternakan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Text("Jenis Pakan"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pakan,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromARGB(30, 76, 175, 79),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Perkebunan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  // TextButton(onPressed: (){

                  // }, child: Text("cek saran")),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Text("Jenis Pupuk"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pupuk,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
