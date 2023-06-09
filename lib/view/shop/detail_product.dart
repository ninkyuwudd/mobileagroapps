import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:mobileagroapps/controller/keranjang_controller.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/controller/toko_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/view/shop/cart_page_view.dart';
import 'package:mobileagroapps/view/shop/order_product.dart';
import 'package:mobileagroapps/view/shop/perbayaran_view.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final produkid = ModalRoute.of(context)?.settings.arguments as String;
      final load = Provider.of<ProductProvider>(context, listen: false);
      final loadproduk = load.finbyid(produkid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    final loadtoko = Provider.of<TokoController>(context,listen: true);

    final produkid = ModalRoute.of(context)?.settings.arguments as String;

    final load = Provider.of<ProductProvider>(context);

    final loadproduk = load.finbyid(produkid);
    // String tokoid = loadproduk.idtoko;
    // loadtoko.fetchdatabyid(tokoid);
    // print(loadproduk.idtoko);
    
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
                    Text(
                      loadproduk.namaproduk,
                      style: TextStyle(fontSize: 17),
                    ),

                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Tersedia: ${loadproduk.jumlah}"),
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
                      // leading: Image(image: NetworkImage(gettoko.gambar)),
                      title: Text(loadtoko.nama),
                      // subtitle: Text(gettoko.alamat),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cart.additem(loadproduk.id, loadproduk.harga,
                          loadproduk.namaproduk);
                      cart.addIdPesananSementara(cart.items.values.toList()[0].id);
                      Navigator.pushReplacementNamed(
                              context, Pembayaran.routename,
                              arguments: cart.totalamount);
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
                        cart.additem(loadproduk.id, loadproduk.harga,
                            loadproduk.namaproduk);
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
