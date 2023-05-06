import 'package:flutter/material.dart';

import '../widget/shop/productgrid.dart';



class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Toko",style: TextStyle(color: Colors.green),),),
      body: ProductGrid(
        
      ),
    );
  }
}