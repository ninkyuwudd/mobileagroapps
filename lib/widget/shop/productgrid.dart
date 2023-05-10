import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/product_model.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:mobileagroapps/widget/shop/product_item.dart';
import 'package:provider/provider.dart';

import '../../model/produkmodel.dart';


class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {

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
    final productdata = Provider.of<ProductProvider>(context);
    // productdata.fetchdataproduct();
    final products = productdata.items;
    return Container(
      margin: EdgeInsets.all(20),
      child: GridView.builder(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ), 
        
        itemCount: produkitem.length,
        itemBuilder:(ctx,i ) {
          return Container(
            child: ListTile(
              title: Text(produkitem[i].namaproduk),
              subtitle: Text(produkitem[i].deskripsi),
            )
          );
        }
          ),
    );
  }
}






// ChangeNotifierProvider.value(
//           value: products[i],
          
//           child: ProductItemsCard(),
          
//           ),