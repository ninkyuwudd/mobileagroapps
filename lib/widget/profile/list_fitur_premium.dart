import 'package:flutter/material.dart';

class FiturListPremium extends StatelessWidget {
  final String judul;
FiturListPremium({required this.judul});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.amber,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            judul,
            overflow: TextOverflow.fade,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
