import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/keranjang_controller.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/screen/shop/cart_page.dart';
import 'package:mobileagroapps/screen/shop/unggah_gambar.dart';
import 'package:mobileagroapps/widget/shop/badge.dart';
import 'package:provider/provider.dart';

import '../widget/shop/productgrid.dart';

enum FilterOptions { pupuk, pakan, semua }

class ShopPage extends StatefulWidget {
  final int idx;
  const ShopPage({super.key, required this.idx});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  var _showOnlyFavorites = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cek = 
    Provider.of<UserProvider>(context, listen: false).fethcdatauser();
  }

  @override
  Widget build(BuildContext context) {
    var getdatauser = Provider.of<UserProvider>(context, listen: false);
    var getlist = getdatauser.akun;
    var getdataproduk = Provider.of<ProductProvider>(context);
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
          Visibility(
            visible: getlist[widget.idx].status == "user" ? false : true,
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, UnggahGambar.routename);
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.green,
                )),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.pupuk) {
                  getdataproduk.gantifilter("pupuk");
                  // _showOnlyFavorites = true;
                }
                if (selectedValue == FilterOptions.pakan) {
                  getdataproduk.gantifilter("pakan");
                  // _showOnlyFavorites = true;
                } else {
                  getdataproduk.gantifilter("semua");
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
                value: FilterOptions.pupuk,
              ),
              PopupMenuItem(
                child: Text('Pakan'),
                value: FilterOptions.pakan,
              ),
              PopupMenuItem(
                child: Text('Semua'),
                value: FilterOptions.semua,
              ),
            ],
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
