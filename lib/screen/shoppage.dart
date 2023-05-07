import 'package:flutter/material.dart';
import 'package:mobileagroapps/screen/shop/cart_page.dart';
import 'package:provider/provider.dart';

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
        title: Text("Toko",style: TextStyle(color: Colors.green),
        
        ),
        actions: [
          // Consumer(builder: (_,cart,ch) => Badge())
          IconButton(
              icon: Icon(
                Icons.shopping_cart,color: Colors.green,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartPage.routename);
              },
            ),
        ],
        ),
        
      body: ProductGrid(
        
      ),
    );
  }
}