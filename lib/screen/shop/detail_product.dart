import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:mobileagroapps/provider/cart_provider.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:mobileagroapps/screen/shop/cart_page.dart';
import 'package:mobileagroapps/screen/shop/order_product.dart';
import 'package:mobileagroapps/widget/shop/order_item.dart';
import 'package:provider/provider.dart';

class DetailProductScreen extends StatefulWidget {
  // const DetailProduct({super.key});
  static const routename = '/product_detail';

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final produkid = ModalRoute.of(context)?.settings.arguments as String;
    final load = Provider.of<ProductProvider>(context);
    // load.fetchdataproduct();
    final loadproduk =load.finbyid(produkid);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Product"),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height - 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  loadproduk.gambar,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rp${loadproduk.harga.toString()}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(loadproduk.namaproduk),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Deskripsi Produk",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(loadproduk.deskripsi),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.shop_2_outlined),
                      title: Text("Nama Toko"),
                      subtitle: Text("kota Bekasi"),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
           Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(OrderProductPage.routename);
                        cart.additem(
                            loadproduk.id, loadproduk.harga, loadproduk.namaproduk);
                        Navigator.of(context).pushNamed(CartPage.routename);
                      },
                      child: Text(
                        "Beli Langsung",
                        style: TextStyle(color: Colors.green),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 10,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print(loadproduk.id);
                          cart.additem(
                              loadproduk.id, loadproduk.harga, loadproduk.namaproduk);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Barang berhasil ditambahkan',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                              action: SnackBarAction(
                                  label: "UNDO",
                                  onPressed: () {
                                    cart.remosingleitem(loadproduk.id);
                                  }),
                            ),
                          );
                        },
                        child: Text("+ Keranjang"))
                  ],
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
