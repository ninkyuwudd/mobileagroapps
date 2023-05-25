import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/order_controller.dart';
import 'package:mobileagroapps/widget/shop/order_item.dart';
import 'package:provider/provider.dart';


class OrderProductPage extends StatelessWidget {
  static const routename = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Orderproivder>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesanan Anda"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,i) => OrderItem(orderdata.Order[i]),
        itemCount: orderdata.Order.length,
        ),
    );
  }
}