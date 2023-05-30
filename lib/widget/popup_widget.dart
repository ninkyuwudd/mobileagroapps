import 'package:flutter/material.dart';


class Popup extends StatelessWidget {
  final Function() yesfunc;
  final Function() nofunc;
  Popup({super.key, required this.yesfunc, required this.nofunc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Peringatan !"),
      content: Text("Apakah anda yakin ?"),
      actions: [
        ElevatedButton(onPressed: yesfunc, child: Text("yes")),
        ElevatedButton(onPressed: nofunc, child: Text("no"))
      ],
    );
  }
}