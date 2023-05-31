import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileagroapps/controller/keranjang_controller.dart';
import 'package:mobileagroapps/controller/order_controller.dart';
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
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total'),
                    Spacer(),
                    Chip(
                      label: Text(
                        '\Rp${cart.totalamount}',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                      onPressed: () {
                        // dborder.doc().set({
                        //   "idcustomer": loaduser.curuserid,
                        //   "idproduk": cart.items.keys.toList(),
                        //   "date": DateFormat.yMMMd().format(DateTime.now())
                        // });
                        if (cart.totalamount != 0) {
                          // cart.clearIdPesananSementara();
                          for(var x = 0; x < cart.items.length; x ++){
                            
                            cart.addIdPesananSementara(cart.items.values.toList()[x].id);
                          }
                          print(cart.pesanansemetara);
                          Navigator.pushReplacementNamed(
                              context, Pembayaran.routename,
                              arguments: cart.totalamount);
                        } else {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Tidak ada pesanan !',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Color.fromARGB(255, 208, 77, 77),
                              duration: Duration(seconds: 2)));
                        }

                        // Provider.of<Orderproivder>(context, listen: false)
                        //     .addorder(
                        //         cart.items.values.toList(), cart.totalamount);
                        // cart.clear();
                      },
                      child: Text("ORDER NOW"),
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
              itemBuilder: (ctx, i) =>
                CartItemCard(
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
