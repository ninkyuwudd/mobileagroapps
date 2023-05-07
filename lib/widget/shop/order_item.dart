import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/order_model.dart';


class OrderItem extends StatelessWidget {
  final OrderModel order;
  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("${order.jumlah}"),
            subtitle: Text(DateFormat.yMMMd().format(order.dateTime)),
            trailing: IconButton(
              onPressed: (){},
              icon: Icon(Icons.expand_more),
            ),
          )
        ],
      ),
    );
  }
}