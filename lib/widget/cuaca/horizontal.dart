import 'package:flutter/material.dart';



class Horizontal extends StatelessWidget {
  const Horizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text("niceeeeeee"),
          Text("niceeeeeee"),
          Text("niceeeeeee"),
          Text("niceeeeeee"),
          Text("niceeeeeee"),
          Text("niceeeeeee"),
          Text("niceeeeeee"),
          Text("niceeeeeee"),
        ],
      ),
    );
  }
}