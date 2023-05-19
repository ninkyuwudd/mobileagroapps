import 'package:flutter/material.dart';



class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final Function() fungsi;
  RoundedButtonWidget({super.key, required this.text, required this.fungsi});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: fungsi,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10, right: 25, left: 25, bottom: 10),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 225, 0),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.all_inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text(text),
                        const Spacer(),
                        Image(image: AssetImage("images/right_row_icon.png")),
                      ],
                    ),
                  ),
                );
  }
}