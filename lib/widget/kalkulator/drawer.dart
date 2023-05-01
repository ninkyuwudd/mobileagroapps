import 'package:flutter/material.dart';

class DrawerCalc extends StatelessWidget {
  const DrawerCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Kalkulator Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("images/bg_calcu.jpg"),
                     fit: BoxFit.cover)
              ),
            ),
            ListTile(
              
              title: Text('Kalkulator Pupuk',style: Theme.of(context).textTheme.titleMedium,),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Kalkulator Pakan'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Tips"),
            )
          ],
        ),
      );
  }
}
