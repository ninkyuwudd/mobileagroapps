import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/keranjang_controller.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';

class CartItemCard extends StatelessWidget {
  final String id;
  final String productId;
  final int price;
  final int quantity;
  final String title;
  const CartItemCard(
      this.id, this.productId, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final load = Provider.of<ProductProvider>(context);

    final loadproduk = load.finbyid(productId);


    return Dismissible(
        key: ValueKey(id),
              background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete,color: Colors.white,size: 40,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin:  EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
        return showDialog(context: context, builder: (ctx) => AlertDialog(
          title: Text("Apa anda yakin"),
          content: Text("Apakah anda ingin mengahapus barang dari keranjang?"),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop(false);
            }, child: Text("Tidak")),
            TextButton(onPressed: (){
              Navigator.of(context).pop(true);
            }, child: Text("Ya")),
          ],
        ));
      },
      onDismissed: (direction){
        Provider.of<CartProvider>(context,listen: false).removeitem(productId,);
      },
        child: Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Padding(
              padding: EdgeInsets.all(8),
              child:               Container(
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(height: 10,),
            Text("Total : ${(price * quantity)}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      Row(
        children: [
          IconButton(onPressed: (){
            cart.minusitem(loadproduk.id, loadproduk.harga,
                            loadproduk.namaproduk);
          }, icon: Icon(Icons.remove,color: Colors.green,)),
          Text("$quantity",style: TextStyle(fontWeight: FontWeight.bold),),
          IconButton(onPressed: (){
            cart.additem(loadproduk.id, loadproduk.harga,
                            loadproduk.namaproduk);
          }, icon: Icon(Icons.add,color: Colors.green,)),
        ],
      ),
    ],
  ),
),

              // ListTile(
              //   leading: CircleAvatar(
              //     child: Padding(
              //         padding: EdgeInsets.all(5),
              //         child: FittedBox(child: Text("\$$price"))),
              //   ),
              //   title: Text(title),
              //   subtitle: Text("Total : ${(price * quantity)}"),
              //   trailing: Text("$quantity"),
                
              // ),
            )));
  }
}
