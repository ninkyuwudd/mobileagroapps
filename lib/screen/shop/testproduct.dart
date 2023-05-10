import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/produkmodel.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../../model/product_model.dart';


class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  List<ProdukModel> produkitem = [];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchrecord();
  }

  fetchrecord() async {
    var records = await  FirebaseFirestore.instance.collection("produk").get();
    maprecord(records);
  }

  maprecord(QuerySnapshot<Map<String, dynamic>> productdata){
       var _items = productdata.docs
        .map((doc) => ProdukModel(
          id: doc.id, 
          namaproduk: doc.data()["namaproduk"], 
          deskripsi: doc.data()["deskripsi"], 
          harga: doc.data()["harga"], 
          idadmin: doc.data()["idadmin"], 
          idjenisproduk: doc.data()["idjenisproduk"], 
          jumlah: doc.data()["jumlah"]))
        .toList();
        setState(() {
          produkitem = _items;
        });
  }

  @override
  Widget build(BuildContext context) {
    // var loadproduk = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: ListView.builder(
        itemCount: produkitem.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(produkitem[index].namaproduk ),
            subtitle: Text(produkitem[index].deskripsi ),
          );
        }),
    );
  }
}