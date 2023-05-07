import 'package:flutter/material.dart';
import 'package:mobileagroapps/provider/cart_provider.dart';
import 'package:mobileagroapps/provider/order_provider.dart';
import 'package:provider/provider.dart';

import '../../widget/shop/cart_item.dart';

class CartPage extends StatelessWidget {
  static const routename = '/cart';
  // const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Anda"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
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
                      Provider.of<Orderproivder>(context, listen: false).addorder(
                          cart.items.values.toList(), cart.totalamount);
                      cart.clear();
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
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => CartItemCard(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,),
                
                
            itemCount: cart.items.length,
          ))
        ],
      ),
    );
  }
}
