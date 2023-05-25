import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  final firestoredb = FirebaseFirestore.instance.collection('users');
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