import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/toko_controller.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';


class TestToko extends StatefulWidget {
  const TestToko({super.key});

  @override
  State<TestToko> createState() => _TestTokoState();
}

class _TestTokoState extends State<TestToko> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final tokodata = Provider.of<TokoController>(context,listen: true);
      tokodata.fetchdatabyid("MWaQriWrMxasRnyitG5i");
    //  print(productdata.items.length);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(tokodata.nama)
          ],
        ),
      ),
      // body: Container(
      //     child: FutureBuilder<DocumentSnapshot>(
      //       future: FirebaseFirestore.instance
      //         .collection('toko')
      //         .doc("MWaQriWrMxasRnyitG5i")
      //         .get(),
         
      //       builder: (BuildContext context, AsyncSnapshot snapshot) {
      //         if(!snapshot.hasData){
      //           return CircularProgressIndicator();
      //         }
      //         var docdata = snapshot.data!.data();
      //         return ListTile(
      //           title: Text(docdata!['namatoko']),
      //         );
      //       },
      //     ),
      //   ),
    );
  }
}