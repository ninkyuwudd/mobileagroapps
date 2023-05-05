import 'package:flutter/material.dart';



class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Lokasi"),),
      body: Container(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}