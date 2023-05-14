import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/result_card.dart';


class ResultDouble extends StatelessWidget {
  final String kategori;
  final String value;
  final String value2;
  final String judul;
  final String judul2;
  final String gambar;
  final String gambar2;
  const ResultDouble({required this.value, required this.value2, required this.judul, required this.gambar, required this.judul2, required this.gambar2, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Text(kategori),
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(child: ResultCard(pupuk: "$value Kg", title: judul, img: gambar)),
            SizedBox(width: 10,),
            Expanded(child: ResultCard(pupuk: "$value2 Kg", title: judul2, img: gambar)),
          ],
        ),
      ],
    );
  }
}