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
    var cek = Provider.of<UserProvider>(context, listen: false).fethcdatauser();
  }

  String filter = "";

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
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.pupuk) {
                setState(() {
                  getdataproduk.gantifilter("pupuk");
                  getdataproduk.filterpupuk();
                  filter = "pupuk";
                });
                print("ini pupuk");
                // _showOnlyFavorites = true;
              }
              if (selectedValue == FilterOptions.pakan) {
                setState(() {
                  getdataproduk.gantifilter("pakan");
                  getdataproduk.filterpakan();
                  filter = "pakan";
                });
                print("ini pakan");

                // _showOnlyFavorites = true;
              } else {
                getdataproduk.gantifilter("semua");
                getdataproduk.filtertprodukoko(getlist[widget.idx].toko.toString());
                print("ini semua");
                setState(() {
                  filter = "semua";
                });
              }
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
      body: ProductGrid(cekfilter: filter,),
    );
  }
}
