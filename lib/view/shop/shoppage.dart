import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/keranjang_controller.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/view/shop/cart_page_view.dart';
import 'package:mobileagroapps/view/shop/unggah_gambar.dart';
import 'package:mobileagroapps/widget/shop/badge.dart';
import 'package:provider/provider.dart';

import '../../widget/shop/productgrid.dart';

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
    var getdatauser = Provider.of<UserProvider>(context, listen: false);
    getdatauser.fethcdatauser();
    var getlist = getdatauser.akun;
    Provider.of<ProductProvider>(context,listen: false).filtertprodukoko(getlist[widget.idx].toko.toString());
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
              print(selectedValue.name);
              if (selectedValue == FilterOptions.pupuk) {
                getdataproduk.filterpupuk(getlist[widget.idx].toko.toString());
                print("ini pupuk");
              }
              else if (selectedValue == FilterOptions.pakan) {
                getdataproduk.filterpakan(getlist[widget.idx].toko.toString());
                print("ini pakan");
              }else if (selectedValue == FilterOptions.semua){
                getdataproduk.filtertprodukoko(getlist[widget.idx].toko.toString());
                print("ini semua");
              } 
              else {
                print("salah input filter");
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
