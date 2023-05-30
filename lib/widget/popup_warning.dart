import 'package:flutter/material.dart';


class PopupWarning extends StatelessWidget {
  final String pesan;
  PopupWarning({super.key,required this.pesan});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Peringatan !"),
      content: Text(pesan),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("oke")),
      ],
    );
  }
}