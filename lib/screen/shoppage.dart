import 'package:flutter/material.dart';
import 'package:mobileagroapps/provider/cart_provider.dart';
import 'package:mobileagroapps/screen/shop/add_product.dart';
import 'package:mobileagroapps/screen/shop/cart_page.dart';
import 'package:mobileagroapps/screen/shop/unggah_gambar.dart';
import 'package:mobileagroapps/widget/shop/badge.dart';
import 'package:provider/provider.dart';

import '../widget/shop/productgrid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  var _showOnlyFavorites = false;

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
        actions: <Widget>[
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
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, UnggahGambar.routename);
              },
              icon: Icon(
                Icons.add,
                color: Colors.green,
              )),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  
                  // _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.green,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Pupuk'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Pakan'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text('Semua'),
                value: FilterOptions.All,
              ),
            ],
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
