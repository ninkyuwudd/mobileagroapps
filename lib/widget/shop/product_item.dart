import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/product_model.dart';
import 'package:mobileagroapps/screen/shop/detail_product.dart';
import 'package:provider/provider.dart';

class ProductItemsCard extends StatelessWidget {

  ProductItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailProductScreen.routename,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          // leading: Consumer<Product>(
          //   builder: (ctx, product, _) => IconButton(
          //         icon: Icon(
          //           product.isFavorite ? Icons.favorite : Icons.favorite_border,
          //         ),
          //         color: Theme.of(context).accentColor,
          //         onPressed: () {
          //           product.toggleFavoriteStatus();
          //         },
          //       ),
          // ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              // cart.addItem(product.id, product.price, product.title);
              // ScaffoldMessenger.of(context).hideCurrentSnackBar();
              // ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //           content: Text('Submit Data Successfully',textAlign: TextAlign.center,),
              //           backgroundColor: Colors.green,
              //           duration: Duration(seconds: 2),
              //           action: SnackBarAction(label: "UNDO", onPressed: (){
              //             cart.removeSingleItem(product.id);
              //           }),
              //           ),
              //     );
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}