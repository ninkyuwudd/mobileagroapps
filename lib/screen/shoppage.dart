import 'package:flutter/material.dart';
import 'package:mobileagroapps/provider/cart_provider.dart';
import 'package:mobileagroapps/screen/shop/add_product.dart';
import 'package:mobileagroapps/screen/shop/cart_page.dart';
import 'package:mobileagroapps/widget/shop/badge.dart';
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
        title: Text(
          "Toko",
          style: TextStyle(color: Colors.green),
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, ch) =>
                BadgeCart(child: ch!, value: cart.itemcount.toString()),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartPage.routename);
              },
            ),
          ),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, AddProductPage.routename);
          }, icon: Icon(Icons.add,color: Colors.green,))
        ],
      ),
      body: ProductGrid(),
    );
  }
}
