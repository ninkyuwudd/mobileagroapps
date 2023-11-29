import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String pupuk;
  final String title;
  final String img;
  ResultCard({required this.pupuk, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(70, 100, 100, 100),
                offset: const Offset(
                  1.0,
                  5.0,
                ),
                blurRadius: 7.0,
                spreadRadius: 1.0,
              ),
            ]),
        child: ListTile(
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(pupuk),
          trailing: Image(
            image: AssetImage(img),
            width: 40,
          ),
        ));
  }
}
