import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/keranjang_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/view/shop/perbayaran_view.dart';
import 'package:provider/provider.dart';

import '../../widget/shop/cart_item.dart';

class CartPage extends StatelessWidget {
  static const routename = '/cart';
  // const CartPage({super.key});
  final dbproduk = FirebaseFirestore.instance.collection('produk');
  final dbcustomer = FirebaseFirestore.instance.collection("users");
  final dborder = FirebaseFirestore.instance.collection("order");
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final loaduser = Provider.of<UserProvider>(context);
    loaduser.fethcdatauser;
    final akunnya = loaduser.akun;
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Anda"),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    
                    Chip(
                      label: Text(
                        '\Rp${cart.totalamount}',
                        style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,
                    ),
                    Container(
                      width: 200,
                      child: GestureDetector(
                          onTap: () {
                            if (cart.totalamount != 0 && cart.items.length != cart.pesanansemetara.length) {
                              // cart.clearIdPesananSementara();
                              for (var x = 0; x < cart.items.length; x++) {
                                cart.addIdPesananSementara(
                                    cart.items.values.toList()[x].id);
                              }
                              print(cart.pesanansemetara);
                              Navigator.pushNamed(
                                  context, Pembayaran.routename,
                                  arguments: cart.totalamount);
                            }else if(cart.totalamount != 0 && cart.items.length == cart.pesanansemetara.length){
                              print("lanjut");
                              Navigator.pushNamed(
                                  context, Pembayaran.routename,
                                  arguments: cart.totalamount);
                              print(cart.pesanansemetara);
                            }
                          else {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    'Tidak ada pesanan !',
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 208, 77, 77),
                                  duration: Duration(seconds: 2)));
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                                left: 25),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Pesan Sekarang",
                              style: TextStyle(color: Colors.white),
                            )),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Barang yang dibeli",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (ctx, i) => CartItemCard(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
              itemCount: cart.items.length,
            ))
          ],
        ),
      ),
    );
  }
}
