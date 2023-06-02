import 'package:flutter/material.dart';

class RoundedButtonGreen extends StatelessWidget {
  final Function() fungsi;
  final String text;
  RoundedButtonGreen({super.key, required this.fungsi, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: fungsi,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 10),
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
        ));
  }
}
