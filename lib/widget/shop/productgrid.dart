import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/product_model.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:mobileagroapps/widget/shop/product_item.dart';
import 'package:provider/provider.dart';


class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  
  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<ProductProvider>(context);
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
        itemCount: products.length,
        itemBuilder:(ctx,i) => ChangeNotifierProvider.value(
          value: products[i],
          
          child: ProductItemsCard(),
          
          )),
    );
  }
}