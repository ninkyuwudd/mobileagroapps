import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/product_model.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/widget/shop/product_item.dart';
import 'package:provider/provider.dart';

import '../../model/produkmodel.dart';

class ProductGrid extends StatefulWidget {
  final String cekfilter;
  ProductGrid({super.key, required this.cekfilter});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  // List<ProdukModel> produkitem = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print(widget.cekfilter);
    // filterfunc();
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
              itemCount: loadproduk.items.where((item) => item.jumlah != 0).length,
              itemBuilder: (ctx, i) {
                final filteredItems = loadproduk.items.where((item) => item.jumlah != 0).toList();
                try {
                  return ProductItemsCard(
                      namaproduk: filteredItems[i].namaproduk,
                      urlgambar: filteredItems[i].gambar,
                      id: filteredItems[i].id,
                    );
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
