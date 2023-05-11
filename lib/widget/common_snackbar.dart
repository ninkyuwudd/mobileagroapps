import 'package:flutter/material.dart';

class CommonSnackbar extends StatelessWidget {
  const CommonSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Submit Data Successfully',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ));
    return Container();
  }
}
