import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  // List<ProdukModel> produkitem = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<ProductProvider>(context,listen: false).fetchdataproduct();
    
  }


  // fetchrecord() async {
  //   var records = await FirebaseFirestore.instance.collection("produk").get();
  //   maprecord(records);
  // }

  // maprecord(QuerySnapshot<Map<String, dynamic>> productdata) {
  //   var _items = productdata.docs
  //       .map((doc) => ProdukModel(
  //           id: doc.id,
  //           namaproduk: doc.data()["namaproduk"],
  //           deskripsi: doc.data()["deskripsi"],
  //           harga: doc.data()["harga"],
  //           idadmin: doc.data()["idadmin"],
  //           idjenisproduk: doc.data()["idjenisproduk"],
  //           jumlah: doc.data()["jumlah"],
  //           gambar: doc.data()["gambar"]))
  //       .toList();
  //   setState(() {
  //     produkitem = _items;
  //   });
  // }

//   FirebaseStorage firebaseFirestore = FirebaseStorage.instance;

//   Future<List> loadimage() async {
//     List<Map> files = [];
//     final ListResult result = await firebaseFirestore.ref('file/').listAll();
//     final List<Reference> allfiles = result.items;
//     await Future.forEach(allfiles, (Reference file) async {
//       final String fileurl = await file.getDownloadURL();
//       final String bckurl = file.name;
//       // final forestRef = firebaseFirestore.ref('folderbaru/${widget.usr_Login}/');
//       final metadata = await file.getMetadata();
//       final sizenya = metadata.size;

//       final timenya = metadata.timeCreated.toString();
// // Get metadata properties

//       files.add({
//         "url": fileurl,
//         "path": file.fullPath,
//         "name": bckurl,
//         "size": sizenya,
//         "date": timenya
//       });
//     });
//     print(files);
//     return files;
//   }

  @override
  Widget build(BuildContext context) {
    var loadproduk = Provider.of<ProductProvider>(context);

    try {
      return Container(
          margin: EdgeInsets.all(20),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: loadproduk.items.length,
              itemBuilder: (ctx, i) {
                try {
                  print(loadproduk.items[i].namaproduk);
                  print("mantab");
                  // final Map file = snapshot.data![i];
                  return ProductItemsCard(
                      namaproduk: loadproduk.items[i].namaproduk,
                      urlgambar: loadproduk.items[i].gambar,
                      id: loadproduk.items[i].id);
                } catch (e) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }));
    } catch (e) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}






// ChangeNotifierProvider.value(
//           value: products[i],
          
//           child: ProductItemsCard(),
          
//           ),