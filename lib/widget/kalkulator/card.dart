import 'package:flutter/material.dart';


class CardTips extends StatelessWidget {
  String nomor;
  String subs;
  CardTips({required this.nomor,required this.subs});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Text(nomor,style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(subs),
          ),
          Divider()
        ],
      ),
    );
  }
}